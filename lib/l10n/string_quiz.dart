// ============================================================
// app_strings_quiz.dart  — String untuk QuizContentScreen
// ============================================================

class SQuiz {
  final bool isEn;
  const SQuiz(this.isEn);

  String get mulaKuiz => isEn ? 'Start Quiz' : 'Mula Kuiz';

  String get nextQuestion       => isEn ? 'Next Question'      : 'Soalan Seterusnya';
  String get soalanSebelumnya   => isEn ? 'Previous'           : 'Sebelumnya';   // ← BARU

  // ── QuizModuleGrid ──
  String get pilihModul       => isEn ? 'Quiz Module'     : 'Modul Kuiz';
  String get tiadaModul       => isEn ? 'No modules available.'  : 'Tiada modul tersedia.';

  // ── QuizResultScreen ──
  String get cemerlang        => isEn ? 'Excellent! 🎉'          : 'Cemerlang! 🎉';
  String get bagus            => isEn ? 'Good! Keep it up!'      : 'Bagus! Teruskan!';
  String get teruskanBelajar  => isEn ? 'Keep Learning!'         : 'Teruskan Belajar!';
  String get skorSempurna     => isEn ? 'Perfect Score!'         : 'Skor Sempurna!';
  String get hampir           => isEn ? 'Almost! Try for 3 stars': 'Hampir! Cuba lagi untuk 3 bintang';
  String get ulangKaji        => isEn ? 'Revise and try again'   : 'Ulang kaji dan cuba semula';
  String get cubaLagi         => isEn ? 'Try Again'              : 'Cuba Lagi';
  String get kembaliKuiz      => isEn ? 'Back to Quiz'           : 'Kembali ke kuiz';
  String get modulLabel       => isEn ? 'Module'                 : 'Modul';
  String get peratus          => isEn ? '% Correct'              : '% Betul';
  String xpDiperoleh(int xp)  => isEn ? '+$xp XP earned'        : '+$xp XP diperoleh';

  // ── Fallback when no module is selected ──
  String get unknownModule    => isEn ? 'Unknown'                : 'Tidak Diketahui';

  // ── Explanation box feedback ──
  String get tepatSekali      => isEn ? 'Well Done!'             : 'Tepat Sekali!';
  String get salahJawapan     => isEn ? 'Not Quite!'             : 'Hampir Betul!';

  // ── StreakBanner ──
  String get berturutTurut    => isEn ? 'Consecutive'            : 'Berturut-turut';
  String get mataTerkumpul    => isEn ? 'Points Earned'          : 'Mata Terkumpul';
  String get hariLabel        => isEn ? 'Days'                   : 'Hari';

