import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  static final DatabaseHelper instance = DatabaseHelper._init();
  static Database? _database;

  DatabaseHelper._init();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB('tajwid_app.db');
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);
    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  Future _createDB(Database db, int version) async {
    await db.execute('''
      CREATE TABLE quiz_results (
        id          INTEGER PRIMARY KEY AUTOINCREMENT,
        tajwid_bab  TEXT NOT NULL,
        score       INTEGER NOT NULL,
        total       INTEGER NOT NULL,
        percentage  REAL NOT NULL,
        xp_earned   INTEGER NOT NULL DEFAULT 0,
        date_taken  TEXT NOT NULL
      )
    ''');

    await db.execute('''
      CREATE TABLE modul_selesai (
        id            INTEGER PRIMARY KEY AUTOINCREMENT,
        modul_name    TEXT NOT NULL UNIQUE,
        date_selesai  TEXT NOT NULL
      )
    ''');

    await db.execute('''
      CREATE TABLE bookmarks (
        id          INTEGER PRIMARY KEY AUTOINCREMENT,
        title       TEXT NOT NULL UNIQUE,
        arabic      TEXT NOT NULL,
        color_hex   TEXT NOT NULL,
        date_saved  TEXT NOT NULL
      )
    ''');

    await db.execute('''
      CREATE TABLE settings (
        key   TEXT PRIMARY KEY,
        value TEXT NOT NULL
      )
    ''');

    // Default settings
    await db.insert('settings', {'key': 'reminder_time',   'value': 'Tiada'});
    await db.insert('settings', {'key': 'reminder_aktif',  'value': 'false'});
    await db.insert('settings', {'key': 'arabic_size',     'value': 'Sederhana'});
    await db.insert('settings', {'key': 'streak_days',     'value': '0'});       // ← BARU
    await db.insert('settings', {'key': 'last_quiz_date',  'value': ''});        // ← BARU
  }

  // ─────────────────────────────────────────
  // HELPER: Color ↔ Hex String
  // ─────────────────────────────────────────

  static String colorToHex(Color color) {
    return '#${color.value.toRadixString(16).padLeft(8, '0').substring(2).toUpperCase()}';
  }

  static Color hexToColor(String hex) {
    final buffer = StringBuffer();
    if (hex.length == 7) buffer.write('ff');
    buffer.write(hex.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }

  // ─────────────────────────────────────────
  // QUIZ RESULTS
  // ─────────────────────────────────────────

  Future<int> insertQuizResult({
    required String tajwidBab,
    required int score,
    required int total,
    required int xpEarned,
  }) async {
    final db = await database;
    final percentage = total > 0 ? (score / total) * 100 : 0.0;
    return await db.insert('quiz_results', {
      'tajwid_bab': tajwidBab,
      'score':      score,
      'total':      total,
      'percentage': percentage,
      'xp_earned':  xpEarned,
      'date_taken': DateTime.now().toIso8601String(),
    });
  }

  Future<List<Map<String, dynamic>>> getAllQuizResults() async {
    final db = await database;
    return await db.query('quiz_results', orderBy: 'date_taken DESC');
  }

  Future<int> getQuizCount() async {
    final db = await database;
    final result = await db.rawQuery('SELECT COUNT(*) as count FROM quiz_results');
    return Sqflite.firstIntValue(result) ?? 0;
  }

  Future<int> getTotalBetul() async {
    final db = await database;
    final result = await db.rawQuery('SELECT SUM(score) as total FROM quiz_results');
    return Sqflite.firstIntValue(result) ?? 0;
  }

  Future<int> getTotalSalah() async {
    final db = await database;
    final result = await db.rawQuery(
        'SELECT SUM(total - score) as total FROM quiz_results');
    return Sqflite.firstIntValue(result) ?? 0;
  }

  Future<int> getTotalXp() async {
    final db = await database;
    final result = await db.rawQuery(
        'SELECT SUM(xp_earned) as total FROM quiz_results');
    return Sqflite.firstIntValue(result) ?? 0;
  }

  Future<void> deleteAllQuizResults() async {
    final db = await database;
    await db.delete('quiz_results');
    await db.delete('modul_selesai');
    await saveSetting('total_xp',       '0');
    await saveSetting('streak_days',    '0');
    await saveSetting('last_quiz_date', '');  // ← BARU: reset tarikh juga
  }

  // ─────────────────────────────────────────
  // STREAK                                    ← BARU SEPENUHNYA
  // ─────────────────────────────────────────

  Future<void> updateStreak() async {
    final lastDateStr = await getSetting('last_quiz_date');
    final today       = DateTime.now();
    final todayStr    = today.toIso8601String().substring(0, 10); // 'YYYY-MM-DD'

    // Kali pertama langsung — terus set streak = 1
    if (lastDateStr == null || lastDateStr.isEmpty) {
      await saveSetting('streak_days',    '1');
      await saveSetting('last_quiz_date', todayStr);
      return;
    }

    final lastDate = DateTime.tryParse(lastDateStr);
    if (lastDate == null) return;

    final diff = DateTime(today.year, today.month, today.day)
        .difference(DateTime(lastDate.year, lastDate.month, lastDate.day))
        .inDays;

    if (diff == 0) {
      // Dah quiz hari ni tadi — streak tak berubah, tak perlu update
      return;
    } else if (diff == 1) {
      // Semalam quiz, hari ni quiz lagi — berturut-turut! Increment
      final current = await getSettingInt('streak_days');
      await saveSetting('streak_days', '${current + 1}');
    } else {
      // Terlepas satu hari atau lebih — reset balik ke 1
      await saveSetting('streak_days', '1');
    }

    await saveSetting('last_quiz_date', todayStr);
  }

  // ─────────────────────────────────────────
  // MODUL SELESAI
  // ─────────────────────────────────────────

  Future<void> insertModulSelesai(String modulName) async {
    final db = await database;
    await db.insert(
      'modul_selesai',
      {
        'modul_name':   modulName,
        'date_selesai': DateTime.now().toIso8601String(),
      },
      conflictAlgorithm: ConflictAlgorithm.ignore,
    );
  }

  Future<List<String>> getModulSelesai() async {
    final db = await database;
    final result = await db.query('modul_selesai');
    return result.map((e) => e['modul_name'] as String).toList();
  }

  // ─────────────────────────────────────────
  // BOOKMARKS
  // ─────────────────────────────────────────

  Future<int> insertBookmark({
    required String title,
    required String arabic,
    required Color color,
  }) async {
    final db = await database;
    return await db.insert(
      'bookmarks',
      {
        'title':      title,
        'arabic':     arabic,
        'color_hex':  colorToHex(color),
        'date_saved': DateTime.now().toIso8601String(),
      },
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<List<Map<String, dynamic>>> getAllBookmarks() async {
    final db = await database;
    final results = await db.query('bookmarks', orderBy: 'date_saved DESC');
    return results.map((item) {
      return {
        ...item,
        'color': hexToColor(item['color_hex'] as String),
      };
    }).toList();
  }

  Future<bool> isBookmarked(String title) async {
    final db = await database;
    final result = await db.query(
      'bookmarks',
      where: 'title = ?',
      whereArgs: [title],
    );
    return result.isNotEmpty;
  }

  Future<void> deleteBookmarkByTitle(String title) async {
    final db = await database;
    await db.delete('bookmarks', where: 'title = ?', whereArgs: [title]);
  }

  Future<bool> toggleBookmark({
    required String title,
    required String arabic,
    required Color color,
  }) async {
    final alreadyBookmarked = await isBookmarked(title);
    if (alreadyBookmarked) {
      await deleteBookmarkByTitle(title);
      return false;
    } else {
      await insertBookmark(title: title, arabic: arabic, color: color);
      return true;
    }
  }

  // ─────────────────────────────────────────
  // SETTINGS
  // ─────────────────────────────────────────

  Future<void> saveSetting(String key, String value) async {
    final db = await database;
    await db.insert(
      'settings',
      {'key': key, 'value': value},
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<String?> getSetting(String key) async {
    final db = await database;
    final result = await db.query(
      'settings',
      where: 'key = ?',
      whereArgs: [key],
    );
    return result.isNotEmpty ? result.first['value'] as String : null;
  }

  Future<int> getSettingInt(String key, {int defaultValue = 0}) async {
    final val = await getSetting(key);
    return int.tryParse(val ?? '') ?? defaultValue;
  }

  // ─────────────────────────────────────────
  // CLOSE
  // ─────────────────────────────────────────

  Future close() async {
    final db = await database;
    db.close();
  }
}