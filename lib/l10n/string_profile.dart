// ============================================================
// app_strings_profile.dart  — String untuk ProfilePage
// ============================================================

class SProfile {
  final bool isEn;
  const SProfile(this.isEn);

  // ── Tajuk halaman ──
  String get profileTitle     => isEn ? 'Settings'     : 'Tetapan';
  String get learningProgress => isEn ? 'Learning Progress'       : 'Kemajuan Pembelajaran';

  // ── Seksyen ──
  String get sectionLearning    => isEn ? 'Learning'    : 'Pembelajaran';
  String get sectionPreferences => isEn ? 'Preferences' : 'Keutamaan';
  String get sectionLanguage    => isEn ? 'Language'    : 'Bahasa';

  // ── Tile label ──
  String get statisticsTitle  => isEn ? 'Learning Statistics' : 'Statistik Pembelajaran';
  String get reminderTitle    => isEn ? 'Study Reminder'      : 'Peringatan Belajar';
  String get arabicSizeTitle  => isEn ? 'Arabic Text Size'    : 'Saiz Teks Arabic';
  String get languageSetting  => isEn ? 'App Language'        : 'Bahasa Aplikasi';

  // ── Statistik dialog ──
  String get moduleLearned   => isEn ? 'Modules Learned'   : 'Modul Dipelajari';
  String get quizDone        => isEn ? 'Quiz Completed'    : 'Kuiz Diselesaikan';
  String get correctAns      => isEn ? 'Correct Answers'   : 'Jawapan Betul';
  String get wrongAns        => isEn ? 'Wrong Answers'     : 'Jawapan Salah';
  String get successRate     => isEn ? 'Success Rate'      : 'Peratus Kejayaan';
  String get successRateShort=> isEn ? 'success'           : 'kejayaan';
  String get resetAll        => isEn ? 'Reset All Records' : 'Reset Semua Rekod';

  // ── Stats kad ──
  String get modulesLabel       => isEn ? 'Modules' : 'Modul';
  String get quizLabel          => isEn ? 'Quiz'    : 'Kuiz';
  String get correctLabel       => isEn ? 'Correct' : 'Betul';
  String get wrongLabel         => isEn ? 'Wrong'   : 'Salah';
  String get questionsAnswered  => isEn ? 'questions answered' : 'soalan dijawab';

  // ── Tahap ──
  String get tahapBaru      => isEn ? 'New Student 📖'      : 'Pelajar Baru 📖';
  String get tahapGigih     => isEn ? 'Dedicated Student ⭐' : 'Pelajar Gigih ⭐';
  String get tahapCemerlang => isEn ? 'Excellent Student 🏆' : 'Pelajar Cemerlang 🏆';

  // ── Reset ──
  String get resetTitle => isEn ? 'Reset Data?' : 'Reset Data?';
  String get resetBody  => isEn
      ? 'All learning records will be deleted. This action cannot be undone.'
      : 'Semua rekod statistik pembelajaran akan dipadam. Tindakan ini tidak boleh dibatalkan.';
  String get yesReset   => isEn ? 'Yes, Reset' : 'Ya, Reset';
  String get resetDone  => isEn ? '✅ All records cleared.' : '✅ Semua rekod telah dikosongkan.';
  String get cancel     => isEn ? 'Cancel' : 'Batal';
  String get close      => isEn ? 'Close'  : 'Tutup';

  // ── Reminder ──
  String get reminderActive     => isEn ? '● ACTIVE'   : '● AKTIF';
  String get reminderInactive   => isEn ? '● INACTIVE' : '● TIDAK AKTIF';
  String get reminderCurrentTime=> isEn ? 'Current time' : 'Masa semasa';
  String get reminderSetTime    => isEn ? 'Set Time'     : 'Tetapkan Masa';
  String get reminderChangeTime => isEn ? 'Change Time'  : 'Tukar Masa';
  String get reminderCancel     => isEn ? 'Cancel Reminder'     : 'Batalkan Peringatan';
  String get reminderNone       => isEn ? 'No reminder set'     : 'Tiada peringatan ditetapkan';
  String get reminderCancelled  => isEn ? '🔕 Reminder cancelled.' : '🔕 Peringatan telah dibatalkan.';
  String reminderActiveDesc(String t) =>
      isEn ? 'Active · Every day $t' : 'Aktif · Setiap hari $t';
  String reminderSet(String t) =>
      isEn ? '⏰ Reminder set daily at $t' : '⏰ Peringatan ditetapkan setiap hari pada $t';

  // ── Arabic size ──
  String get currentSize => isEn ? 'Current size' : 'Saiz semasa';
  List<String> get sizeLabels => isEn
      ? ['Small', 'Medium', 'Large']
      : ['Kecil', 'Sederhana', 'Besar'];
}