  // ── Translate ruleDescription (intro sebelum quiz mula) ──
String translateRuleDesc(String ms) {
  if (!isEn) return ms;
  const map = <String, String>{
    'Makhraj ialah tempat keluarnya setiap huruf Hijaiyah. '
    'Terdapat 5 makhraj utama:\n\n'
    '① Al-Jauf — rongga mulut & tekak\n'
    '② Al-Halq — kerongkong (3 peringkat)\n'
    '③ Al-Lisan — lidah (10 makhraj)\n'
    '④ Asy-Syafatain — dua bibir\n'
    '⑤ Al-Khaisyum — pangkal hidung (ghunnah)':
        'Makhraj is the place of articulation for each Hijaiyah letter. '
        'There are 5 main makhraj:\n\n'
        '① Al-Jauf — oral cavity & throat\n'
        '② Al-Halq — throat (3 levels)\n'
        '③ Al-Lisan — tongue (10 makhraj)\n'
        '④ Asy-Syafatain — two lips\n'
        '⑤ Al-Khaisyum — nasal passage (ghunnah)',

    'Nun Mati (نْ) dan Tanwin (ً ٍ ٌ) mempunyai 4 hukum bacaan '
    'bergantung huruf yang datang selepasnya:\n\n'
    '① Izhar Halqi — dibaca jelas (6 huruf halqi)\n'
    '② Idgham — dimasukkan (6 huruf: ي ر م ل و ن)\n'
    '③ Iqlab — ditukar jadi Mim (huruf ب sahaja)\n'
    '④ Ikhfa Haqiqi — antara jelas & dengung (15 huruf)':
        'Silent Nun (نْ) and Tanwin (ً ٍ ٌ) have 4 recitation rules '
        'depending on the following letter:\n\n'
        '① Izhar Halqi — read clearly (6 halqi letters)\n'
        '② Idgham — merged (6 letters: ي ر م ل و ن)\n'
        '③ Iqlab — changed to Mim (letter ب only)\n'
        '④ Ikhfa Haqiqi — between clear & nasal (15 letters)',

    'Mim Mati (مْ) mempunyai 3 hukum bacaan:\n\n'
    '① Ikhfa Syafawi — Mim Mati bertemu ب\n'
    '   → Tersembunyi dengan dengung dari bibir\n\n'
    '② Idgham Syafawi — Mim Mati bertemu م\n'
    '   → Dimasukkan dengan dengung\n\n'
    '③ Izhar Syafawi — Mim Mati bertemu huruf lain\n'
    '   → Dibaca jelas dari bibir':
        'Silent Mim (مْ) has 3 recitation rules:\n\n'
        '① Ikhfa Syafawi — Silent Mim meets ب\n'
        '   → Hidden with nasalisation from the lips\n\n'
        '② Idgham Syafawi — Silent Mim meets م\n'
        '   → Merged with nasalisation\n\n'
        '③ Izhar Syafawi — Silent Mim meets other letters\n'
        '   → Read clearly from the lips',

    'Idgham (إدغام) bermaksud memasukkan satu huruf ke dalam '
    'huruf berikutnya sehingga menjadi satu huruf bertasydid.\n\n'
    'Terdapat 3 jenis Idgham:\n\n'
    '① Mutamasilain — sama makhraj & sama sifat (مثلان)\n'
    '② Mutajanisain — sama makhraj, beza sifat (جنسان)\n'
    '③ Mutaqaribain — hampir sama makhraj & sifat (قاربان)':
        'Idgham (إدغام) means merging one letter into the next '
        'until they become one letter with shadda.\n\n'
        'There are 3 types of Idgham:\n\n'
        '① Mutamasilain — same makhraj & same characteristics (مثلان)\n'
        '② Mutajanisain — same makhraj, different characteristics (جنسان)\n'
        '③ Mutaqaribain — similar makhraj & characteristics (قاربان)',

    'Mad bermaksud memanjangkan bacaan pada huruf mad.\n\n'
    'Huruf Mad ada 3: ا (Alif) • و (Wau) • ي (Ya)\n\n'
    'Jenis utama:\n'
    '① Mad Asli (Tabi\'i) — 2 harakat\n'
    '② Mad Wajib Muttasil — 4-5 harakat\n'
    '③ Mad Jaiz Munfasil — 4-5 harakat\n'
    '④ Mad Arid Lissukun — 2, 4 atau 6 harakat\n'
    '⑤ Mad Lazim — wajib 6 harakat':
        'Mad means prolonging the recitation on a mad letter.\n\n'
        'There are 3 Mad letters: ا (Alif) • و (Wau) • ي (Ya)\n\n'
        'Main types:\n'
        '① Mad Asli (Tabi\'i) — 2 counts\n'
        '② Mad Wajib Muttasil — 4-5 counts\n'
        '③ Mad Jaiz Munfasil — 4-5 counts\n'
        '④ Mad Aridh Lissukun — 2, 4 or 6 counts\n'
        '⑤ Mad Lazim — compulsory 6 counts',

    'Huruf Ra (ر) dibaca dalam dua cara:\n\n'
    '① Tafkhim (تَفْخِيم) — tebal/berat\n'
    '   • Ra berbaris fathah atau dhammah\n'
    '   • Ra mati & sebelumnya fathah/dhammah\n'
    '   • Ra mati & selepasnya huruf Isti\'la\n\n'
    '② Tarqiq (تَرْقِيق) — nipis/ringan\n'
    '   • Ra berbaris kasrah\n'
    '   • Ra mati & sebelumnya kasrah (tanpa Isti\'la)\n'
    '   • Ra mati & sebelumnya Ya mati':
        'The letter Ra (ر) is read in two ways:\n\n'
        '① Tafkhim (تَفْخِيم) — heavy/thick\n'
        '   • Ra with fathah or dhammah\n'
        '   • Silent Ra & preceded by fathah/dhammah\n'
        '   • Silent Ra & followed by an Isti\'la letter\n\n'
        '② Tarqiq (تَرْقِيق) — light/thin\n'
        '   • Ra with kasrah\n'
        '   • Silent Ra & preceded by kasrah (without Isti\'la)\n'
        '   • Silent Ra & preceded by silent Ya',

    'Lam pada Lafaz Jalalah (اللّٰه) dibaca dalam dua cara '
    'bergantung kepada baris huruf sebelumnya:\n\n'
    '① Tafkhim (Tebal)\n'
    '   → Huruf sebelumnya berbaris fathah atau dhammah\n'
    '   → Contoh: قَالَ اللّٰهُ  •  رَسُولُ اللّٰهِ\n\n'
    '② Tarqiq (Nipis)\n'
    '   → Huruf sebelumnya berbaris kasrah\n'
    '   → Contoh: بِسْمِ اللّٰهِ  •  لِلّٰهِ مَا فِي':
        'Lam on Lafaz Jalalah (اللّٰه) is read in two ways '
        'depending on the vowel of the preceding letter:\n\n'
        '① Tafkhim (Heavy)\n'
        '   → Preceding letter has fathah or dhammah\n'
        '   → Example: قَالَ اللّٰهُ  •  رَسُولُ اللّٰهِ\n\n'
        '② Tarqiq (Light)\n'
        '   → Preceding letter has kasrah\n'
        '   → Example: بِسْمِ اللّٰهِ  •  لِلّٰهِ مَا فِي',

    'Qalqalah (قَلْقَلَة) ialah getaran atau lantunan suara '
    'pada 5 huruf apabila mati atau diwaqafkan.\n\n'
    'Huruf Qalqalah: ق  ط  ب  ج  د\n'
    '(Hafal dengan: قُطْبُ جَدٍّ)\n\n'
    'Terdapat 3 peringkat:\n'
    '① Sugra (صُغْرَى) — huruf mati di tengah kalimah\n'
    '② Kubra (كُبْرَى) — huruf mati di hujung ayat (wakaf)\n'
    '③ Akbar (أَكْبَر) — huruf berbaris & diwaqafkan':
        'Qalqalah (قَلْقَلَة) is the vibration or echo of sound '
        'on 5 letters when silent or stopped.\n\n'
        'Qalqalah letters: ق  ط  ب  ج  د\n'
        '(Memorise with: قُطْبُ جَدٍّ)\n\n'
        'There are 3 levels:\n'
        '① Sugra (صُغْرَى) — silent letter mid-word\n'
        '② Kubra (كُبْرَى) — silent letter at end of verse (waqaf)\n'
        '③ Akbar (أَكْبَر) — vowelled letter at waqaf',

    'Alif Lam (ال) terbahagi kepada dua jenis:\n\n'
    '① Qamariyah (قَمَرِيَّة) — Lam dibaca JELAS\n'
    '   • Tanda: sukun (ْ) di atas Lam\n'
    '   • 14 huruf: ا ب غ ح ج ك و خ ف ع ق ي م ه\n\n'
    '② Syamsiyah (شَمْسِيَّة) — Lam DIMASUKKAN\n'
    '   • Tanda: tasydid (ّ) pada huruf berikutnya\n'
    '   • 14 huruf: ت ث د ذ ر ز س ش ص ض ط ظ ل ن':
        'Alif Lam (ال) is divided into two types:\n\n'
        '① Qamariyah (قَمَرِيَّة) — Lam read CLEARLY\n'
        '   • Mark: sukun (ْ) above Lam\n'
        '   • 14 letters: ا ب غ ح ج ك و خ ف ع ق ي م ه\n\n'
        '② Syamsiyah (شَمْسِيَّة) — Lam MERGED\n'
        '   • Mark: shadda (ّ) on the next letter\n'
        '   • 14 letters: ت ث د ذ ر ز س ش ص ض ط ظ ل ن',

    'Iltiqa Sakinah (الْتِقَاء السَّاكِنَيْن) bermaksud '
    '"pertemuan dua huruf mati berturutan".\n\n'
    'Cara menyelesaikannya:\n\n'
    '① Jika huruf pertama ialah huruf Mad (ا و ي)\n'
    '   → Huruf Mad DIBUANG\n'
    '   → Contoh: وَلَا الضَّالِّيْن\n\n'
    '② Jika huruf pertama bukan huruf Mad\n'
    '   → Tambah baris KASRAH pada huruf pertama\n'
    '   → Contoh: قُلِ اللّٰهُمَّ':
        'Iltiqa Sakinah (الْتِقَاء السَّاكِنَيْن) means '
        '"meeting of two consecutively silent letters".\n\n'
        'How to resolve it:\n\n'
        '① If the first letter is a Mad letter (ا و ي)\n'
        '   → The Mad letter is DROPPED\n'
        '   → Example: وَلَا الضَّالِّيْن\n\n'
        '② If the first letter is not a Mad letter\n'
        '   → Add KASRAH to the first letter\n'
        '   → Example: قُلِ اللّٰهُمَّ',

    'Hamzah Wasal (ٱ) ialah Hamzah yang:\n'
    '• DIBACA apabila memulakan bacaan\n'
    '• GUGUR (tidak dibaca) apabila disambung\n\n'
    'Simbol: seperti kepala huruf Sad kecil (ص)\n\n'
    'Cara menentukan baris Hamzah Wasal:\n'
    '① Alif Lam (ال) → sentiasa baris FATHAH\n'
    '② Kata nama (Isim) → sentiasa baris KASRAH\n'
    '③ Kata kerja (Fi\'il) → tengok baris huruf ke-3:\n'
    '   • Kasrah/Fathah → baca KASRAH\n'
    '   • Dhammah → baca DHAMMAH':
        'Hamzah Wasal (ٱ) is a Hamzah that:\n'
        '• IS READ when starting recitation\n'
        '• DROPS (not read) when connected\n\n'
        'Symbol: resembles a small head of Sad (ص)\n\n'
        'How to determine Hamzah Wasal vowel:\n'
        '① Alif Lam (ال) → always FATHAH\n'
        '② Nouns (Isim) → always KASRAH\n'
        '③ Verbs (Fi\'il) → look at the 3rd letter:\n'
        '   • Kasrah/Fathah → read KASRAH\n'
        '   • Dhammah → read DHAMMAH',

    'Tanda Waqaf menunjukkan cara berhenti dalam bacaan Al-Quran.\n\n'
    '① م (Lazim) — WAJIB berhenti\n'
    '② لا — DILARANG berhenti\n'
    '③ ج (Jaiz) — Boleh berhenti atau sambung\n'
    '④ ۗ — Berhenti LEBIH UTAMA\n'
    '⑤ ۖ — Sambung LEBIH UTAMA\n'
    '⑥ ∴ ∴ (Muanaqah) — Berhenti pada salah satu sahaja\n'
    '⑦ ۙ (Saktah) — Berhenti seketika tanpa nafas':
        'Waqaf signs indicate how to stop in Quran recitation.\n\n'
        '① م (Lazim) — MUST stop\n'
        '② لا — PROHIBITED from stopping\n'
        '③ ج (Jaiz) — May stop or continue\n'
        '④ ۗ — Stopping MORE PREFERRED\n'
        '⑤ ۖ — Continuing MORE PREFERRED\n'
        '⑥ ∴ ∴ (Muanaqah) — Stop at only one\n'
        '⑦ ۙ (Saktah) — Brief pause without breath',
  };
  return map[ms] ?? ms;
}

