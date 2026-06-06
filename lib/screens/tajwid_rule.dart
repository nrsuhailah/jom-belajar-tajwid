import 'package:flutter/material.dart';

// ============================================================
// tajwid_rule.dart — versi lengkap dengan semua hukum
// Letak dalam: lib/screens/tajwid_rule.dart
// ============================================================

enum TajwidRule {
  // Nun Mati & Tanwin
  izharHalqi,
  idghamMaalGhunnah,
  idghamBilaGhunnah,
  iqlab,
  ikhfaHaqiqi,

  // Mim Mati
  ikhfaSyafawi,
  idghamMithlain,
  izharSyafawi,

  // Hukum Idgham
  idghamMutamathilain,
  idghamMutajanisain,
  idghamMutaqaribain,

  // Hukum Mad
  madAsli,
  madLin,
  madIwadh,
  madTamkin,
  madSilahQasirah,
  madSilahThowilah,
  madLazimKalimiMukhaffaf,
  madLazimKalimiMuthaqqal,
  madLazimHarfiMukhaffaf,
  madLazimHarfiMuthaqqal,
  madAridhLissukun,
  madWajibMuttasil,
  madJaizMunfasil,

  // Qalqalah
  qalqalahSughra,
  qalqalahKubra,
  qalqalahAkbar,

  // Hukum Ra
  raTafkhim,
  raTarqiq,

  // Hukum Lam
  lamJalalahTafkhim,
  lamJalalahTarqiq,
  lamQamariah,
  lamSyamsiah,

  // Lain-lain
  iltiqaSakinah,
  hamzahWasal,

  // Makhraj
  makhrajHalq,
  makhrajLisan,
  makhrajSyafatain,
  makhrajKhaisyum,
  makhrajJauf,

  none,
}

extension TajwidRuleExtension on TajwidRule {
  // ── Warna untuk setiap hukum ──────────────────────────────
  Color get color {
    switch (this) {
      case TajwidRule.izharHalqi:               return const Color(0xFF4CAF50);
      case TajwidRule.idghamMaalGhunnah:        return const Color(0xFF9C27B0);
      case TajwidRule.idghamBilaGhunnah:        return const Color(0xFF2196F3);
      case TajwidRule.iqlab:                    return const Color(0xFFF44336);
      case TajwidRule.ikhfaHaqiqi:              return const Color(0xFF009688);
      case TajwidRule.ikhfaSyafawi:             return const Color(0xFFE91E63);
      case TajwidRule.idghamMithlain:           return const Color(0xFF673AB7);
      case TajwidRule.izharSyafawi:             return const Color(0xFF00BCD4);
      case TajwidRule.idghamMutamathilain:      return const Color(0xFF8BC34A);
      case TajwidRule.idghamMutajanisain:       return const Color(0xFFFF9800);
      case TajwidRule.idghamMutaqaribain:       return const Color(0xFF795548);
      case TajwidRule.madAsli:                  return const Color(0xFF3F51B5);
      case TajwidRule.madLin:                   return const Color(0xFF5C6BC0);
      case TajwidRule.madIwadh:                 return const Color(0xFF7986CB);
      case TajwidRule.madTamkin:                return const Color(0xFF9FA8DA);
      case TajwidRule.madSilahQasirah:          return const Color(0xFF0288D1);
      case TajwidRule.madSilahThowilah:         return const Color(0xFF0097A7);
      case TajwidRule.madLazimKalimiMukhaffaf:  return const Color(0xFF1A237E);
      case TajwidRule.madLazimKalimiMuthaqqal:  return const Color(0xFF283593);
      case TajwidRule.madLazimHarfiMukhaffaf:   return const Color(0xFF1565C0);
      case TajwidRule.madLazimHarfiMuthaqqal:   return const Color(0xFF0D47A1);
      case TajwidRule.madAridhLissukun:         return const Color(0xFF7C4DFF);
      case TajwidRule.madWajibMuttasil:         return const Color(0xFF00838F);
      case TajwidRule.madJaizMunfasil:          return const Color(0xFF006064);
      case TajwidRule.qalqalahSughra:           return const Color(0xFFFFB300);
      case TajwidRule.qalqalahKubra:            return const Color(0xFFF57F17);
      case TajwidRule.qalqalahAkbar:            return const Color(0xFFE65100);
      case TajwidRule.raTafkhim:                return const Color(0xFFD81B60);
      case TajwidRule.raTarqiq:                 return const Color(0xFF880E4F);
      case TajwidRule.lamJalalahTafkhim:        return const Color(0xFF558B2F);
      case TajwidRule.lamJalalahTarqiq:         return const Color(0xFF33691E);
      case TajwidRule.lamQamariah:              return const Color(0xFF1976D2);
      case TajwidRule.lamSyamsiah:              return const Color(0xFFF57C00);
      case TajwidRule.iltiqaSakinah:            return const Color(0xFF546E7A);
      case TajwidRule.hamzahWasal:              return const Color(0xFF455A64);
      case TajwidRule.makhrajHalq:              return const Color(0xFF00897B);
      case TajwidRule.makhrajLisan:             return const Color(0xFF1565C0);
      case TajwidRule.makhrajSyafatain:         return const Color(0xFFAD1457);
      case TajwidRule.makhrajKhaisyum:          return const Color(0xFF6A1B9A);
      case TajwidRule.makhrajJauf:              return const Color(0xFF2E7D32);
      case TajwidRule.none:                     return Colors.transparent;
    }
  }

