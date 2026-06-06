import 'package:flutter/material.dart';
import 'database/database_helper.dart';

class BookmarkManager {
  // Kekal sama seperti sebelum — untuk backward compatibility
  static List<Map<String, dynamic>> bookmarkedItems = [];

  // Panggil ini sekali masa app start untuk load dari SQLite
  static Future<void> loadFromDatabase() async {
    final items = await DatabaseHelper.instance.getAllBookmarks();
    bookmarkedItems = items;
  }

  // Sync function kekal sama — tapi juga save ke SQLite
  static bool toggleBookmark({
    required String title,
    required String arabic,
    required Color color,
  }) {
    int index = bookmarkedItems.indexWhere((item) => item['title'] == title);

    if (index >= 0) {
      bookmarkedItems.removeAt(index);
      // Delete dari SQLite (fire and forget)
      DatabaseHelper.instance.deleteBookmarkByTitle(title);
      return false;
    } else {
      bookmarkedItems.add({
        'title':  title,
        'arabic': arabic,
        'color':  color,
      });
      // Save ke SQLite (fire and forget)
      DatabaseHelper.instance.insertBookmark(
        title:  title,
        arabic: arabic,
        color:  color,
      );
      return true;
    }
  }

  static bool isBookmarked(String title) {
    return bookmarkedItems.any((item) => item['title'] == title);
  }
}