  // ── Translate soalan ──
  String translateQuestion(String ms) {
    if (!isEn) return ms;
    const map = <String, String>{
      'Makhraj Al-Halq melibatkan bahagian?':           'What does Makhraj Al-Halq involve?',
      'Huruf ء dan هـ keluar dari bahagian mana?':      'Where do the letters ء and هـ come from?',
      'Huruf ع dan غ keluar dari bahagian mana?':       'Where do the letters ع and غ come from?',
      'Makhraj Asy-Syafatain merujuk kepada?':          'What does Makhraj Asy-Syafatain refer to?',
      'Al-Khaisyum digunakan untuk bunyi apa?':         'What sound is Al-Khaisyum used for?',
      'Berapakah bilangan makhraj utama?':              'How many main makhraj are there?',
      'Nun Mati bertemu huruf ب, hukumnya?':            'When silent Nun meets ب, the rule is?',
      'Izhar Halqi bermaksud Nun Mati dibaca secara?':  'Izhar Halqi means silent Nun is read?',
      'Berapa jumlah huruf Ikhfa Haqiqi?':              'How many Ikhfa Haqiqi letters are there?',
      'Idgham Maal Ghunnah berlaku pada huruf mana?':   'Idgham Maal Ghunnah occurs with which letters?',
      'Huruf ر dan ل mewakili hukum?':                  'Letters ر and ل represent which rule?',
      'Manakah contoh Izhar Halqi yang betul?':         'Which is a correct example of Izhar Halqi?',
      'Mim Mati mempunyai berapa hukum?':               'How many rules does Silent Mim have?',
      'Ikhfa Syafawi berlaku apabila Mim Mati bertemu?':'Ikhfa Syafawi occurs when Silent Mim meets?',
      'Cara bacaan Ikhfa Syafawi ialah?':               'How is Ikhfa Syafawi read?',
      'Idgham Syafawi berlaku apabila Mim Mati bertemu?':'Idgham Syafawi occurs when Silent Mim meets?',
      'Mim Mati bertemu huruf Sin (س), hukumnya?':      'Silent Mim meets Sin (س), the rule is?',
      'Izhar Syafawi melibatkan berapa huruf?':         'Izhar Syafawi involves how many letters?',
      'Idgham bermaksud?':                              'Idgham means?',
      'Dua huruf yang sama makhraj & sifat disebut?':   'Two letters with same makhraj & characteristics are called?',
      'Contoh Idgham Mutamasilain ialah?':              'An example of Idgham Mutamasilain is?',
      'ت bertemu ط adalah contoh Idgham?':              'ت meeting ط is an example of which Idgham?',
      'ق bertemu ك adalah contoh Idgham?':              'ق meeting ك is an example of which Idgham?',
      'Mutajanisain bermaksud dua huruf yang?':         'Mutajanisain refers to two letters that are?',
      'Berapa jumlah huruf Mad?':                       'How many Mad letters are there?',
      "Kadar panjang Mad Asli (Tabi'i) ialah?":         "The length of Mad Asli (Tabi'i) is?",
      'Mad Wajib Muttasil berlaku apabila?':            'Mad Wajib Muttasil occurs when?',
      'Mad Jaiz Munfasil dibaca berapa harakat?':       'Mad Jaiz Munfasil is read for how many counts?',
      'Mad yang berlaku ketika wakaf di hujung ayat disebut?': 'The mad occurring at waqaf at end of verse is called?',
      'Mad Lazim Kilmi Muthaqqal wajib dibaca?':        'Mad Lazim Kilmi Muthaqqal must be read for?',
      'Ra berbaris fathah dibaca secara?':              'Ra with fathah is read?',
      'Ra berbaris kasrah dibaca secara?':              'Ra with kasrah is read?',
      'Ra yang dibaca tebal disebut?':                  'Ra read heavily is called?',
      "Ra mati, sebelumnya kasrah, selepasnya huruf Isti'la?": "Silent Ra, preceded by kasrah, followed by Isti'la letter?",
      'Ra mati, sebelumnya Ya mati — dibaca?':          'Silent Ra, preceded by silent Ya — read as?',
      'Manakah contoh Ra Tarqiq?':                      'Which is an example of Ra Tarqiq?',
      'Lafaz Jalalah merujuk kepada?':                  'Lafaz Jalalah refers to?',
      'Lafaz Allah selepas baris fathah dibaca?':       'Lafaz Allah after fathah is read?',
      'Lafaz Allah selepas baris kasrah dibaca?':       'Lafaz Allah after kasrah is read?',
      '"Rasulullah" — Lam Jalalah dibaca?':             '"Rasulullah" — Lam Jalalah is read?',
      '"Bismillah" — Lam Jalalah dibaca?':              '"Bismillah" — Lam Jalalah is read?',
      'Berapa cara bacaan Lam pada Lafaz Allah?':       'How many ways is Lam on Lafaz Allah read?',
      'Berapakah huruf Qalqalah?':                      'How many Qalqalah letters are there?',
      'Frasa hafalan huruf Qalqalah ialah?':            'The mnemonic phrase for Qalqalah letters is?',
      'Qalqalah Sugra berlaku apabila huruf mati di?':  'Qalqalah Sugra occurs when the silent letter is at?',
      'Qalqalah Kubra berlaku apabila?':                'Qalqalah Kubra occurs when?',
      'Qalqalah yang paling kuat lantunannya?':         'Which Qalqalah has the strongest echo?',
      'Qalqalah bermaksud?':                            'Qalqalah means?',
      'Alif Lam Qamariyah dibaca secara?':              'Alif Lam Qamariyah is read?',
      'Tanda Alif Lam Qamariyah ialah?':                'The mark of Alif Lam Qamariyah is?',
      'Tanda Alif Lam Syamsiyah ialah?':                'The mark of Alif Lam Syamsiyah is?',
      '"Al-Qamar" adalah contoh?':                      '"Al-Qamar" is an example of?',
      '"Ar-Rahman" adalah contoh?':                     '"Ar-Rahman" is an example of?',
      'Berapa jumlah huruf Syamsiah?':                  'How many Syamsiah letters are there?',
      'Iltiqa Sakinah bermaksud?':                      'Iltiqa Sakinah means?',
      'Jika huruf pertama bukan Mad, diselesaikan dengan?': 'If the first letter is not a Mad letter, resolved by?',
      'Jika huruf pertama ialah huruf Mad, diselesaikan dengan?': 'If the first letter is a Mad letter, resolved by?',
      'Kenapa kasrah ditambah untuk menyelesaikan Iltiqa Sakinah?': 'Why is kasrah added to resolve Iltiqa Sakinah?',
      '"Qulil Allahumma" — apa yang berlaku?':          '"Qulil Allahumma" — what happens?',
      'Iltiqa Sakinah berlaku di antara?':              'Iltiqa Sakinah occurs between?',
      'Hamzah Wasal dibaca apabila?':                   'Hamzah Wasal is read when?',
      'Apabila disambung dalam bacaan, Hamzah Wasal?':  'When connected in recitation, Hamzah Wasal?',
      'Simbol Hamzah Wasal menyerupai?':                'The symbol of Hamzah Wasal resembles?',
      'Hamzah Wasal pada Alif Lam (ال) dibaca baris?':  'Hamzah Wasal on Alif Lam (ال) is read with?',
      "Untuk Fi'il, baris Hamzah Wasal bergantung pada huruf ke?": "For a verb (Fi'il), Hamzah Wasal depends on which letter?",
      'Huruf ke-3 berbaris dhammah, Hamzah Wasal dibaca?': 'If the 3rd letter has dhammah, Hamzah Wasal is read?',
      'Tanda (م) bermaksud?':                           'The mark (م) means?',
      'Tanda (لا) bermaksud?':                          'The mark (لا) means?',
      'Tanda (ج) bermaksud?':                           'The mark (ج) means?',
      'Tanda (ۗ) bermaksud?':                           'The mark (ۗ) means?',
      'Tanda (ۖ) bermaksud?':                           'The mark (ۖ) means?',
      'Tanda Muanaqah (∴ ∴) bermaksud?':                'The Muanaqah mark (∴ ∴) means?',
    };
    return map[ms] ?? ms;
  }