  // ── Label pendek ──────────────────────────────────────────
  String get label {
    switch (this) {
      case TajwidRule.izharHalqi:               return 'Izhar Halqi';
      case TajwidRule.idghamMaalGhunnah:        return 'Idgham Maal Ghunnah';
      case TajwidRule.idghamBilaGhunnah:        return 'Idgham Bila Ghunnah';
      case TajwidRule.iqlab:                    return 'Iqlab';
      case TajwidRule.ikhfaHaqiqi:              return "Ikhfa' Haqiqi";
      case TajwidRule.ikhfaSyafawi:             return "Ikhfa' Syafawi";
      case TajwidRule.idghamMithlain:           return 'Idgham Mithlain';
      case TajwidRule.izharSyafawi:             return 'Izhar Syafawi';
      case TajwidRule.idghamMutamathilain:      return 'Idgham Mutamathilain';
      case TajwidRule.idghamMutajanisain:       return 'Idgham Mutajanisain';
      case TajwidRule.idghamMutaqaribain:       return 'Idgham Mutaqaribain';
      case TajwidRule.madAsli:                  return 'Mad Asli';
      case TajwidRule.madLin:                   return 'Mad Lin';
      case TajwidRule.madIwadh:                 return 'Mad Iwadh';
      case TajwidRule.madTamkin:                return 'Mad Tamkin';
      case TajwidRule.madSilahQasirah:          return 'Mad Silah Qasirah';
      case TajwidRule.madSilahThowilah:         return 'Mad Silah Thowilah';
      case TajwidRule.madLazimKalimiMukhaffaf:  return 'Mad Lazim Kalimi Mukhaffaf';
      case TajwidRule.madLazimKalimiMuthaqqal:  return 'Mad Lazim Kalimi Muthaqqal';
      case TajwidRule.madLazimHarfiMukhaffaf:   return 'Mad Lazim Harfi Mukhaffaf';
      case TajwidRule.madLazimHarfiMuthaqqal:   return 'Mad Lazim Harfi Muthaqqal';
      case TajwidRule.madAridhLissukun:         return 'Mad Aridh Lissukun';
      case TajwidRule.madWajibMuttasil:         return 'Mad Wajib Muttasil';
      case TajwidRule.madJaizMunfasil:          return 'Mad Jaiz Munfasil';
      case TajwidRule.qalqalahSughra:           return 'Qalqalah Sughra';
      case TajwidRule.qalqalahKubra:            return 'Qalqalah Kubra';
      case TajwidRule.qalqalahAkbar:            return 'Qalqalah Akbar';
      case TajwidRule.raTafkhim:                return 'Ra Tafkhim';
      case TajwidRule.raTarqiq:                 return 'Ra Tarqiq';
      case TajwidRule.lamJalalahTafkhim:        return 'Lam Jalalah Tafkhim';
      case TajwidRule.lamJalalahTarqiq:         return 'Lam Jalalah Tarqiq';
      case TajwidRule.lamQamariah:              return 'Alif Lam Qamariah';
      case TajwidRule.lamSyamsiah:              return 'Alif Lam Syamsiah';
      case TajwidRule.iltiqaSakinah:            return "Iltiqa' Sakinah";
      case TajwidRule.hamzahWasal:              return 'Hamzah Wasal';
      case TajwidRule.makhrajHalq:              return 'Makhraj Halq';
      case TajwidRule.makhrajLisan:             return 'Makhraj Lisan';
      case TajwidRule.makhrajSyafatain:         return 'Makhraj Syafatain';
      case TajwidRule.makhrajKhaisyum:          return 'Makhraj Khaisyum';
      case TajwidRule.makhrajJauf:              return 'Makhraj Jauf';
      case TajwidRule.none:                     return '';
    }
  }

