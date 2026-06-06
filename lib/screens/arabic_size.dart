import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// Saiz font Arab dalam double (px)
/// Kecil = 24, Sederhana = 34, Besar = 44
class ArabicSizeProvider extends ChangeNotifier {
  double _fontSize = 34.0; // default: Sederhana
  String _label = 'Sederhana';

  double get fontSize => _fontSize;
  String get label => _label;

  /// Panggil ini sekali masa app start (dalam main.dart)
  Future<void> load() async {
    final p = await SharedPreferences.getInstance();
    final saved = p.getString('arabic_size') ?? 'Sederhana';
    _applyLabel(saved, notify: false);
  }

  /// Tukar saiz & simpan ke SharedPreferences
  Future<void> setSize(String label) async {
    final p = await SharedPreferences.getInstance();
    await p.setString('arabic_size', label);
    _applyLabel(label, notify: true);
  }

  void _applyLabel(String label, {required bool notify}) {
    _label = label;
    switch (label) {
      case 'Kecil':     _fontSize = 24.0; break;
      case 'Sederhana': _fontSize = 34.0; break;
      case 'Besar':     _fontSize = 44.0; break;
      default:          _fontSize = 34.0;
    }
    if (notify) notifyListeners();
  }
}