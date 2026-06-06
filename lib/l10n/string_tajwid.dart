// ============================================================
// string_tajwid.dart
// String untuk NunMatiPage, DetailContentPage, WaqafPage
// ============================================================

class STajwid {
  final bool isEn;
  const STajwid(this.isEn);

  // ── Label umum ──
  String get notaTajwid    => isEn ? 'Tajwid Notes'      : 'Nota Tajwid';
  String get maklumat      => isEn ? 'Information'        : 'Maklumat';
  String get contohBacaan  => isEn ? 'Reading Examples 🔊': 'Contoh Bacaan 🔊';
  String get jomBerlatih   => isEn ? "Let's Practice! 🎯" : 'Jom Berlatih! 🎯';
  String get rajahMakhraj  => isEn ? 'Makhraj Diagram'   : 'Rajah Makhraj';
  String get listen        => isEn ? 'Listen'            : 'Dengar';
  String get stop          => isEn ? 'Stop'              : 'Berhenti';
  String get play          => isEn ? 'Play'              : 'Main';
  String get bookmarkSaved   => isEn ? '✅ Saved to Bookmark'    : '✅ Disimpan dalam Penanda';
  String get bookmarkRemoved => isEn ? '❌ Removed from Bookmark' : '❌ Dibuang dari Penanda';
  String get waqafPageTitle => isEn ? 'Waqaf Signs' : 'Tanda-Tanda Waqaf';
  String failNotFound(String f) => isEn ? 'File $f not found' : 'Fail $f tidak dijumpai';

  // ── WaqafPage ──
  String get waqafListTitle  => isEn ? 'List of Waqaf Signs 📖' : 'Senarai Tanda Waqaf 📖';
  String get waqafStop       => isEn ? 'Stop'     : 'Waqaf';
  String get waqafContinue   => isEn ? 'Continue' : 'Wasal';
  String get waqafDefinition => isEn
      ? 'Waqaf means to stop — pausing recitation at the end or mid-verse with the intention of resuming. Below are waqaf signs found in the Quran.'
      : 'Waqaf bermaksud berhenti iaitu memberhentikan bacaan pada akhir ayat atau pada pertengahan ayat dengan niat menyambung semula bacaan. Di bawah ini adalah antara tanda-tanda waqaf serta maksud yang terdapat di dalam Al-Quran.';

  // ── Translate description rule (untuk snackbar highlight) ──
  String translateRuleDesc(String ms) {
    if (!isEn) return ms;
    const map = <String, String>{
      'Nun mati/tanwin bertemu: ء هـ ع ح غ خ':          'Silent Nun/Tanwin meets: ء هـ ع ح غ خ',
      'Nun mati/tanwin bertemu: ي ن م و':                'Silent Nun/Tanwin meets: ي ن م و',
      'Nun mati/tanwin bertemu: ل ر':                    'Silent Nun/Tanwin meets: ل ر',
      'Nun mati/tanwin bertemu: ب':                      'Silent Nun/Tanwin meets: ب',
      'Nun mati/tanwin bertemu 15 huruf ikhfa':          'Silent Nun/Tanwin meets 15 ikhfa letters',
      'Mim mati bertemu: ب':                             'Silent Mim meets: ب',
      'Mim mati bertemu: م':                             'Silent Mim meets: م',
      'Mim mati bertemu selain م dan ب':                 'Silent Mim meets letters other than م and ب',
      'Dua huruf sama makhraj & sifat':                  'Two letters same makhraj & characteristics',
      'Dua huruf sama makhraj, beza sifat':              'Two letters same makhraj, different characteristics',
      'Dua huruf hampir sama makhraj & sifat':           'Two letters with similar makhraj & characteristics',
      'Mad 2 harakat':                                   'Mad 2 counts',
      'و/ي mati didahului fathah, diwaqafkan':           'Silent و/ي preceded by fathah, at waqaf',
      'Waqaf pada fathatain, dibaca 2 harakat':          'Waqaf on fathatain, read 2 counts',
      'Dua ya bertemu, dibaca 2 harakat':                'Two ya meet, read 2 counts',
      'Ha Dhamir diapit dua huruf berbaris, 2 harakat':  'Ha Dhamir flanked by two vowelled letters, 2 counts',
      'Ha Dhamir bertemu Hamzah, 4-5 harakat':           'Ha Dhamir meets Hamzah, 4-5 counts',
      'Mad 6 harakat, sukun asli tanpa sabdu':           'Mad 6 counts, original sukun without shadda',
      'Mad 6 harakat, bertemu sabdu':                    'Mad 6 counts, meets shadda',
      'Mad 6 harakat, huruf awal surah':                 'Mad 6 counts, opening letters of surah',
      'Mad 6 harakat, huruf awal surah bersabdu':        'Mad 6 counts, opening letters with shadda',
      'Mad 2-6 harakat kerana waqaf':                    'Mad 2-6 counts due to waqaf',
      'Mad 4-5 harakat, hamzah satu kalimah':            'Mad 4-5 counts, hamzah in same word',
      'Mad 2-5 harakat, hamzah beza kalimah':            'Mad 2-5 counts, hamzah in different word',
      'Lantunan kecil di tengah kalimah':                'Minor echo in the middle of a word',
      'Lantunan kuat di akhir kalimah (waqaf)':          'Strong echo at end of word (waqaf)',
      'Lantunan paling kuat, huruf bersabdu':            'Strongest echo, letter with shadda',
      'Ra dibaca tebal':                                 'Ra read heavily',
      'Ra dibaca nipis':                                 'Ra read lightly',
      'Lam Allah dibaca tebal (selepas fathah/dhammah)': 'Lam Allah read heavily (after fathah/dhammah)',
      'Lam Allah dibaca nipis (selepas kasrah)':         'Lam Allah read lightly (after kasrah)',
      'Lam dibaca jelas, ada sukun di atas Lam':         'Lam read clearly, sukun above Lam',
      'Lam dimasukkan ke huruf seterusnya':              'Lam merged into the next letter',
      'Dua sukun bertemu antara dua kalimah':            'Two sukun meet between two words',
      'Dibaca bila mula, digugur bila sambung':          'Read when starting, dropped when connected',
      'Keluar dari kerongkong':                          'Exits from the throat',
      'Keluar dari lidah':                               'Exits from the tongue',
      'Keluar dari dua bibir':                           'Exits from the two lips',
      'Keluar dari rongga hidung':                       'Exits from the nasal cavity',
      'Keluar dari rongga mulut':                        'Exits from the oral cavity',
    };
    return map[ms] ?? ms;
  }

