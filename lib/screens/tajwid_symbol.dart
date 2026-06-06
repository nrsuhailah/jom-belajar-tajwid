//import 'package:flutter/material.dart';

/// Guna class ini untuk dapat simbol Arabic bagi setiap tajwid.
/// Panggil: TajwidSymbol.get(widget.title)
class TajwidSymbol {
  static String get(String title) {
    final t = title.toLowerCase();

    // ── Makhraj ──
    if (t.contains('halq') || t.contains('kerongkong'))   { return 'ح'; }
    if (t.contains('lisan') || t.contains('lidah'))        { return 'ل'; }
    if (t.contains('syafata') || t.contains('bibir'))      { return 'ب'; }
    if (t.contains('khaisyum') || t.contains('hidung'))    { return 'ن'; }
    if (t.contains('jauf') || t.contains('rongga'))        { return 'اوي'; }

    // ── Nun Mati & Tanwin ──
    if (t.contains('izhar'))                               { return 'إِظْهَار'; }
    if (t.contains('idgham') && t.contains('ghunnah'))     { return 'إِدْغَام'; }
    if (t.contains('idgham'))                              { return 'إِدْغَام'; }
    if (t.contains('iqlab'))                               { return 'إِقْلَاب'; }
    if (t.contains('ikhfa') && !t.contains('syafawi'))     { return 'إِخْفَاء'; }

    // ── Mim Mati ──
    if (t.contains('syafawi') || t.contains('ikhfa syafawi')) { return 'إِخْفَاء'; }
    if (t.contains('mithlain') || t.contains('mutamathilain')) { return 'م'; }
    if (t.contains('mim'))                                 { return 'م'; }

    // ── Nun Mati umum ──
    if (t.contains('nun') || t.contains('tanwin'))         { return 'ن'; }

    // ── Mad ──
    if (t.contains('mad asli') || t.contains('mad tabi'))  { return 'مَدّ'; }
    if (t.contains('mad wajib') || t.contains('muttasil')) { return 'مَدّ'; }
    if (t.contains('mad jaiz') || t.contains('munfasil'))  { return 'مَدّ'; }
    if (t.contains('mad lazim'))                           { return 'مَدّ'; }
    if (t.contains('mad arid') || t.contains('lissukun'))  { return 'مَدّ'; }
    if (t.contains('mad iwad'))                            { return 'مَدّ'; }
    if (t.contains('mad'))                                 { return 'مَدّ'; }

    // ── Qalqalah ──
    if (t.contains('qalqalah') || t.contains('sugra'))     { return 'قَلْقَلَة'; }
    if (t.contains('kubra') || t.contains('akbar'))        { return 'قَلْقَلَة'; }

    // ── Ra ──
    if (t.contains('tafkhim') && t.contains('ra'))         { return 'ر'; }
    if (t.contains('tarqiq') && t.contains('ra'))          { return 'ر'; }
    if (t.contains('hukum ra'))                            { return 'ر'; }

    // ── Lam Jalalah ──
    if (t.contains('jalalah') || t.contains('lam lafaz'))  { return 'اللّٰه'; }

    // ── Waqaf ──
    if (t.contains('waqaf'))                               { return 'وَقْف'; }

    // ── Hamzah Wasal ──
    if (t.contains('hamzah') || t.contains('wasal'))       { return 'ٱ'; }

    // ── Alif Lam ──
    if (t.contains('qamariyah'))                           { return 'الْقَمَر'; }
    if (t.contains('syamsiyah'))                           { return 'الشَّمْس'; }
    if (t.contains('alif lam'))                            { return 'ال'; }

    // ── Iltiqa Sakinah ──
    if (t.contains('iltiqa') || t.contains('sakinah'))     { return 'سَاكِن'; }

    // ── Ghunnah ──
    if (t.contains('ghunnah'))                             { return 'غُنَّة'; }

    // ── Fallback ──
    return 'ت'; // huruf Ta — simbol umum tajwid
  }
}