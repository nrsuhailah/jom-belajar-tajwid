// ============================================================
// app_strings_info.dart  — String untuk InfoPage & BookmarkPage
// ============================================================

class SInfo {
  final bool isEn;
  const SInfo(this.isEn);

  // ── InfoPage ──
  String get infoTitle        => isEn ? 'Information'              : 'Maklumat';
  String get infoAboutTitle   => isEn ? 'About This App'           : 'Tentang Aplikasi Ini';
  String get infoAboutSub     => isEn ? 'Modern tajwid learning'   : 'Pembelajaran tajwid moden';
  String get infoPrivacyTitle => isEn ? 'Privacy Policy'           : 'Dasar Privasi';
  String get infoPrivacySub   => isEn ? 'Data security'            : 'Keselamatan data';

  String get infoEbookBody => isEn
    ? 'TajwidMaster is a modern tajwid learning app based on the '
    'MADAD E-Book, designed to be simple and suitable for all levels. '
    'Learn tajwid the right way, anytime and anywhere.'
  : 'TajwidMaster ialah aplikasi tajwid moden berpandukan '
    'E-Buku MADAD, mudah dan sesuai untuk semua peringkat. '
    'Belajar tajwid dengan betul, bila-bila masa dan di mana sahaja.';

  List<String> get infoAboutBullets => isEn
      ? ['Interactive tajwid application', 'Based on MADAD E-Book',
         'Easy & user-friendly', 'Suitable for all levels']
      : ['Aplikasi tajwid interaktif', 'Berpandukan E-Buku MADAD',
         'Mudah & mesra pengguna', 'Sesuai semua peringkat'];

  List<String> get infoPrivacyBullets => isEn
      ? ['No personal data collected', 'No server transmission',
         'Data stored on device', 'No third-party sharing']
      : ['Tiada data peribadi dikumpul', 'Tiada penghantaran ke server',
         'Data disimpan dalam peranti', 'Tiada perkongsian pihak ketiga'];

  // ── BookmarkPage ──
  String get bookmarkTitle  => isEn ? 'Bookmark'          : 'Penanda';
  String get bookmarkEmpty  => isEn ? 'No saved bookmark' : 'Tiada penanda disimpan';
  String get bookmarkHint   => isEn
      ? 'Press the bookmark icon in any\ntajwid page to save.'
      : 'Tekan ikon penanda dalam mana-mana\nhalaman tajwid untuk simpan.';
  String get tapToOpen      => isEn ? 'Tap to open'         : 'Ketik untuk buka';
  String bookmarkCount(int n) =>
      isEn ? '$n item(s) saved' : '$n item disimpan';
}