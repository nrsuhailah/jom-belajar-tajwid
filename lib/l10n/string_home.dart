// ============================================================
// app_strings_home.dart  — String untuk HomePage & SubMenuPage
// ============================================================

class SHome {
  final bool isEn;
  const SHome(this.isEn);

  // ── HomePage ──
  String get homeTitle   => isEn ? "TajwidMaster" : 'TajwidMaster';
  String get search      => isEn ? 'Search tajwid rules...' : 'Cari hukum tajwid...';
  String get noResult    => isEn ? 'No results found.' : 'Tiada hasil ditemukan.';
  String get quizLabel   => isEn ? 'Quiz' : 'Kuiz';

  // ── Card Titles (HomePage grid) ──
  String get cardMakhraj       => isEn ? 'Makhraj\nLetters'         : 'Makhraj\nHuruf';
  String get cardNunMati       => isEn ? 'Silent Nun\n& Tanwin'     : 'Nun Mati\ndan Tanwin';
  String get cardMimMati       => isEn ? 'Silent Mim'               : 'Mim Mati';
  String get cardHukumIdgham   => isEn ? 'Idgham\nRules'            : 'Hukum\nIdgham';
  String get cardHukumMad      => isEn ? 'Mad Rules'                : 'Hukum Mad';
  String get cardHukumRa       => isEn ? 'Ra Rules'                 : 'Hukum Ra';
  String get cardLamJalalah    => isEn ? 'Lam Lafaz\nJalalah'       : 'Lam Lafaz\nJalalah';
  String get cardQalqalah      => isEn ? 'Qalqalah'                 : 'Qalqalah';
  String get cardAlifLam       => isEn ? 'Definite\nArticle'        : 'Alif Lam\nMarifah';
  String get cardIltiqa        => isEn ? 'Iltiqa\nSakinah'          : 'Iltiqa\nSakinah';
  String get cardHamzah        => isEn ? 'Hamzah\nWasal'            : 'Hamzah\nWasal';
  String get cardWaqaf         => isEn ? 'Waqaf\nSigns'             : 'Tanda-Tanda\nWaqaf';

  // ── SubMenuPage ──
  String get description => isEn ? 'Description' : 'Penerangan';

  // ── infoHukum untuk SubMenuPage ──
  Map<String, List<String>> get infoHukum => isEn ? {
    'Makhraj Huruf':       ['Place of articulation for Hijaiyah letters', 'Divided into 5 main sections:'],
    'Nun Mati dan Tanwin': ['Rules for Silent Nun (نْ) and Tanwin', 'There are 4 main rules:'],
    'Mim Mati':            ['Rules when Silent Mim (م) meets Hijaiyah letters', 'Divided into 3 main rules:'],
    'Hukum Idgham':        ['Silent Nun or Tanwin merged with the following letter', 'Divided into 3 main rules:'],
    'Hukum Mad':           ['Prolonging the vowel sound on mad letters', 'Divided into 8 types of mad:'],
    'Mad Lazim':           [
      'Mad Lazim must be read 6 counts.',
      'Occurs when a mad letter meets an original sukun or a shadda letter.',
      'Divided into 4 main types:',
    ],
    'Hukum Ra':            ['Rules for reciting the letter Ra (ر)', 'Divided into 2 types:'],
    'Qalqalah':            ['Echo on qalqalah letters: ق ط ب ج د', 'Divided into 3 types:'],
    'Alif Lam Marifah':    ['Rules for Alif Lam when meeting Hijaiyah letters', 'Divided into 2:'],
  } : {
    'Makhraj Huruf':       ['Tempat keluar bunyi huruf hijaiyah', 'Terbahagi kepada 5 bahagian utama:'],
    'Nun Mati dan Tanwin': ['Hukum bacaan Nun mati atau sukun(ن) dan Tanwin', 'Terdapat 4 hukum utama:'],
    'Mim Mati':            ['Hukum apabila huruf Mim Mati (م) bertemu huruf hijaiyah', 'Terbahagi kepada 3 hukum utama:'],
    'Hukum Idgham':        ['Bacaan Nun Mati atau Tanwin disatukan dengan huruf yang mengikutinya', 'Terbahagi kepada 3 hukum utama:'],
    'Hukum Mad':           ['Memanjangkan bunyi suara pada huruf mad', 'Terbahagi kepada 8 jenis hukum mad:'],
    'Mad Lazim':           [
      'Mad Lazim wajib dibaca 6 harakat.',
      'Berlaku apabila huruf mad bertemu sukun asli atau huruf bersabdu (tasydid).',
      'Terbahagi kepada 4 jenis utama:',
    ],
    'Hukum Ra':            ['Hukum bacaan huruf Ra (ر) di dalam ayat', 'Terbahagi kepada 2 jenis:'],
    'Qalqalah':            ['Lantunan pada huruf qalqalah: ق ط ب ج د', 'Terbahagi kepada 3 jenis:'],
    'Alif Lam Marifah':    ['Hukum Alif Lam apabila bertemu huruf hijaiyah', 'Terbahagi kepada 2:'],
  };