  // ── Penerangan ringkas ────────────────────────────────────
  String get description {
    switch (this) {
      case TajwidRule.izharHalqi:               return 'Nun mati/tanwin bertemu: ء هـ ع ح غ خ';
      case TajwidRule.idghamMaalGhunnah:        return 'Nun mati/tanwin bertemu: ي ن م و';
      case TajwidRule.idghamBilaGhunnah:        return 'Nun mati/tanwin bertemu: ل ر';
      case TajwidRule.iqlab:                    return 'Nun mati/tanwin bertemu: ب';
      case TajwidRule.ikhfaHaqiqi:              return 'Nun mati/tanwin bertemu 15 huruf ikhfa';
      case TajwidRule.ikhfaSyafawi:             return 'Mim mati bertemu: ب';
      case TajwidRule.idghamMithlain:           return 'Mim mati bertemu: م';
      case TajwidRule.izharSyafawi:             return 'Mim mati bertemu selain م dan ب';
      case TajwidRule.idghamMutamathilain:      return 'Dua huruf sama makhraj & sifat';
      case TajwidRule.idghamMutajanisain:       return 'Dua huruf sama makhraj, beza sifat';
      case TajwidRule.idghamMutaqaribain:       return 'Dua huruf hampir sama makhraj & sifat';
      case TajwidRule.madAsli:                  return 'Mad 2 harakat';
      case TajwidRule.madLin:                   return 'و/ي mati didahului fathah, diwaqafkan';
      case TajwidRule.madIwadh:                 return 'Waqaf pada fathatain, dibaca 2 harakat';
      case TajwidRule.madTamkin:                return 'Dua ya bertemu, dibaca 2 harakat';
      case TajwidRule.madSilahQasirah:          return 'Ha Dhamir diapit dua huruf berbaris, 2 harakat';
      case TajwidRule.madSilahThowilah:         return 'Ha Dhamir bertemu Hamzah, 4-5 harakat';
      case TajwidRule.madLazimKalimiMukhaffaf:  return 'Mad 6 harakat, sukun asli tanpa sabdu';
      case TajwidRule.madLazimKalimiMuthaqqal:  return 'Mad 6 harakat, bertemu sabdu';
      case TajwidRule.madLazimHarfiMukhaffaf:   return 'Mad 6 harakat, huruf awal surah';
      case TajwidRule.madLazimHarfiMuthaqqal:   return 'Mad 6 harakat, huruf awal surah bersabdu';
      case TajwidRule.madAridhLissukun:         return 'Mad 2-6 harakat kerana waqaf';
      case TajwidRule.madWajibMuttasil:         return 'Mad 4-5 harakat, hamzah satu kalimah';
      case TajwidRule.madJaizMunfasil:          return 'Mad 2-5 harakat, hamzah beza kalimah';
      case TajwidRule.qalqalahSughra:           return 'Lantunan kecil di tengah kalimah';
      case TajwidRule.qalqalahKubra:            return 'Lantunan kuat di akhir kalimah (waqaf)';
      case TajwidRule.qalqalahAkbar:            return 'Lantunan paling kuat, huruf bersabdu';
      case TajwidRule.raTafkhim:                return 'Ra dibaca tebal';
      case TajwidRule.raTarqiq:                 return 'Ra dibaca nipis';
      case TajwidRule.lamJalalahTafkhim:        return 'Lam Allah dibaca tebal (selepas fathah/dhammah)';
      case TajwidRule.lamJalalahTarqiq:         return 'Lam Allah dibaca nipis (selepas kasrah)';
      case TajwidRule.lamQamariah:              return 'Lam dibaca jelas, ada sukun di atas Lam';
      case TajwidRule.lamSyamsiah:              return 'Lam dimasukkan ke huruf seterusnya';
      case TajwidRule.iltiqaSakinah:            return 'Dua sukun bertemu antara dua kalimah';
      case TajwidRule.hamzahWasal:              return 'Dibaca bila mula, digugur bila sambung';
      case TajwidRule.makhrajHalq:              return 'Keluar dari kerongkong';
      case TajwidRule.makhrajLisan:             return 'Keluar dari lidah';
      case TajwidRule.makhrajSyafatain:         return 'Keluar dari dua bibir';
      case TajwidRule.makhrajKhaisyum:          return 'Keluar dari rongga hidung';
      case TajwidRule.makhrajJauf:              return 'Keluar dari rongga mulut';
      case TajwidRule.none:                     return '';
    }
  }