  // ── Translate penerangan dalam NunMatiPage / DetailContentPage ──
  String translatePoint(String ms) {
    if (!isEn) return ms;
    const map = <String, String>{
      // ── Makhraj (full string) ──
      'Pangkal Kerongkong: ء هـ ; Tengah Kerongkong: ع ح ; Hujung Kerongkong: غ خ':
          'Base of Throat: ء هـ ; Middle of Throat: ع ح ; End of Throat: غ خ',

      // ── Makhraj Kerongkong (split individually) ──
'Pangkal Kerongkong: ء هـ':  'Base of Throat: ء هـ',
'Tengah Kerongkong: ع ح':    'Middle of Throat: ع ح',
'Hujung Kerongkong: غ خ':    'End of Throat: غ خ',

// ── Makhraj Lidah (split individually) ──
'Pangkal Lidah \n(Anak Tekak): ق':              'Back of Tongue\n(Uvula): ق',
'Pangkal Lidah (Lelangit Lembut): ك':           'Back of Tongue (Soft Palate): ك',
'Tengah Lidah: ج ش ي':                          'Middle of Tongue: ج ش ي',
'Tepi Lidah: ض':                                'Side of Tongue: ض',
'Hujung Lidah (Gusi): ل':                       'Tip of Tongue (Gum): ل',
'Hujung Lidah (Gusi atas): ن':                  'Tip of Tongue (Upper Gum): ن',
'Hujung Lidah (Gusi atas belakang): ر':         'Tip of Tongue (Back of Upper Gum): ر',
'Hujung Lidah (Pangkal gigi atas): ط د ت':     'Tip of Tongue (Upper Teeth Base): ط د ت',
'Hujung Lidah (Belakang gigi bawah): ص ز س':   'Tip of Tongue (Behind Lower Teeth): ص ز س',
'Hujung Lidah (Hujung gigi atas): ظ ذ ث':      'Tip of Tongue (Upper Teeth Tips): ظ ذ ث',

// ── Makhraj Dua Bibir (split individually) ──
'Bibir Bawah (Hujung gigi atas): ف':  'Lower Lip (Upper Teeth Tips): ف',
'Dua Bibir (Rapat): ب م':             'Both Lips (Closed): ب م',
'Dua Bibir (Bulat): و':               'Both Lips (Round): و',

// ── Makhraj Rongga Hidung ──
'Tempat keluar Ghunnah (dengung) sama ada dari huruf Nun Syaddah (نّ) atau Mim Syaddah (مّ).':
    'The exit point of Ghunnah (nasalisation) from either Nun with Shadda (نّ) or Mim with Shadda (مّ).',

// ── Makhraj Rongga Mulut ──
'Terjadi apabila huruf-huruf mad (ا) (و) (ي) keluar dari rongga kerongkong hingga rongga mulut':
    'Occurs when the mad letters (ا) (و) (ي) exit from the throat cavity to the oral cavity',

      // ── Nun Mati ──
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

      // ── Mim Mati ──
      'Mim mati bertemu huruf ب dibaca dengung 2 harakat.':
          'Silent Mim meets ب, read with 2 counts of nasalisation.',
      'Mim mati bertemu mim bertanda sabdu dibaca dengung 2 harakat.':
          'Silent Mim meets shadda Mim, read with 2 counts of nasalisation.',
      'Mim mati bertemu huruf selain م dan ب, dibaca jelas tanpa dengung.':
          'Silent Mim meets letters other than م and ب, read clearly without nasalisation.',

      // ── Idgham ──
      'Pertemuan dua huruf yang sama makhraj dan sifatnya.':
          'Two letters with the same makhraj and characteristics.',
      'Pertemuan dua huruf yang sama makhraj tetapi berlainan sifat.':
          'Two letters with the same makhraj but different characteristics.',
      'Pertemuan dua huruf yang makhraj dan sifatnya hampir sama.':
          'Two letters with similar makhraj and characteristics.',

      // ── Mad ──
      'Memanjangkan bacaan ayat sebanyak 2 harakat.':
          'Prolonging recitation by 2 counts.',
      'Berlaku apabila huruf Wau (و) atau Ya (ي) mati didahului huruf berbaris atas, dan selepasnya ada huruf yang diwakafkan. Dibaca 2, 4, atau 6 harakat.':
          'Occurs when silent Wau (و) or Ya (ي) is preceded by a fathah letter and followed by a waqaf letter. Read 2, 4, or 6 counts.',
      'Berlaku apabila berhenti (waqaf) pada huruf yang berbaris Fathatain (baris dua di atas), kecuali Ta Marbutah dan baris tanwin diganti dengan mad asli 2 harakat.':
          'Occurs when stopping (waqaf) on a double-fathah letter (except Ta Marbutah). Read 2 counts.',
      'Pertemuan diantara dua huruf Ya (ي). Ya pertama berbaris bawah dan bersabdu, manakala Ya kedua mati dan dibaca 2 harakat untuk menetapkan bunyi Ya (ي).':
          'Two Ya (ي) letters meet. The first has kasrah and shadda; the second is silent, read 2 counts.',
      'Berlaku pada Ha Dhamir (هـ) yang diapit dua huruf berbaris, dan selepasnya BUKAN Hamzah. Dibaca 2 harakat.':
          'Occurs on Ha Dhamir (هـ) flanked by two vowelled letters, not followed by Hamzah. Read 2 counts.',
      'Berlaku apabila Ha Dhamir (هـ) bertemu dengan huruf Hamzah (ء) dalam kalimah berasingan. Dibaca 4 atau 5 harakat.':
          'Occurs when Ha Dhamir (هـ) meets Hamzah (ء) in a separate word. Read 4 or 5 counts.',
      'Klik untuk melihat 4 pembahagian utama Mad Lazim.':
          'Tap to see 4 main divisions of Mad Lazim.',
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

      // ── Qalqalah ──
      'Lantunan kecil di tengah kalimah.':
          'Minor echo in the middle of a word.',
      'Lantunan kuat di akhir kalimah kerana waqaf.':
          'Strong echo at the end of a word due to waqaf.',
      'Lantunan paling kuat pada huruf qalqalah yang bersabdu.':
          'Strongest echo on a qalqalah letter with shadda.',

      // ── Ra ──
      'Ra dibaca tebal apabila berbaris atas, depan, atau sukun yang didahului baris atas/depan.':
          'Ra is read heavily when it has fathah, dhammah, or sukun preceded by fathah/dhammah.',
      'Ra dibaca nipis apabila berbaris bawah atau sukun yang didahului baris bawah asli.':
          'Ra is read lightly when it has kasrah or sukun preceded by original kasrah.',

      // ── Lam Jalalah ──
      'Tebal (Tafkhim) jika huruf sebelumnya baris atas/depan. Nipis (Tarqiq) jika sebelumnya baris bawah.':
          'Heavy (Tafkhim) if preceded by fathah/dhammah. Light (Tarqiq) if preceded by kasrah.',

      // ── Alif Lam ──
      'Alif Lam bertemu huruf Qamariah. Huruf Lam dibaca jelas (Izhar). Tanda sukun jelas di atas Lam.':
          'Alif Lam meets a Qamariah letter. Lam is read clearly (Izhar). Sukun mark visible on Lam.',
      'Alif Lam bertemu huruf Syamsiah. Bunyi Lam dimasukkan ke huruf seterusnya (Idgham). Tanda sabdu pada huruf selepas Lam.':
          'Alif Lam meets a Syamsiah letter. Lam merged into the next letter (Idgham). Shadda on the next letter.',

      // ── Iltiqa ──
      "Pertemuan dua sukun antara dua kalimah. Biasanya ditambah bunyi \"ni\" (nun kecil) untuk menyambung bacaan.":
          'Meeting of two sukun between two words. A small "ni" sound is added to connect the recitation.',

      // ── Hamzah Wasal ──
      "Hamzah tambahan yang dibaca jika memulakan bacaan (Ibtida') dan digugurkan jika dibaca secara sambung (Wasal).":
          "Additional hamzah read when starting (Ibtida') and dropped when connected (Wasal).",
    };
    return map[ms.trim()] ?? ms;
  }
}