  // ── Translate tajuk sub-hukum ──
  String translateTitle(String ms) {
    if (!isEn) return ms;
    const map = <String, String>{
      'Kerongkong':                     'Throat',
      'Lidah':                          'Tongue',
      'Dua Bibir':                      'Two Lips',
      'Rongga Hidung':                  'Nasal Cavity',
      'Rongga Mulut':                   'Oral Cavity',
      'Izhar Halqi':                    'Izhar Halqi',
      'Idgham Maal Ghunnah':            'Idgham Maal Ghunnah',
      'Idgham Bila Ghunnah':            'Idgham Bila Ghunnah',
      'Iqlab':                          'Iqlab',
      "Ikhfa' Haqiqi":                  "Ikhfa' Haqiqi",
      "Ikhfa' Syafawi":                 "Ikhfa' Syafawi",
      'Idgham Mithlain':                'Idgham Mithlain',
      'Izhar Syafawi':                  'Izhar Syafawi',
      'Idgham Mutamathilain':           'Idgham Mutamathilain',
      'Idgham Mutajanisain':            'Idgham Mutajanisain',
      'Idgham Mutaqaribain':            'Idgham Mutaqaribain',
      'Mad Asli':                       'Mad Asli (Natural Mad)',
      'Mad Lin':                        'Mad Lin',
      'Mad Iwadh':                      'Mad Iwadh',
      'Mad Tamkin':                     'Mad Tamkin',
      'Mad Silah Qasirah':              'Mad Silah Qasirah',
      'Mad Silah Thowilah':             'Mad Silah Thowilah',
      'Mad Lazim Kalimi Mukhaffaf':     'Mad Lazim Kalimi Mukhaffaf',
      'Mad Lazim Kalimi Muthaqqal':     'Mad Lazim Kalimi Muthaqqal',
      'Mad Lazim Harfi Mukhaffaf':      'Mad Lazim Harfi Mukhaffaf',
      'Mad Lazim Harfi Muthaqqal':      'Mad Lazim Harfi Muthaqqal',
      'Mad Aridh Lissukun':             'Mad Aridh Lissukun',
      'Mad Wajib Muttasil':             'Mad Wajib Muttasil',
      'Mad Jaiz Munfasil':              'Mad Jaiz Munfasil',
      'Qalqalah Sughra':                'Qalqalah Sughra (Minor)',
      'Qalqalah Kubra':                 'Qalqalah Kubra (Major)',
      'Qalqalah Akbar':                 'Qalqalah Akbar (Strongest)',
      'Ra Tafkhim (Tebal)':             'Ra Tafkhim (Heavy)',
      'Ra Tarqiq (Nipis)':              'Ra Tarqiq (Light)',
      'Lam pada Lafaz Jalalah':         'Lam on Lafaz Jalalah',
      'Alif Lam Qamariah':              'Alif Lam Qamariah',
      'Alif Lam Syamsiah':              'Alif Lam Syamsiah',
      "Iltiqa' Sakinah (Nun Wiqayah)":  "Iltiqa' Sakinah (Nun Wiqayah)",
      'Hamzah Wasal':                   'Hamzah Wasal',
      'Waqaf Lazim':                    'Waqaf Lazim (Obligatory)',
      'Waqaf Qala':                     'Waqaf Qala',
      "Waqaf Ta'anuq":                  "Waqaf Ta'anuq",
      'Waqaf Jaiz':                     'Waqaf Jaiz (Permissible)',
      'Waqaf Sala':                     'Waqaf Sala',
      'Waqaf Tegah':                    'Waqaf Tegah (Prohibited)',
      "Ra'sul Ayah":                    'End of Verse',
    };
    return map[ms] ?? ms;
  }

