import 'package:flutter/material.dart';
import '../database/database_helper.dart';

class LocaleProvider extends ChangeNotifier {
  String _lang = 'ms';
  String get lang => _lang;
  bool get isEn => _lang == 'en';

  LocaleProvider() {
    _load();
  }

  Future<void> _load() async {
    final saved = await DatabaseHelper.instance.getSetting('language') ?? 'ms';
    _lang = saved;
    notifyListeners();
  }

  Future<void> setLang(String code) async {
    _lang = code;
    await DatabaseHelper.instance.saveSetting('language', code);
    notifyListeners();
  }
}