  // ── Map title dari TajwidData → TajwidRule ────────────────
  static TajwidRule fromTitle(String title) {
    final t = title.toLowerCase();

    // Nun Mati & Tanwin
    if (t.contains('izhar halqi'))              return TajwidRule.izharHalqi;
    if (t.contains('idgham maal ghunnah'))      return TajwidRule.idghamMaalGhunnah;
    if (t.contains('idgham bila ghunnah'))      return TajwidRule.idghamBilaGhunnah;
    if (t.contains('iqlab'))                    return TajwidRule.iqlab;
    if (t.contains('ikhfa') && t.contains('syafawi')) return TajwidRule.ikhfaSyafawi;
    if (t.contains('ikhfa'))                    return TajwidRule.ikhfaHaqiqi;

    // Mim Mati
    if (t.contains('mithlain'))                 return TajwidRule.idghamMithlain;
    if (t.contains('izhar syafawi'))            return TajwidRule.izharSyafawi;

    // Idgham
    if (t.contains('mutamathilain'))            return TajwidRule.idghamMutamathilain;
    if (t.contains('mutajanisain'))             return TajwidRule.idghamMutajanisain;
    if (t.contains('mutaqaribain'))             return TajwidRule.idghamMutaqaribain;

    // Mad
    if (t.contains('mad asli'))                 return TajwidRule.madAsli;
    if (t.contains('mad lin'))                  return TajwidRule.madLin;
    if (t.contains('iwadh'))                    return TajwidRule.madIwadh;
    if (t.contains('tamkin'))                   return TajwidRule.madTamkin;
    if (t.contains('silah qasirah'))            return TajwidRule.madSilahQasirah;
    if (t.contains('silah thowilah'))           return TajwidRule.madSilahThowilah;
    if (t.contains('kalimi mukhaffaf'))         return TajwidRule.madLazimKalimiMukhaffaf;
    if (t.contains('kalimi muthaqqal'))         return TajwidRule.madLazimKalimiMuthaqqal;
    if (t.contains('harfi mukhaffaf'))          return TajwidRule.madLazimHarfiMukhaffaf;
    if (t.contains('harfi muthaqqal'))          return TajwidRule.madLazimHarfiMuthaqqal;
    if (t.contains('aridh'))                    return TajwidRule.madAridhLissukun;
    if (t.contains('wajib'))                    return TajwidRule.madWajibMuttasil;
    if (t.contains('jaiz'))                     return TajwidRule.madJaizMunfasil;

    // Qalqalah
    if (t.contains('qalqalah sughra'))          return TajwidRule.qalqalahSughra;
    if (t.contains('qalqalah kubra'))           return TajwidRule.qalqalahKubra;
    if (t.contains('qalqalah akbar'))           return TajwidRule.qalqalahAkbar;

    // Ra
    if (t.contains('tafkhim'))                  return TajwidRule.raTafkhim;
    if (t.contains('tarqiq'))                   return TajwidRule.raTarqiq;

    // Lam
    if (t.contains('jalalah'))                  return TajwidRule.lamJalalahTafkhim;
    if (t.contains('qamariah'))                 return TajwidRule.lamQamariah;
    if (t.contains('syamsiah'))                 return TajwidRule.lamSyamsiah;

    // Lain-lain
    if (t.contains('iltiqa'))                   return TajwidRule.iltiqaSakinah;
    if (t.contains('hamzah wasal'))             return TajwidRule.hamzahWasal;

    // Makhraj
    if (t.contains('halq') || t.contains('kerongkong')) return TajwidRule.makhrajHalq;
    if (t.contains('lisan') || t.contains('lidah'))     return TajwidRule.makhrajLisan;
    if (t.contains('syafata') || t.contains('bibir'))   return TajwidRule.makhrajSyafatain;
    if (t.contains('khaisyum') || t.contains('hidung')) return TajwidRule.makhrajKhaisyum;
    if (t.contains('jauf') || t.contains('rongga'))     return TajwidRule.makhrajJauf;

    return TajwidRule.none;
  }
}