  // ── Translate jawapan ──
  String translateAnswer(String ms) {
    if (!isEn) return ms;
    const map = <String, String>{
      'Kerongkong': 'Throat',
      'Lidah': 'Tongue',
      'Bibir': 'Lips',
      'Hidung': 'Nose',
      'Pangkal Kerongkong': 'Base of Throat',
      'Tengah Kerongkong': 'Middle of Throat',
      'Hujung Kerongkong': 'End of Throat',
      'Dua Bibir': 'Two Lips',
      'Dua Gigi': 'Two Teeth',
      'Lidah & Bibir': 'Tongue & Lips',
      'Rongga Mulut': 'Oral Cavity',
      'Ghunnah (Dengung)': 'Ghunnah (Nasalisation)',
      'Jelas tanpa dengung': 'Clear without nasalisation',
      'Dengan dengung': 'With nasalisation',
      'Dimasukkan': 'Merged',
      'Ditukar': 'Changed',
      'Tersembunyi & dengung': 'Hidden & nasalised',
      'Dimasukkan sepenuhnya': 'Fully merged',
      'Ditukar jadi Nun': 'Changed to Nun',
      'Membaca jelas': 'Read clearly',
      'Memasukkan huruf': 'Merging letters',
      'Menukar huruf': 'Changing letters',
      'Memanjangkan': 'Prolonging',
      'Mutamasilain': 'Mutamasilain',
      'Mutajanisain': 'Mutajanisain',
      'Mutaqaribain': 'Mutaqaribain',
      'Mutabaidain': 'Mutabaidain',
      'Sama makhraj, beza sifat': 'Same makhraj, different characteristics',
      'Sama sifat, beza makhraj': 'Same characteristics, different makhraj',
      'Sama nama': 'Same name',
      'Sama huruf': 'Same letter',
      'Tebal (Tafkhim)': 'Heavy (Tafkhim)',
      'Nipis (Tarqiq)': 'Light (Tarqiq)',
      'Sederhana': 'Moderate',
      'Dengung': 'Nasalisation',
      'Tebal': 'Heavy',
      'Nipis': 'Light',
      'Jelas': 'Clear',
      'Jelas (Izhar)': 'Clear (Izhar)',
      'Dimasukkan (Idgham)': 'Merged (Idgham)',
      'Getaran/Lantunan suara': 'Vibration/Echo',
      'Sembunyi': 'Hidden',
      'Wajib berhenti': 'Must stop',
      'Dilarang berhenti': 'Prohibited from stopping',
      'Boleh berhenti': 'May stop',
      'Sambung lebih utama': 'Continuing preferred',
      'Berhenti lebih utama': 'Stopping preferred',
      'Pilihan': 'Optional',
      'Harus berhenti atau sambung': 'May stop or continue',
      'Wajib berhenti pada kedua-duanya': 'Must stop at both',
      'Berhenti pada salah satu sahaja': 'Stop at only one',
      'Sambung sahaja': 'Continue only',
      'Pertemuan dua huruf mati': 'Meeting of two silent letters',
      'Satu huruf mati': 'One silent letter',
      'Dua baris': 'Two vowels',
      'Huruf dengung': 'Nasal letter',
      'Tambah kasrah': 'Add kasrah',
      'Tambah fathah': 'Add fathah',
      'Buang huruf': 'Drop the letter',
      'Tambah dhammah': 'Add dhammah',
      'Buang huruf Mad': 'Drop the Mad letter',
      'Tambah tasydid': 'Add shadda',
      'Memudahkan sebutan': 'Ease of pronunciation',
      'Hukum wajib sahaja': 'Obligatory rule only',
      'Mengikut rasa': 'By feeling',
      'Hukum nahu': 'Grammar rule',
      'Memulakan bacaan': 'Starting recitation',
      'Disambung dalam bacaan': 'Connected in recitation',
      'Wakaf': 'Waqaf',
      'Pertengahan ayat': 'Mid-verse',
      'Dibaca jelas': 'Read clearly',
      'Gugur (tidak dibaca)': 'Dropped (not read)',
      'Dibaca panjang': 'Read long',
      'Dibaca dengung': 'Read with nasalisation',
      'Kepala huruf Sad (ص)': 'Head of Sad letter (ص)',
      'Hamzah biasa (ء)': 'Regular Hamzah (ء)',
      'Alif biasa': 'Regular Alif',
      'Kepala huruf Ain (ع)': 'Head of Ain letter (ع)',
      'Kasrah': 'Kasrah',
      'Fathah': 'Fathah',
      'Dhammah': 'Dhammah',
      'Sukun': 'Sukun',
      'Huruf ke-2': '2nd letter',
      'Huruf ke-3': '3rd letter',
      'Huruf ke-4': '4th letter',
      'Huruf ke-1': '1st letter',
      'Tengah kalimah': 'Middle of word',
      'Hujung ayat': 'End of verse',
      'Awal ayat': 'Start of verse',
      'Antara dua kalimah': 'Between two words',
      'Huruf mati di tengah kalimah': 'Silent letter mid-word',
      'Huruf mati di hujung ayat ketika waqaf': 'Silent letter at end of verse at waqaf',
      'Huruf berbaris diwaqafkan': 'Vowelled letter at waqaf',
      'Huruf bertemu huruf lain': 'Letter meets another letter',
      'Sugra': 'Sugra',
      'Kubra': 'Kubra',
      'Akbar': 'Akbar',
      'Sama sahaja': 'Same',
      'Mad Arid Lissukun': 'Mad Aridh Lissukun',
      'Mad Lazim': 'Mad Lazim',
      'Mad Iwad': 'Mad Iwadh',
      'Mad Badal': 'Mad Badal',
      'Alif Lam Qamariyah': 'Alif Lam Qamariyah',
      'Alif Lam Syamsiyah': 'Alif Lam Syamsiyah',
      'Tiada hukum': 'No rule',
      'Tasydid (ّ)': 'Shadda (ّ)',
      'Tanwin': 'Tanwin',
      'Dua kalimah berbeza': 'Two separate words',
      'Satu kalimah': 'One word',
      'Awal surah': 'Start of surah',
      'Akhir surah': 'End of surah',
      'Lam mati bertemu Lam mati, kasrah ditambah': 'Silent Lam meets silent Lam, kasrah added',
      'Lam dibuang': 'Lam dropped',
      'Tiada Iltiqa Sakinah': 'No Iltiqa Sakinah',
      'Mim dibuang': 'Mim dropped',
      'Mad Asli bertemu Hamzah dalam satu kalimah': 'Mad Asli meets Hamzah in one word',
      'Mad Asli bertemu Hamzah dalam dua kalimah': 'Mad Asli meets Hamzah in two words',
      'Mad Asli bertemu Sukun': 'Mad Asli meets Sukun',
      'Mad Asli bertemu Tasydid': 'Mad Asli meets Shadda',
      'ب bertemu ب': 'ب meets ب',
      'ت bertemu د': 'ت meets د',
      'ق bertemu ك': 'ق meets ك',
      'ذ bertemu ظ': 'ذ meets ظ',
      '2 hukum': '2 rules',
      '3 hukum': '3 rules',
      '4 hukum': '4 rules',
      '5 hukum': '5 rules',
      'Ba (ب)': 'Ba (ب)',
      'Mim (م)': 'Mim (م)',
      'Wau (و)': 'Wau (و)',
      'Fa (ف)': 'Fa (ف)',
      'Nun (ن)': 'Nun (ن)',
      '14 huruf': '14 letters',
      '26 huruf': '26 letters',
      '15 huruf': '15 letters',
      '28 huruf': '28 letters',
      '6 huruf': '6 letters',
      '4 huruf': '4 letters',
      '10 huruf': '10 letters',
    };
    return map[ms] ?? ms;
  }