  // ── Translate penerangan sub-hukum ──
  String translateDesc(String ms) {
    if (!isEn) return ms;
    const map = <String, String>{
      'Pangkal Kerongkong: ء هـ ; Tengah Kerongkong: ع ح ; Hujung Kerongkong: غ خ':
          'Base of Throat: ء هـ ; Middle of Throat: ع ح ; End of Throat: غ خ',
      'Berlaku apabila nun mati atau tanwin bertemu salah satu huruf izhar: ء هـ ع ح غ خ':
          'Occurs when silent Nun or Tanwin meets one of the izhar letters: ء هـ ع ح غ خ',
      'Berlaku apabila nun mati atau tanwin bertemu salah satu daripada huruf idgham maal ghunnah: ي ن م و':
          'Occurs when silent Nun or Tanwin meets one of the idgham letters: ي ن م و',
      'Berlaku apabila nun mati atau tanwin bertemu salah satu huruf idgham bila ghunnah: ل ر':
          'Occurs when silent Nun or Tanwin meets: ل ر',
      'Menukarkan bunyi Nun mati kepada bunyi Mim (م) apabila bertemu huruf: ب':
          'Converts silent Nun to Mim (م) when meeting: ب',
      'Berlaku apabila nun mati atau tanwin bertemu salah satu huruf ikhfa: ت ث ج د ذ ز س ش ص ض ط ظ ف ق ك':
          'Occurs when silent Nun or Tanwin meets one of the 15 ikhfa letters: ت ث ج د ذ ز س ش ص ض ط ظ ف ق ك',
      'Mim mati bertemu huruf ب dibaca dengung 2 harakat.':
          'Silent Mim meets ب, read with 2 counts of nasalisation.',
      'Mim mati bertemu mim bertanda sabdu dibaca dengung 2 harakat.':
          'Silent Mim meets shadda Mim, read with 2 counts of nasalisation.',
      'Mim mati bertemu huruf selain م dan ب, dibaca jelas tanpa dengung.':
          'Silent Mim meets letters other than م and ب, read clearly without nasalisation.',
      'Pertemuan dua huruf yang sama makhraj dan sifatnya.':
          'Two letters with the same makhraj and characteristics.',
      'Pertemuan dua huruf yang sama makhraj tetapi berlainan sifat.':
          'Two letters with the same makhraj but different characteristics.',
      'Pertemuan dua huruf yang makhraj dan sifatnya hampir sama.':
          'Two letters with similar makhraj and characteristics.',
      'Memanjangkan bacaan ayat sebanyak 2 harakat.':
          'Prolonging recitation by 2 counts.',
      'Berlaku apabila huruf Wau (و) atau Ya (ي) mati didahului huruf berbaris atas, dan selepasnya ada huruf yang diwakafkan. Dibaca 2, 4, atau 6 harakat.':
          'Occurs when silent Wau (و) or Ya (ي) is preceded by a fathah letter and followed by a waqaf letter. Read 2, 4, or 6 counts.',
      'Berlaku apabila berhenti (waqaf) pada huruf yang berbaris Fathatain (baris dua di atas), kecuali Ta Marbutah dan baris tanwin diganti dengan mad asli 2 harakat.':
          'Occurs when stopping (waqaf) on a double-fathah letter (except Ta Marbutah), replacing tanwin with 2 counts of mad.',
      'Pertemuan diantara dua huruf Ya (ي). Ya pertama berbaris bawah dan bersabdu, manakala Ya kedua mati dan dibaca 2 harakat untuk menetapkan bunyi Ya (ي).':
          'Two Ya (ي) letters meet. The first has kasrah and shadda; the second is silent, read 2 counts to establish the Ya sound.',
      'Berlaku pada Ha Dhamir (هـ) yang diapit dua huruf berbaris, dan selepasnya BUKAN Hamzah. Dibaca 2 harakat.':
          'Occurs on Ha Dhamir (هـ) flanked by two vowelled letters, not followed by Hamzah. Read 2 counts.',
      'Berlaku apabila Ha Dhamir (هـ) bertemu dengan huruf Hamzah (ء) dalam kalimah berasingan. Dibaca 4 atau 5 harakat.':
          'Occurs when Ha Dhamir (هـ) meets Hamzah (ء) in a separate word. Read 4 or 5 counts.',
      'Klik untuk melihat 4 pembahagian utama Mad Lazim.':
          'Tap to see 4 main divisions of Mad Lazim.',
      'Mad Lazim wajib dibaca 6 harakat.':
          'Mad Lazim must be read 6 counts.',
      'Berlaku apabila huruf mad bertemu sukun asli atau huruf bersabdu (tasydid).':
          'Occurs when a mad letter meets an original sukun or a shadda letter.',
      'Terbahagi kepada 4 jenis utama:':
          'Divided into 4 main types:',
      'Huruf Mad bertemu sukun mendatang kerana berhenti (waqaf).':
          'Mad letter meets a temporary sukun due to stopping (waqaf).',
      'Huruf Mad bertemu Hamzah dalam satu kalimah (4-5 harakat).':
          'Mad letter meets Hamzah in the same word (4-5 counts).',
      'Huruf Mad bertemu Hamzah dalam dua kalimah berbeza (2, 4, 5 harakat).':
          'Mad letter meets Hamzah in two separate words (2, 4, 5 counts).',
      'Huruf mad bertemu sukun asli dalam satu kalimah tanpa idgham (sabdu). Dibaca 6 harakat.':
          'Mad letter meets original sukun in one word without idgham. Read 6 counts.',
      'Huruf mad bertemu huruf bertasydid (sabdu) dalam satu kalimah. Dibaca 6 harakat.':
          'Mad letter meets a shadda letter in one word. Read 6 counts.',
      'Berlaku pada huruf di awal surah yang tidak diidghamkan. Dibaca 6 harakat.':
          'Occurs on letters at the start of a surah that are not merged. Read 6 counts.',
      'Berlaku pada huruf di awal surah yang diidghamkan kepada huruf seterusnya. Dibaca 6 harakat.':
          'Occurs on letters at the start of a surah merged into the next. Read 6 counts.',
      'Lantunan kecil di tengah kalimah.':
          'Minor echo in the middle of a word.',
      'Lantunan kuat di akhir kalimah kerana waqaf.':
          'Strong echo at the end of a word due to waqaf.',
      'Lantunan paling kuat pada huruf qalqalah yang bersabdu.':
          'Strongest echo on a qalqalah letter with shadda.',
      'Ra dibaca tebal apabila berbaris atas, depan, atau sukun yang didahului baris atas/depan.':
          'Ra is read heavily when it has fathah, dhammah, or sukun preceded by fathah/dhammah.',
      'Ra dibaca nipis apabila berbaris bawah atau sukun yang didahului baris bawah asli.':
          'Ra is read lightly when it has kasrah or sukun preceded by original kasrah.',
      'Tebal (Tafkhim) jika huruf sebelumnya baris atas/depan. Nipis (Tarqiq) jika sebelumnya baris bawah.':
          'Heavy (Tafkhim) if preceded by fathah/dhammah. Light (Tarqiq) if preceded by kasrah.',
      'Alif Lam bertemu huruf Qamariah. Huruf Lam dibaca jelas (Izhar). Tanda sukun jelas di atas Lam.':
          'Alif Lam meets a Qamariah letter. Lam is read clearly (Izhar). Sukun mark visible on Lam.',
      'Alif Lam bertemu huruf Syamsiah. Bunyi Lam dimasukkan ke huruf seterusnya (Idgham). Tanda sabdu pada huruf selepas Lam.':
          'Alif Lam meets a Syamsiah letter. Lam merged into the next letter (Idgham). Shadda on the next letter.',
      "Pertemuan dua sukun antara dua kalimah. Biasanya ditambah bunyi \"ni\" (nun kecil) untuk menyambung bacaan.":
          'Meeting of two sukun between two words. A small "ni" sound is added to connect the recitation.',
      "Hamzah tambahan yang dibaca jika memulakan bacaan (Ibtida') dan digugurkan jika dibaca secara sambung (Wasal).":
          "Additional hamzah read when starting (Ibtida') and dropped when connected (Wasal).",
      'Dituntut berhenti pada tanda ini. Jika tidak berhenti, makna ayat akan berubah atau menjadi salah.':
          'Stopping is required here. If not stopped, the meaning may change or become incorrect.',
      'Waqaf lebih utama berbanding wasal. Lebih baik berhenti di sini walaupun boleh disambung.':
          'Stopping is preferred over continuing. Better to stop even though continuing is allowed.',
      'Tanda ini hadir berpasangan. Boleh berhenti pada salah satu tanda sahaja, tidak boleh berhenti pada kedua-duanya sekali.':
          'This mark appears in pairs. Stop at only one — not both.',
      'Harus berhenti atau menyambung bacaan. Kedua-dua pilihan adalah sama.':
          'Either stopping or continuing is permissible. Both options are equal.',
      'Wasal (sambung) lebih utama berbanding waqaf. Lebih baik disambung walaupun boleh berhenti.':
          'Continuing is preferred over stopping. Better to continue even though stopping is allowed.',
      'Tidak elok berhenti pada tanda ini kerana boleh mengubah makna atau merosakkan bacaan.':
          'Stopping here is disliked as it may alter the meaning or ruin the recitation.',
      'Tanda berakhirnya satu-satu ayat Al-Quran. Boleh berhenti atau menyambung ke ayat seterusnya.':
          'Marks the end of a Quranic verse. May stop or continue to the next verse.',
    };
    return map[ms] ?? ms;
  }
}