  String translateModuleName(String ms) {
  if (!isEn) return ms;
  const map = <String, String>{
    'Makhraj Huruf':       'Letter Articulation',
    'Nun Mati dan Tanwin': 'Silent Nun & Tanwin',
    'Mim Mati':            'Silent Mim',
    'Hukum Idgham':        'Idgham Rules',
    'Hukum Mad':           'Mad Rules',
    'Hukum Ra':            'Ra Rules',
    'Lam Lafaz Jalalah':   'Lam of Jalalah',
    'Qalqalah':            'Qalqalah',
    "Alif Lam Ma'rifah":   'Definite Article',
    'Iltiqa Sakinah':      'Iltiqa Sakinah',
    'Hamzah Wasal':        'Hamzah Wasal',
    'Tanda Tanda Waqaf':   'Waqaf Signs',
  };
  return map[ms] ?? ms;
}

  // ── Translate penjelasan ──
  String translateExplanation(String ms) {
    if (!isEn) return ms;
    const map = <String, String>{
      'Al-Halq (الحَلْق) = kerongkong. Ia merangkumi 3 peringkat: pangkal (أ هـ), tengah (ع غ), dan hujung kerongkong (ح خ).':
          'Al-Halq (الحَلْق) = throat. It comprises 3 levels: base (أ هـ), middle (ع غ), and end of throat (ح خ).',
      'Huruf أ dan هـ keluar dari Aqsal Halq (pangkal kerongkong) — iaitu bahagian paling dalam kerongkong.':
          'Letters أ and هـ emerge from Aqsal Halq (base of throat) — the deepest part of the throat.',
      'Huruf ع dan غ keluar dari Wastal Halq (tengah kerongkong). Manakala ح dan خ pula keluar dari hujung kerongkong (Adnal Halq).':
          'Letters ع and غ emerge from Wastal Halq (middle throat). While ح and خ emerge from the end of throat (Adnal Halq).',
      'Asy-Syafatain = dua bibir. Huruf ب dan م keluar dari kedua-dua bibir bertemu, manakala و dari bibir yang terbuka sedikit.':
          'Asy-Syafatain = two lips. Letters ب and م emerge from both lips meeting, while و from slightly open lips.',
      'Al-Khaisyum (pangkal hidung) adalah makhraj bagi bunyi ghunnah — iaitu dengung pada huruf Nun dan Mim bertasydid.':
          'Al-Khaisyum (nasal passage) is the makhraj for ghunnah — nasalisation on Nun and Mim with shadda.',
      'Terdapat 5 makhraj utama: Al-Jauf, Al-Halq, Al-Lisan, Asy-Syafatain, dan Al-Khaisyum.':
          'There are 5 main makhraj: Al-Jauf, Al-Halq, Al-Lisan, Asy-Syafatain, and Al-Khaisyum.',
      'Iqlab: Nun Mati bertukar menjadi Mim (مْ) apabila bertemu ب, dan dibaca dengan dengung (ghunnah) 2 harakat.':
          'Iqlab: Silent Nun changes to Mim (مْ) when meeting ب, read with 2 counts of nasalisation.',
      'Izhar Halqi = jelas & terang. Berlaku apabila Nun Mati bertemu mana-mana dari 6 huruf halqi: أ هـ ع غ ح خ.':
          'Izhar Halqi = clear & distinct. Occurs when Silent Nun meets any of the 6 halqi letters: أ هـ ع غ ح خ.',
      'Terdapat 15 huruf Ikhfa Haqiqi. Cara bacaannya antara jelas dan dengung — Nun Mati tidak hilang sepenuhnya.':
          'There are 15 Ikhfa Haqiqi letters. Read between clear and nasal — the Silent Nun does not fully disappear.',
      'Idgham Maal Ghunnah: Nun Mati dimasukkan ke dalam huruf ي ن م و berserta dengung 2 harakat.':
          'Idgham Maal Ghunnah: Silent Nun is merged into ي ن م و with 2 counts of nasalisation.',
      'Idgham Bila Ghunnah: Nun Mati dimasukkan ke dalam ر atau ل tanpa sebarang dengung.':
          'Idgham Bila Ghunnah: Silent Nun is merged into ر or ل without any nasalisation.',
      '"Man Araada" — Nun Mati bertemu أ (huruf halqi), maka dibaca terang & jelas tanpa dengung.':
          '"Man Araada" — Silent Nun meets أ (halqi letter), so it is read clearly without nasalisation.',
      'Terdapat 3 hukum Mim Mati: Ikhfa Syafawi, Idgham Syafawi, dan Izhar Syafawi.':
          'There are 3 rules for Silent Mim: Ikhfa Syafawi, Idgham Syafawi, and Izhar Syafawi.',
      'Ikhfa Syafawi hanya berlaku apabila Mim Mati bertemu ب — dibaca tersembunyi dengan dengung ringan dari bibir.':
          'Ikhfa Syafawi only occurs when Silent Mim meets ب — read hidden with light nasalisation from the lips.',
      'Ikhfa Syafawi: bibir tidak rapat sepenuhnya, Mim dibaca antara Izhar dan Idgham sambil dengung 2 harakat.':
          'Ikhfa Syafawi: lips do not close fully, Mim is read between Izhar and Idgham with 2 counts of nasalisation.',
      'Apabila Mim Mati bertemu Mim, ia disebut Idgham Syafawi atau Idgham Mutamasilain — dimasukkan dengan dengung 2 harakat.':
          'When Silent Mim meets Mim, it is called Idgham Syafawi — merged with 2 counts of nasalisation.',
      'Mim Mati bertemu huruf selain ب dan م = Izhar Syafawi: Mim dibaca jelas dari bibir tanpa dengung.':
          'Silent Mim meets letters other than ب and م = Izhar Syafawi: Mim is read clearly from the lips without nasalisation.',
      'Izhar Syafawi melibatkan semua 26 huruf Hijaiyah selain ب dan م apabila bertemu Mim Mati.':
          'Izhar Syafawi involves all 26 Hijaiyah letters other than ب and م when meeting Silent Mim.',
      'Idgham (إدغام) = memasukkan — satu huruf dimasukkan ke dalam huruf berikutnya sehingga menjadi satu huruf bertasydid.':
          'Idgham (إدغام) = merging — one letter is merged into the next until they become one letter with shadda.',
      'Mutamasilain (مُتَمَاثِلَيْن) = dua huruf yang sama jenis. Contoh: ب bertemu ب, atau د bertemu د.':
          'Mutamasilain (مُتَمَاثِلَيْن) = two letters of the same type. Example: ب meets ب, or د meets د.',
      '"Idhrib Biashaak" — ب bertemu ب, dimasukkan menjadi satu bunyi ب bertasydid. Inilah Mutamasilain.':
          '"Idhrib Biashaak" — ب meets ب, merged into one ب with shadda. This is Mutamasilain.',
      'ت dan ط berkongsi makhraj yang sama (hujung lidah) tetapi berbeza sifat — ini disebut Mutajanisain.':
          'ت and ط share the same makhraj (tip of tongue) but differ in characteristics — this is Mutajanisain.',
      'ق dan ك berdekatan dari segi makhraj dan sifat — ini disebut Idgham Mutaqaribain.':
          'ق and ك are close in makhraj and characteristics — this is Idgham Mutaqaribain.',
      'Mutajanisain (مُتَجَانِسَيْن) = sama makhraj, beza sifat. Contoh lain: ذ bertemu ظ, atau ث bertemu ذ.':
          'Mutajanisain (مُتَجَانِسَيْن) = same makhraj, different characteristics. Other examples: ذ meets ظ, or ث meets ذ.',
      'Terdapat 3 huruf Mad: Alif (ا) selepas fathah, Wau (و) selepas dhammah, Ya (ي) selepas kasrah.':
          'There are 3 Mad letters: Alif (ا) after fathah, Wau (و) after dhammah, Ya (ي) after kasrah.',
      "Mad Asli (Mad Tabi'i) dibaca 2 harakat — kadar paling asas bagi semua jenis Mad.":
          "Mad Asli (Mad Tabi'i) is read for 2 counts — the most basic length for all Mad types.",
      'Mad Wajib Muttasil: huruf Mad bertemu Hamzah dalam satu kalimah yang sama, dibaca 4 atau 5 harakat.':
          'Mad Wajib Muttasil: Mad letter meets Hamzah in the same word, read 4 or 5 counts.',
      'Mad Jaiz Munfasil berlaku apabila Mad Asli bertemu Hamzah dalam dua kalimah berasingan — dibaca 4 atau 5 harakat.':
          'Mad Jaiz Munfasil occurs when Mad Asli meets Hamzah in two separate words — read 4 or 5 counts.',
      'Mad Arid Lissukun berlaku apabila berhenti (waqaf) pada huruf selepas huruf Mad — boleh dibaca 2, 4, atau 6 harakat.':
          'Mad Aridh Lissukun occurs when stopping (waqaf) on a letter after a Mad letter — may be read 2, 4, or 6 counts.',
      'Mad Lazim Kilmi Muthaqqal: huruf Mad diikuti tasydid dalam satu kalimah — WAJIB dibaca 6 harakat tanpa pilihan.':
          'Mad Lazim Kilmi Muthaqqal: Mad letter followed by shadda in one word — MUST be read 6 counts without choice.',
      'Ra berbaris fathah sentiasa dibaca tebal (Tafkhim) — bunyi Ra digemukkan ke belakang rongga mulut.':
          'Ra with fathah is always read heavily (Tafkhim) — the Ra sound is thickened towards the back of the mouth.',
      'Ra berbaris kasrah dibaca nipis (Tarqiq) — bunyi Ra dimainkan halus ke hadapan mulut.':
          'Ra with kasrah is read lightly (Tarqiq) — the Ra sound is made thin towards the front of the mouth.',
      'Tafkhim (تَفْخِيم) = tebal. Ra berbaris atas atau dhammah dibaca dengan menggemukkan bunyi.':
          'Tafkhim (تَفْخِيم) = heavy. Ra with fathah or dhammah is read with a thickened sound.',
      "Walaupun sebelum Ra ada kasrah, jika selepasnya huruf Isti'la (خ ص ض غ ط ق ظ), Ra tetap dibaca tebal (Tafkhim).":
          "Even though Ra is preceded by kasrah, if followed by an Isti'la letter (خ ص ض غ ط ق ظ), Ra is still read heavily (Tafkhim).",
      'Ra mati yang sebelumnya Ya mati (ي ساكن) dibaca nipis (Tarqiq) kerana pengaruh sifat kasrah yang tersembunyi pada Ya.':
          'Silent Ra preceded by silent Ya (ي ساكن) is read lightly (Tarqiq) due to the hidden kasrah quality of Ya.',
      '"Rizqan" (رِزْقًا) — Ra berbaris kasrah, maka dibaca nipis (Tarqiq).':
          '"Rizqan" (رِزْقًا) — Ra with kasrah, so read lightly (Tarqiq).',
      'Lafaz Jalalah merujuk kepada nama Allah (اللّٰه) — nama mulia Tuhan Yang Maha Esa.':
          'Lafaz Jalalah refers to the name Allah (اللّٰه) — the glorious name of the One God.',
      'Huruf sebelum Allah berbaris fathah → Lam dibaca tebal (Tafkhim). Sama juga jika berbaris dhammah.':
          'Letter before Allah has fathah → Lam read heavily (Tafkhim). Same if it has dhammah.',
      'Huruf sebelum Allah berbaris kasrah → Lam dibaca nipis (Tarqiq). Contoh: Bismillah, Lillahi.':
          'Letter before Allah has kasrah → Lam read lightly (Tarqiq). Example: Bismillah, Lillahi.',
      '"Rasulullah" — huruf ل sebelum Allah berbaris dhammah, maka Lam Jalalah dibaca tebal (Tafkhim).':
          '"Rasulullah" — letter ل before Allah has dhammah, so Lam Jalalah is read heavily (Tafkhim).',
      '"Bismillah" — huruf م sebelum Allah berbaris kasrah, maka Lam Jalalah dibaca nipis (Tarqiq).':
          '"Bismillah" — letter م before Allah has kasrah, so Lam Jalalah is read lightly (Tarqiq).',
      'Terdapat 2 cara bacaan Lam Jalalah: Tafkhim (tebal) dan Tarqiq (nipis) — bergantung baris huruf sebelumnya.':
          'There are 2 ways to read Lam Jalalah: Tafkhim (heavy) and Tarqiq (light) — depending on the preceding vowel.',
      'Terdapat 5 huruf Qalqalah yang dihafal melalui frasa "Qutbu Jaddin" (قُطْبُ جَدٍّ): ق ط ب ج د.':
          'There are 5 Qalqalah letters memorised through "Qutbu Jaddin" (قُطْبُ جَدٍّ): ق ط ب ج د.',
      'Frasa "Qutbu Jaddin" (قُطْبُ جَدٍّ) mengandungi semua 5 huruf Qalqalah: ق ط ب ج د.':
          'The phrase "Qutbu Jaddin" (قُطْبُ جَدٍّ) contains all 5 Qalqalah letters: ق ط ب ج د.',
      'Qalqalah Sugra (kecil) — huruf Qalqalah mati di tengah kalimah. Lantunannya paling lemah antara tiga peringkat.':
          'Qalqalah Sugra (minor) — Qalqalah letter is silent mid-word. Its echo is the weakest of the three levels.',
      'Qalqalah Kubra (besar) — huruf Qalqalah mati di hujung ayat ketika waqaf. Contoh: الْفَلَق apabila diwaqafkan.':
          'Qalqalah Kubra (major) — Qalqalah letter is silent at end of verse at waqaf. Example: الْفَلَق when stopped.',
      'Qalqalah Akbar ialah yang paling kuat — berlaku apabila huruf Qalqalah berbaris penuh dan kemudian diwaqafkan.':
          'Qalqalah Akbar is the strongest — occurs when a Qalqalah letter is fully vowelled and then stopped at.',
      'Qalqalah (قَلْقَلَة) = getaran atau lantunan suara. Huruf-huruf ini tidak boleh disebut statik apabila mati.':
          'Qalqalah (قَلْقَلَة) = vibration or echo. These letters cannot be pronounced statically when silent.',
      'Alif Lam Qamariyah dibaca jelas (Izhar) — Lam dibaca nyata dengan tanda sukun di atasnya.':
          'Alif Lam Qamariyah is read clearly (Izhar) — Lam is pronounced distinctly with a sukun mark above it.',
      'Tanda Qamariyah ialah sukun (ْ) di atas huruf Lam — menunjukkan Lam dibaca jelas.':
          'The Qamariyah mark is sukun (ْ) above the Lam — indicating Lam is read clearly.',
      'Tanda Syamsiyah ialah tasydid (ّ) pada huruf selepas Lam — menunjukkan Lam telah dimasukkan ke dalam huruf tersebut.':
          'The Syamsiyah mark is shadda (ّ) on the letter after Lam — indicating Lam has been merged into that letter.',
      '"Al-Qamar" (الْقَمَر) — huruf ق adalah huruf Qamariyah, maka Lam dibaca jelas dengan sukun.':
          '"Al-Qamar" (الْقَمَر) — letter ق is a Qamariyah letter, so Lam is read clearly with sukun.',
      '"Ar-Rahman" — huruf ر adalah huruf Syamsiyah, maka Lam dimasukkan ke dalam Ra (bertasydid).':
          '"Ar-Rahman" — letter ر is a Syamsiah letter, so Lam is merged into Ra (with shadda).',
      'Terdapat 14 huruf Syamsiyah — sama banyak dengan huruf Qamariyah. Keduanya melengkapi 28 huruf Hijaiyah.':
          'There are 14 Syamsiah letters — equal in number to Qamariyah. Together they complete the 28 Hijaiyah letters.',
      'Iltiqa Sakinah = pertemuan dua huruf yang mati berturutan, menyebabkan kesukaran dalam sebutan.':
          'Iltiqa Sakinah = meeting of two consecutively silent letters, causing difficulty in pronunciation.',
      'Kasrah (baris bawah) ditambah pada huruf pertama yang mati supaya dapat disebut dengan lancar.':
          'Kasrah (lower vowel) is added to the first silent letter so it can be pronounced smoothly.',
      'Apabila huruf pertama ialah huruf Mad (ا و ي), ia dibuang untuk menyelesaikan Iltiqa Sakinah.':
          'When the first letter is a Mad letter (ا و ي), it is dropped to resolve Iltiqa Sakinah.',
      'Kasrah ditambah semata-mata untuk memudahkan sebutan — dua huruf mati berturutan mustahil disebut tanpa vokal.':
          'Kasrah is added solely to ease pronunciation — two consecutive silent letters cannot be spoken without a vowel.',
      'Lam mati (ل) pada "Qul" bertemu Lam mati pada "Allah" — kasrah ditambah pada Lam pertama: "Qul-i-llahumma".':
          'Silent Lam (ل) in "Qul" meets silent Lam in "Allah" — kasrah added to the first Lam: "Qul-i-llahumma".',
      'Iltiqa Sakinah berlaku apabila hujung satu kalimah mati bertemu awal kalimah berikutnya yang juga bermula dengan sukun.':
          'Iltiqa Sakinah occurs when the end of one word is silent and meets the start of the next word which also begins with sukun.',
      'Hamzah Wasal hanya dibaca apabila kita memulakan bacaan dari kalimah tersebut.':
          'Hamzah Wasal is only read when we begin recitation from that word.',
      'Apabila disambung dalam bacaan, Hamzah Wasal gugur — tidak disebut langsung.':
          'When connected in recitation, Hamzah Wasal drops — not pronounced at all.',
      'Simbol Hamzah Wasal menyerupai kepala huruf Sad (ص) kecil yang diletakkan di atas Alif.':
          'The Hamzah Wasal symbol resembles a small head of the Sad letter (ص) placed above an Alif.',
      "Hamzah Wasal pada Alif Lam Ma'rifah sentiasa dibaca dengan baris fathah (atas).":
          "Hamzah Wasal on Alif Lam Ma'rifah is always read with fathah.",
      "Untuk Fi'il (kata kerja), tengok baris huruf ketiga — kasrah/fathah → baca kasrah; dhammah → baca dhammah.":
          "For a verb (Fi'il), look at the third letter's vowel — kasrah/fathah → read kasrah; dhammah → read dhammah.",
      'Apabila huruf ketiga berbaris dhammah (ٱنظُر), Hamzah Wasal juga dibaca dengan dhammah.':
          'When the third letter has dhammah (ٱنظُر), Hamzah Wasal is also read with dhammah.',
      'Tanda م (Lazim) = WAJIB berhenti. Jika tidak berhenti, makna ayat boleh berubah atau rosak.':
          'Mark م (Lazim) = MUST stop. If not stopped, the meaning of the verse may change or be corrupted.',
      'Tanda لا = DILARANG berhenti. Jika terpaksa berhenti, kembali ke permulaan ayat atau kalimah sebelumnya.':
          'Mark لا = PROHIBITED from stopping. If forced to stop, return to the start of the verse or previous word.',
      'Tanda ج (Jaiz) = harus — boleh berhenti atau menyambung, kedua-dua pilihan dibenarkan.':
          'Mark ج (Jaiz) = permissible — may stop or continue, both options are allowed.',
      'Tanda ۗ = berhenti lebih utama daripada menyambung, walaupun menyambung masih dibenarkan.':
          'Mark ۗ = stopping is preferred over continuing, although continuing is still allowed.',
      'Tanda ۖ = menyambung bacaan lebih utama, walaupun berhenti masih dibenarkan.':
          'Mark ۖ = continuing recitation is preferred, although stopping is still allowed.',
      'Muanaqah = dua tanda berpasangan. Berhenti pada salah satu sahaja — TIDAK BOLEH berhenti pada kedua-duanya.':
          'Muanaqah = two paired marks. Stop at only one — CANNOT stop at both.',
    };
    return map[ms] ?? ms;
  }
}