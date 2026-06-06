class QuizData {
  static const Map<String, List<Map<String, dynamic>>> data = {

    // ─────────────────────────────────────────────────────────
    'Makhraj Huruf': [
      {
        'ruleDescription':
            'Makhraj ialah tempat keluarnya setiap huruf Hijaiyah. '
            'Terdapat 5 makhraj utama:\n\n'
            '① Al-Jauf — rongga mulut & tekak\n'
            '② Al-Halq — kerongkong (3 peringkat)\n'
            '③ Al-Lisan — lidah (10 makhraj)\n'
            '④ Asy-Syafatain — dua bibir\n'
            '⑤ Al-Khaisyum — pangkal hidung (ghunnah)',
        'arabicExample': 'مَخَارِجُ الْحُرُوفِ',
        'question': 'Makhraj Al-Halq melibatkan bahagian?',
        'arabic': 'الحَلْق',
        'answers': ['Kerongkong', 'Lidah', 'Bibir', 'Hidung'],
        'correctIndex': 0,
        'explanation':
            'Al-Halq (الحَلْق) = kerongkong. '
            'Ia merangkumi 3 peringkat: pangkal (أ هـ), tengah (ع غ), dan hujung kerongkong (ح خ).',
      },
      {
        'question': 'Huruf ء dan هـ keluar dari bahagian mana?',
        'arabic': 'أ   هـ',
        'answers': ['Pangkal Kerongkong', 'Tengah Kerongkong', 'Hujung Kerongkong', 'Lidah'],
        'correctIndex': 0,
        'explanation':
            'Huruf أ dan هـ keluar dari Aqsal Halq (pangkal kerongkong) — '
            'iaitu bahagian paling dalam kerongkong.',
      },
      {
        'question': 'Huruf ع dan غ keluar dari bahagian mana?',
        'arabic': 'ع   غ',
        'answers': ['Tengah Kerongkong', 'Pangkal Kerongkong', 'Bibir', 'Hidung'],
        'correctIndex': 0,
        'explanation':
            'Huruf ع dan غ keluar dari Wastal Halq (tengah kerongkong). '
            'Manakala ح dan خ pula keluar dari hujung kerongkong (Adnal Halq).',
      },
      {
        'question': 'Makhraj Asy-Syafatain merujuk kepada?',
        'arabic': 'الشَّفَتَيْن',
        'answers': ['Dua Bibir', 'Dua Gigi', 'Lidah & Bibir', 'Rongga Mulut'],
        'correctIndex': 0,
        'explanation':
            'Asy-Syafatain = dua bibir. '
            'Huruf ب dan م keluar dari kedua-dua bibir bertemu, manakala و dari bibir yang terbuka sedikit.',
      },
      {
        'question': 'Al-Khaisyum digunakan untuk bunyi apa?',
        'arabic': 'الخَيْشُوم',
        'answers': ['Ghunnah (Dengung)', 'Qalqalah', 'Mad', 'Izhar'],
        'correctIndex': 0,
        'explanation':
            'Al-Khaisyum (pangkal hidung) adalah makhraj bagi bunyi ghunnah — '
            'iaitu dengung pada huruf Nun dan Mim bertasydid.',
      },
      {
        'question': 'Berapakah bilangan makhraj utama?',
        'arabic': null,
        'answers': ['3', '5', '7', '10'],
        'correctIndex': 1,
        'explanation':
            'Terdapat 5 makhraj utama: Al-Jauf, Al-Halq, Al-Lisan, '
            'Asy-Syafatain, dan Al-Khaisyum.',
      },
    ],

    // ─────────────────────────────────────────────────────────
    'Nun Mati dan Tanwin': [
      {
        'ruleDescription':
            'Nun Mati (نْ) dan Tanwin (ً ٍ ٌ) mempunyai 4 hukum bacaan '
            'bergantung huruf yang datang selepasnya:\n\n'
            '① Izhar Halqi — dibaca jelas (6 huruf halqi)\n'
            '② Idgham — dimasukkan (6 huruf: ي ر م ل و ن)\n'
            '③ Iqlab — ditukar jadi Mim (huruf ب sahaja)\n'
            '④ Ikhfa Haqiqi — antara jelas & dengung (15 huruf)',
        'arabicExample': 'نْ   ً   ٍ   ٌ',
        'question': 'Nun Mati bertemu huruf ب, hukumnya?',
        'arabic': 'مِنْ بَعْدِ',
        'answers': ['Izhar', 'Iqlab', 'Ikhfa', 'Idgham'],
        'correctIndex': 1,
        'explanation':
            'Iqlab: Nun Mati bertukar menjadi Mim (مْ) apabila bertemu ب, '
            'dan dibaca dengan dengung (ghunnah) 2 harakat.',
      },
      {
        'question': 'Izhar Halqi bermaksud Nun Mati dibaca secara?',
        'arabic': 'مَنْ آمَنَ',
        'answers': ['Jelas tanpa dengung', 'Dengan dengung', 'Dimasukkan', 'Ditukar'],
        'correctIndex': 0,
        'explanation':
            'Izhar Halqi = jelas & terang. Berlaku apabila Nun Mati bertemu '
            'mana-mana dari 6 huruf halqi: أ هـ ع غ ح خ.',
      },
      {
        'question': 'Berapa jumlah huruf Ikhfa Haqiqi?',
        'arabic': null,
        'answers': ['6 huruf', '15 huruf', '4 huruf', '10 huruf'],
        'correctIndex': 1,
        'explanation':
            'Terdapat 15 huruf Ikhfa Haqiqi. Cara bacaannya antara jelas dan '
            'dengung — Nun Mati tidak hilang sepenuhnya.',
      },
      {
        'question': 'Idgham Maal Ghunnah berlaku pada huruf mana?',
        'arabic': 'مَنْ يَعْمَلْ',
        'answers': ['ي ن م و', 'ر ل', 'أ هـ ع غ', 'ب ت ث'],
        'correctIndex': 0,
        'explanation':
            'Idgham Maal Ghunnah: Nun Mati dimasukkan ke dalam huruf '
            'ي ن م و berserta dengung 2 harakat.',
      },
      {
        'question': 'Huruf ر dan ل mewakili hukum?',
        'arabic': 'مِنْ لَدُنْكَ',
        'answers': ['Idgham Bila Ghunnah', 'Ikhfa Haqiqi', 'Iqlab', 'Izhar Halqi'],
        'correctIndex': 0,
        'explanation':
            'Idgham Bila Ghunnah: Nun Mati dimasukkan ke dalam ر atau ل '
            'tanpa sebarang dengung.',
      },
      {
        'question': 'Manakah contoh Izhar Halqi yang betul?',
        'arabic': null,
        'answers': ['مَنْ أَرَادَ', 'مِنْ بَعْدِ', 'أَنْبِئْهُم', 'مَنْ يَشَاء'],
        'correctIndex': 0,
        'explanation':
            '"Man Araada" — Nun Mati bertemu أ (huruf halqi), '
            'maka dibaca terang & jelas tanpa dengung.',
      },
    ],

    // ─────────────────────────────────────────────────────────
    'Mim Mati': [
      {
        'ruleDescription':
            'Mim Mati (مْ) mempunyai 3 hukum bacaan:\n\n'
            '① Ikhfa Syafawi — Mim Mati bertemu ب\n'
            '   → Tersembunyi dengan dengung dari bibir\n\n'
            '② Idgham Syafawi — Mim Mati bertemu م\n'
            '   → Dimasukkan dengan dengung\n\n'
            '③ Izhar Syafawi — Mim Mati bertemu huruf lain\n'
            '   → Dibaca jelas dari bibir',
        'arabicExample': 'مْ + ب  •  مْ + م  •  مْ + غيرهما',
        'question': 'Mim Mati mempunyai berapa hukum?',
        'arabic': null,
        'answers': ['2 hukum', '3 hukum', '4 hukum', '5 hukum'],
        'correctIndex': 1,
        'explanation':
            'Terdapat 3 hukum Mim Mati: Ikhfa Syafawi, Idgham Syafawi, '
            'dan Izhar Syafawi.',
      },
      {
        'question': 'Ikhfa Syafawi berlaku apabila Mim Mati bertemu?',
        'arabic': 'هُمْ بِمَا',
        'answers': ['Ba (ب)', 'Mim (م)', 'Wau (و)', 'Fa (ف)'],
        'correctIndex': 0,
        'explanation':
            'Ikhfa Syafawi hanya berlaku apabila Mim Mati bertemu ب — '
            'dibaca tersembunyi dengan dengung ringan dari bibir.',
      },
      {
        'question': 'Cara bacaan Ikhfa Syafawi ialah?',
        'arabic': 'تَرْمِيهِمْ بِحِجَارَة',
        'answers': ['Jelas dari bibir', 'Tersembunyi & dengung', 'Dimasukkan sepenuhnya', 'Ditukar jadi Nun'],
        'correctIndex': 1,
        'explanation':
            'Ikhfa Syafawi: bibir tidak rapat sepenuhnya, Mim dibaca '
            'antara Izhar dan Idgham sambil dengung 2 harakat.',
      },
      {
        'question': 'Idgham Syafawi berlaku apabila Mim Mati bertemu?',
        'arabic': 'لَهُمْ مَا',
        'answers': ['Mim (م)', 'Ba (ب)', 'Fa (ف)', 'Nun (ن)'],
        'correctIndex': 0,
        'explanation':
            'Apabila Mim Mati bertemu Mim, ia disebut Idgham Syafawi atau '
            'Idgham Mutamasilain — dimasukkan dengan dengung 2 harakat.',
      },
      {
        'question': 'Mim Mati bertemu huruf Sin (س), hukumnya?',
        'arabic': 'وَأَنْتُمْ سَامِدُونَ',
        'answers': ['Ikhfa Syafawi', 'Idgham Syafawi', 'Izhar Syafawi', 'Iqlab'],
        'correctIndex': 2,
        'explanation':
            'Mim Mati bertemu huruf selain ب dan م = Izhar Syafawi: '
            'Mim dibaca jelas dari bibir tanpa dengung.',
      },
      {
        'question': 'Izhar Syafawi melibatkan berapa huruf?',
        'arabic': null,
        'answers': ['14 huruf', '26 huruf', '15 huruf', '28 huruf'],
        'correctIndex': 1,
        'explanation':
            'Izhar Syafawi melibatkan semua 26 huruf Hijaiyah selain ب dan م '
            'apabila bertemu Mim Mati.',
      },
    ],

    // ─────────────────────────────────────────────────────────
    'Hukum Idgham': [
      {
        'ruleDescription':
            'Idgham (إدغام) bermaksud memasukkan satu huruf ke dalam '
            'huruf berikutnya sehingga menjadi satu huruf bertasydid.\n\n'
            'Terdapat 3 jenis Idgham:\n\n'
            '① Mutamasilain — sama makhraj & sama sifat (مثلان)\n'
            '② Mutajanisain — sama makhraj, beza sifat (جنسان)\n'
            '③ Mutaqaribain — hampir sama makhraj & sifat (قاربان)',
        'arabicExample': 'إِدْغَام = إِدْخَالٌ',
        'question': 'Idgham bermaksud?',
        'arabic': 'إِدْغَام',
        'answers': ['Membaca jelas', 'Memasukkan huruf', 'Menukar huruf', 'Memanjangkan'],
        'correctIndex': 1,
        'explanation':
            'Idgham (إدغام) = memasukkan — satu huruf dimasukkan ke dalam '
            'huruf berikutnya sehingga menjadi satu huruf bertasydid.',
      },
      {
        'question': 'Dua huruf yang sama makhraj & sifat disebut?',
        'arabic': null,
        'answers': ['Mutamasilain', 'Mutajanisain', 'Mutaqaribain', 'Mutabaidain'],
        'correctIndex': 0,
        'explanation':
            'Mutamasilain (مُتَمَاثِلَيْن) = dua huruf yang sama jenis. '
            'Contoh: ب bertemu ب, atau د bertemu د.',
      },
      {
        'question': 'Contoh Idgham Mutamasilain ialah?',
        'arabic': 'اضْرِبْ بِعَصَاكَ',
        'answers': ['ب bertemu ب', 'ت bertemu د', 'ق bertemu ك', 'ذ bertemu ظ'],
        'correctIndex': 0,
        'explanation':
            '"Idhrib Biashaak" — ب bertemu ب, dimasukkan menjadi '
            'satu bunyi ب bertasydid. Inilah Mutamasilain.',
      },
      {
        'question': 'ت bertemu ط adalah contoh Idgham?',
        'arabic': 'قَالَتْ طَائِفَة',
        'answers': ['Mutamasilain', 'Mutajanisain', 'Mutaqaribain', 'Mutabaidain'],
        'correctIndex': 1,
        'explanation':
            'ت dan ط berkongsi makhraj yang sama (hujung lidah) tetapi '
            'berbeza sifat — ini disebut Mutajanisain.',
      },
      {
        'question': 'ق bertemu ك adalah contoh Idgham?',
        'arabic': 'أَلَمْ نَخْلُقكُّم',
        'answers': ['Mutaqaribain', 'Mutamasilain', 'Mutajanisain', 'Mutabaidain'],
        'correctIndex': 0,
        'explanation':
            'ق dan ك berdekatan dari segi makhraj dan sifat — '
            'ini disebut Idgham Mutaqaribain.',
      },
      {
        'question': 'Mutajanisain bermaksud dua huruf yang?',
        'arabic': null,
        'answers': ['Sama makhraj, beza sifat', 'Sama sifat, beza makhraj', 'Sama nama', 'Sama huruf'],
        'correctIndex': 0,
        'explanation':
            'Mutajanisain (مُتَجَانِسَيْن) = sama makhraj, beza sifat. '
            'Contoh lain: ذ bertemu ظ, atau ث bertemu ذ.',
      },
    ],

    // ─────────────────────────────────────────────────────────
    'Hukum Mad': [
      {
        'ruleDescription':
            'Mad bermaksud memanjangkan bacaan pada huruf mad.\n\n'
            'Huruf Mad ada 3: ا (Alif) • و (Wau) • ي (Ya)\n\n'
            'Jenis utama:\n'
            '① Mad Asli (Tabi\'i) — 2 harakat\n'
            '② Mad Wajib Muttasil — 4-5 harakat\n'
            '③ Mad Jaiz Munfasil — 4-5 harakat\n'
            '④ Mad Arid Lissukun — 2, 4 atau 6 harakat\n'
            '⑤ Mad Lazim — wajib 6 harakat',
        'arabicExample': 'قَالَ  •  يَقُولُ  •  قِيلَ',
        'question': 'Berapa jumlah huruf Mad?',
        'arabic': 'ا   و   ي',
        'answers': ['2 huruf', '3 huruf', '4 huruf', '5 huruf'],
        'correctIndex': 1,
        'explanation':
            'Terdapat 3 huruf Mad: Alif (ا) selepas fathah, '
            'Wau (و) selepas dhammah, Ya (ي) selepas kasrah.',
      },
      {
        'question': 'Kadar panjang Mad Asli (Tabi\'i) ialah?',
        'arabic': 'قَالَ',
        'answers': ['1 harakat', '2 harakat', '4 harakat', '6 harakat'],
        'correctIndex': 1,
        'explanation':
            'Mad Asli (Mad Tabi\'i) dibaca 2 harakat — '
            'kadar paling asas bagi semua jenis Mad.',
      },
      {
        'question': 'Mad Wajib Muttasil berlaku apabila?',
        'arabic': 'جَاءَ   سَاءَ',
        'answers': [
          'Mad Asli bertemu Hamzah dalam satu kalimah',
          'Mad Asli bertemu Hamzah dalam dua kalimah',
          'Mad Asli bertemu Sukun',
          'Mad Asli bertemu Tasydid'
        ],
        'correctIndex': 0,
        'explanation':
            'Mad Wajib Muttasil: huruf Mad bertemu Hamzah dalam '
            'satu kalimah yang sama, dibaca 4 atau 5 harakat.',
      },
      {
        'question': 'Mad Jaiz Munfasil dibaca berapa harakat?',
        'arabic': 'يَا أَيُّهَا',
        'answers': ['2 harakat', '4 atau 5 harakat', '6 harakat sahaja', '1 harakat'],
        'correctIndex': 1,
        'explanation':
            'Mad Jaiz Munfasil berlaku apabila Mad Asli bertemu Hamzah '
            'dalam dua kalimah berasingan — dibaca 4 atau 5 harakat.',
      },
      {
        'question': 'Mad yang berlaku ketika wakaf di hujung ayat disebut?',
        'arabic': 'نَسْتَعِيْن ۝',
        'answers': ['Mad Arid Lissukun', 'Mad Lazim', 'Mad Iwad', 'Mad Badal'],
        'correctIndex': 0,
        'explanation':
            'Mad Arid Lissukun berlaku apabila berhenti (waqaf) pada huruf '
            'selepas huruf Mad — boleh dibaca 2, 4, atau 6 harakat.',
      },
      {
        'question': 'Mad Lazim Kilmi Muthaqqal wajib dibaca?',
        'arabic': 'الضَّالِّيْن',
        'answers': ['2 harakat', '4 harakat', '6 harakat', '5 harakat'],
        'correctIndex': 2,
        'explanation':
            'Mad Lazim Kilmi Muthaqqal: huruf Mad diikuti tasydid dalam satu '
            'kalimah — WAJIB dibaca 6 harakat tanpa pilihan.',
      },
    ],

    // ─────────────────────────────────────────────────────────
    'Hukum Ra': [
      {
        'ruleDescription':
            'Huruf Ra (ر) dibaca dalam dua cara:\n\n'
            '① Tafkhim (تَفْخِيم) — tebal/berat\n'
            '   • Ra berbaris fathah atau dhammah\n'
            '   • Ra mati & sebelumnya fathah/dhammah\n'
            '   • Ra mati & selepasnya huruf Isti\'la\n\n'
            '② Tarqiq (تَرْقِيق) — nipis/ringan\n'
            '   • Ra berbaris kasrah\n'
            '   • Ra mati & sebelumnya kasrah (tanpa Isti\'la)\n'
            '   • Ra mati & sebelumnya Ya mati',
        'arabicExample': 'رَبَّنَا  •  رِزْقًا',
        'question': 'Ra berbaris fathah dibaca secara?',
        'arabic': 'رَحْمَة',
        'answers': ['Tebal (Tafkhim)', 'Nipis (Tarqiq)', 'Sederhana', 'Dengung'],
        'correctIndex': 0,
        'explanation':
            'Ra berbaris fathah sentiasa dibaca tebal (Tafkhim) — '
            'bunyi Ra digemukkan ke belakang rongga mulut.',
      },
      {
        'question': 'Ra berbaris kasrah dibaca secara?',
        'arabic': 'رِزْق',
        'answers': ['Tebal (Tafkhim)', 'Nipis (Tarqiq)', 'Dengung', 'Jelas'],
        'correctIndex': 1,
        'explanation':
            'Ra berbaris kasrah dibaca nipis (Tarqiq) — '
            'bunyi Ra dimainkan halus ke hadapan mulut.',
      },
      {
        'question': 'Ra yang dibaca tebal disebut?',
        'arabic': 'رَبَّنَا',
        'answers': ['Tarqiq', 'Tafkhim', 'Ghunnah', 'Izhar'],
        'correctIndex': 1,
        'explanation':
            'Tafkhim (تَفْخِيم) = tebal. Ra berbaris atas atau dhammah '
            'dibaca dengan menggemukkan bunyi.',
      },
      {
        'question': 'Ra mati, sebelumnya kasrah, selepasnya huruf Isti\'la?',
        'arabic': 'مِرْصَاد',
        'answers': ['Nipis', 'Tebal', 'Boleh pilih', 'Dengung'],
        'correctIndex': 1,
        'explanation':
            'Walaupun sebelum Ra ada kasrah, jika selepasnya huruf Isti\'la '
            '(خ ص ض غ ط ق ظ), Ra tetap dibaca tebal (Tafkhim).',
      },
      {
        'question': 'Ra mati, sebelumnya Ya mati — dibaca?',
        'arabic': 'خَيْر ۝',
        'answers': ['Tebal', 'Nipis', 'Jelas', 'Dengung'],
        'correctIndex': 1,
        'explanation':
            'Ra mati yang sebelumnya Ya mati (ي ساكن) dibaca nipis (Tarqiq) '
            'kerana pengaruh sifat kasrah yang tersembunyi pada Ya.',
      },
      {
        'question': 'Manakah contoh Ra Tarqiq?',
        'arabic': null,
        'answers': ['رَبَّنَا', 'رِزْقًا', 'رُكُوع', 'رَحْمَة'],
        'correctIndex': 1,
        'explanation':
            '"Rizqan" (رِزْقًا) — Ra berbaris kasrah, '
            'maka dibaca nipis (Tarqiq).',
      },
    ],

    // ─────────────────────────────────────────────────────────
    'Lam Lafaz Jalalah': [
      {
        'ruleDescription':
            'Lam pada Lafaz Jalalah (اللّٰه) dibaca dalam dua cara '
            'bergantung kepada baris huruf sebelumnya:\n\n'
            '① Tafkhim (Tebal)\n'
            '   → Huruf sebelumnya berbaris fathah atau dhammah\n'
            '   → Contoh: قَالَ اللّٰهُ  •  رَسُولُ اللّٰهِ\n\n'
            '② Tarqiq (Nipis)\n'
            '   → Huruf sebelumnya berbaris kasrah\n'
            '   → Contoh: بِسْمِ اللّٰهِ  •  لِلّٰهِ مَا فِي',
        'arabicExample': 'اللّٰهُ  •  بِسْمِ اللّٰهِ',
        'question': 'Lafaz Jalalah merujuk kepada?',
        'arabic': 'اللّٰه',
        'answers': ['Ar-Rahman', 'Allah', 'Al-Malik', 'Al-Quddus'],
        'correctIndex': 1,
        'explanation':
            'Lafaz Jalalah merujuk kepada nama Allah (اللّٰه) — '
            'nama mulia Tuhan Yang Maha Esa.',
      },
      {
        'question': 'Lafaz Allah selepas baris fathah dibaca?',
        'arabic': 'قَالَ اللّٰهُ',
        'answers': ['Tebal (Tafkhim)', 'Nipis (Tarqiq)', 'Dengung', 'Jelas biasa'],
        'correctIndex': 0,
        'explanation':
            'Huruf sebelum Allah berbaris fathah → Lam dibaca tebal (Tafkhim). '
            'Sama juga jika berbaris dhammah.',
      },
      {
        'question': 'Lafaz Allah selepas baris kasrah dibaca?',
        'arabic': 'بِسْمِ اللّٰهِ',
        'answers': ['Tebal (Tafkhim)', 'Nipis (Tarqiq)', 'Sederhana', 'Dengung'],
        'correctIndex': 1,
        'explanation':
            'Huruf sebelum Allah berbaris kasrah → Lam dibaca nipis (Tarqiq). '
            'Contoh: Bismillah, Lillahi.',
      },
      {
        'question': '"Rasulullah" — Lam Jalalah dibaca?',
        'arabic': 'رَسُولُ اللّٰهِ',
        'answers': ['Nipis', 'Tebal', 'Sama sahaja', 'Dengung'],
        'correctIndex': 1,
        'explanation':
            '"Rasulullah" — huruf ل sebelum Allah berbaris dhammah, '
            'maka Lam Jalalah dibaca tebal (Tafkhim).',
      },
      {
        'question': '"Bismillah" — Lam Jalalah dibaca?',
        'arabic': 'بِسْمِ اللّٰهِ',
        'answers': ['Tebal', 'Nipis', 'Pilihan', 'Dengung'],
        'correctIndex': 1,
        'explanation':
            '"Bismillah" — huruf م sebelum Allah berbaris kasrah, '
            'maka Lam Jalalah dibaca nipis (Tarqiq).',
      },
      {
        'question': 'Berapa cara bacaan Lam pada Lafaz Allah?',
        'arabic': null,
        'answers': ['1 cara', '2 cara', '3 cara', '4 cara'],
        'correctIndex': 1,
        'explanation':
            'Terdapat 2 cara bacaan Lam Jalalah: Tafkhim (tebal) dan '
            'Tarqiq (nipis) — bergantung baris huruf sebelumnya.',
      },
    ],

    // ─────────────────────────────────────────────────────────
    'Qalqalah': [
      {
        'ruleDescription':
            'Qalqalah (قَلْقَلَة) ialah getaran atau lantunan suara '
            'pada 5 huruf apabila mati atau diwaqafkan.\n\n'
            'Huruf Qalqalah: ق  ط  ب  ج  د\n'
            '(Hafal dengan: قُطْبُ جَدٍّ)\n\n'
            'Terdapat 3 peringkat:\n'
            '① Sugra (صُغْرَى) — huruf mati di tengah kalimah\n'
            '② Kubra (كُبْرَى) — huruf mati di hujung ayat (wakaf)\n'
            '③ Akbar (أَكْبَر) — huruf berbaris & diwaqafkan',
        'arabicExample': 'قُطْبُ جَدٍّ',
        'question': 'Berapakah huruf Qalqalah?',
        'arabic': 'ق  ط  ب  ج  د',
        'answers': ['4 huruf', '5 huruf', '6 huruf', '7 huruf'],
        'correctIndex': 1,
        'explanation':
            'Terdapat 5 huruf Qalqalah yang dihafal melalui frasa '
            '"Qutbu Jaddin" (قُطْبُ جَدٍّ): ق ط ب ج د.',
      },
      {
        'question': 'Frasa hafalan huruf Qalqalah ialah?',
        'arabic': 'قُطْبُ جَدٍّ',
        'answers': ['Baju Di Tok', 'Qutbu Jaddin', 'Yarmalun', 'Qaf Tha Ba'],
        'correctIndex': 1,
        'explanation':
            'Frasa "Qutbu Jaddin" (قُطْبُ جَدٍّ) mengandungi '
            'semua 5 huruf Qalqalah: ق ط ب ج د.',
      },
      {
        'question': 'Qalqalah Sugra berlaku apabila huruf mati di?',
        'arabic': 'يَجْعَلُون',
        'answers': ['Tengah kalimah', 'Hujung ayat', 'Awal ayat', 'Antara dua kalimah'],
        'correctIndex': 0,
        'explanation':
            'Qalqalah Sugra (kecil) — huruf Qalqalah mati di tengah kalimah. '
            'Lantunannya paling lemah antara tiga peringkat.',
      },
      {
        'question': 'Qalqalah Kubra berlaku apabila?',
        'arabic': 'الْفَلَق ۝',
        'answers': [
          'Huruf mati di tengah kalimah',
          'Huruf mati di hujung ayat ketika waqaf',
          'Huruf berbaris diwaqafkan',
          'Huruf bertemu huruf lain'
        ],
        'correctIndex': 1,
        'explanation':
            'Qalqalah Kubra (besar) — huruf Qalqalah mati di hujung ayat '
            'ketika waqaf. Contoh: الْفَلَق apabila diwaqafkan.',
      },
      {
        'question': 'Qalqalah yang paling kuat lantunannya?',
        'arabic': null,
        'answers': ['Sugra', 'Kubra', 'Akbar', 'Sama sahaja'],
        'correctIndex': 2,
        'explanation':
            'Qalqalah Akbar ialah yang paling kuat — berlaku apabila '
            'huruf Qalqalah berbaris penuh dan kemudian diwaqafkan.',
      },
      {
        'question': 'Qalqalah bermaksud?',
        'arabic': 'قَلْقَلَة',
        'answers': ['Dengung', 'Getaran/Lantunan suara', 'Sembunyi', 'Memanjangkan'],
        'correctIndex': 1,
        'explanation':
            'Qalqalah (قَلْقَلَة) = getaran atau lantunan suara. '
            'Huruf-huruf ini tidak boleh disebut statik apabila mati.',
      },
    ],

    // ─────────────────────────────────────────────────────────
    'Alif Lam Ma\'rifah': [
      {
        'ruleDescription':
            'Alif Lam (ال) terbahagi kepada dua jenis:\n\n'
            '① Qamariyah (قَمَرِيَّة) — Lam dibaca JELAS\n'
            '   • Tanda: sukun (ْ) di atas Lam\n'
            '   • 14 huruf: ا ب غ ح ج ك و خ ف ع ق ي م ه\n\n'
            '② Syamsiyah (شَمْسِيَّة) — Lam DIMASUKKAN\n'
            '   • Tanda: tasydid (ّ) pada huruf berikutnya\n'
            '   • 14 huruf: ت ث د ذ ر ز س ش ص ض ط ظ ل ن',
        'arabicExample': 'الْقَمَر  •  الشَّمْس',
        'question': 'Alif Lam Qamariyah dibaca secara?',
        'arabic': 'الْقَمَر',
        'answers': ['Jelas (Izhar)', 'Dimasukkan (Idgham)', 'Dengung', 'Tersembunyi'],
        'correctIndex': 0,
        'explanation':
            'Alif Lam Qamariyah dibaca jelas (Izhar) — '
            'Lam dibaca nyata dengan tanda sukun di atasnya.',
      },
      {
        'question': 'Tanda Alif Lam Qamariyah ialah?',
        'arabic': 'الْبَيْت',
        'answers': ['Tasydid (ّ)', 'Sukun (ْ)', 'Tanwin', 'Fathah'],
        'correctIndex': 1,
        'explanation':
            'Tanda Qamariyah ialah sukun (ْ) di atas huruf Lam — '
            'menunjukkan Lam dibaca jelas.',
      },
      {
        'question': 'Tanda Alif Lam Syamsiyah ialah?',
        'arabic': 'الشَّمْس',
        'answers': ['Sukun (ْ)', 'Tasydid (ّ)', 'Fathah', 'Tanwin'],
        'correctIndex': 1,
        'explanation':
            'Tanda Syamsiyah ialah tasydid (ّ) pada huruf selepas Lam — '
            'menunjukkan Lam telah dimasukkan ke dalam huruf tersebut.',
      },
      {
        'question': '"Al-Qamar" adalah contoh?',
        'arabic': 'الْقَمَر',
        'answers': ['Alif Lam Qamariyah', 'Alif Lam Syamsiyah', 'Tiada hukum', 'Mad Lazim'],
        'correctIndex': 0,
        'explanation':
            '"Al-Qamar" (الْقَمَر) — huruf ق adalah huruf Qamariyah, '
            'maka Lam dibaca jelas dengan sukun.',
      },
      {
        'question': '"Ar-Rahman" adalah contoh?',
        'arabic': 'الرَّحْمٰن',
        'answers': ['Alif Lam Qamariyah', 'Alif Lam Syamsiyah', 'Mad Lazim', 'Qalqalah'],
        'correctIndex': 1,
        'explanation':
            '"Ar-Rahman" — huruf ر adalah huruf Syamsiyah, '
            'maka Lam dimasukkan ke dalam Ra (bertasydid).',
      },
      {
        'question': 'Berapa jumlah huruf Syamsiyah?',
        'arabic': null,
        'answers': ['10 huruf', '14 huruf', '28 huruf', '6 huruf'],
        'correctIndex': 1,
        'explanation':
            'Terdapat 14 huruf Syamsiyah — sama banyak dengan huruf Qamariyah. '
            'Keduanya melengkapi 28 huruf Hijaiyah.',
      },
    ],

    // ─────────────────────────────────────────────────────────
    'Iltiqa Sakinah': [
      {
        'ruleDescription':
            'Iltiqa Sakinah (الْتِقَاء السَّاكِنَيْن) bermaksud '
            '"pertemuan dua huruf mati berturutan".\n\n'
            'Cara menyelesaikannya:\n\n'
            '① Jika huruf pertama ialah huruf Mad (ا و ي)\n'
            '   → Huruf Mad DIBUANG\n'
            '   → Contoh: وَلَا الضَّالِّيْن\n\n'
            '② Jika huruf pertama bukan huruf Mad\n'
            '   → Tambah baris KASRAH pada huruf pertama\n'
            '   → Contoh: قُلِ اللّٰهُمَّ',
        'arabicExample': 'قُلِ اللّٰهُمَّ',
        'question': 'Iltiqa Sakinah bermaksud?',
        'arabic': 'الْتِقَاء السَّاكِنَيْن',
        'answers': ['Pertemuan dua huruf mati', 'Satu huruf mati', 'Dua baris', 'Huruf dengung'],
        'correctIndex': 0,
        'explanation':
            'Iltiqa Sakinah = pertemuan dua huruf yang mati berturutan, '
            'menyebabkan kesukaran dalam sebutan.',
      },
      {
        'question': 'Jika huruf pertama bukan Mad, diselesaikan dengan?',
        'arabic': 'قُلِ اللّٰهُمَّ',
        'answers': ['Tambah kasrah', 'Tambah fathah', 'Buang huruf', 'Tambah dhammah'],
        'correctIndex': 0,
        'explanation':
            'Kasrah (baris bawah) ditambah pada huruf pertama yang mati '
            'supaya dapat disebut dengan lancar.',
      },
      {
        'question': 'Jika huruf pertama ialah huruf Mad, diselesaikan dengan?',
        'arabic': 'وَلَا الضَّالِّيْن',
        'answers': ['Tambah kasrah', 'Buang huruf Mad', 'Tambah tasydid', 'Tambah fathah'],
        'correctIndex': 1,
        'explanation':
            'Apabila huruf pertama ialah huruf Mad (ا و ي), ia dibuang '
            'untuk menyelesaikan Iltiqa Sakinah.',
      },
      {
        'question': 'Kenapa kasrah ditambah untuk menyelesaikan Iltiqa Sakinah?',
        'arabic': null,
        'answers': ['Hukum wajib sahaja', 'Memudahkan sebutan', 'Mengikut rasa', 'Hukum nahu'],
        'correctIndex': 1,
        'explanation':
            'Kasrah ditambah semata-mata untuk memudahkan sebutan — '
            'dua huruf mati berturutan mustahil disebut tanpa vokal.',
      },
      {
        'question': '"Qulil Allahumma" — apa yang berlaku?',
        'arabic': 'قُلِ اللّٰهُمَّ',
        'answers': [
          'Lam mati bertemu Lam mati, kasrah ditambah',
          'Lam dibuang',
          'Tiada Iltiqa Sakinah',
          'Mim dibuang'
        ],
        'correctIndex': 0,
        'explanation':
            'Lam mati (ل) pada "Qul" bertemu Lam mati pada "Allah" — '
            'kasrah ditambah pada Lam pertama: "Qul-i-llahumma".',
      },
      {
        'question': 'Iltiqa Sakinah berlaku di antara?',
        'arabic': null,
        'answers': ['Dua kalimah berbeza', 'Satu kalimah', 'Awal ayat', 'Akhir surah'],
        'correctIndex': 0,
        'explanation':
            'Iltiqa Sakinah berlaku apabila hujung satu kalimah mati bertemu '
            'awal kalimah berikutnya yang juga bermula dengan sukun.',
      },
    ],

    // ─────────────────────────────────────────────────────────
    'Hamzah Wasal': [
      {
        'ruleDescription':
            'Hamzah Wasal (ٱ) ialah Hamzah yang:\n'
            '• DIBACA apabila memulakan bacaan\n'
            '• GUGUR (tidak dibaca) apabila disambung\n\n'
            'Simbol: seperti kepala huruf Sad kecil (ص)\n\n'
            'Cara menentukan baris Hamzah Wasal:\n'
            '① Alif Lam (ال) → sentiasa baris FATHAH\n'
            '② Kata nama (Isim) → sentiasa baris KASRAH\n'
            '③ Kata kerja (Fi\'il) → tengok baris huruf ke-3:\n'
            '   • Kasrah/Fathah → baca KASRAH\n'
            '   • Dhammah → baca DHAMMAH',
        'arabicExample': 'ٱقْرَأْ  •  بِسْمِ ٱللّٰهِ',
        'question': 'Hamzah Wasal dibaca apabila?',
        'arabic': 'ٱقْرَأْ',
        'answers': ['Memulakan bacaan', 'Disambung dalam bacaan', 'Wakaf', 'Pertengahan ayat'],
        'correctIndex': 0,
        'explanation':
            'Hamzah Wasal hanya dibaca apabila kita memulakan bacaan '
            'dari kalimah tersebut.',
      },
      {
        'question': 'Apabila disambung dalam bacaan, Hamzah Wasal?',
        'arabic': 'بِسْمِ ٱللّٰهِ',
        'answers': ['Dibaca jelas', 'Gugur (tidak dibaca)', 'Dibaca panjang', 'Dibaca dengung'],
        'correctIndex': 1,
        'explanation':
            'Apabila disambung dalam bacaan, Hamzah Wasal gugur — '
            'tidak disebut langsung.',
      },
      {
        'question': 'Simbol Hamzah Wasal menyerupai?',
        'arabic': 'ٱ',
        'answers': ['Kepala huruf Sad (ص)', 'Hamzah biasa (ء)', 'Alif biasa', 'Kepala huruf Ain (ع)'],
        'correctIndex': 0,
        'explanation':
            'Simbol Hamzah Wasal menyerupai kepala huruf Sad (ص) kecil '
            'yang diletakkan di atas Alif.',
      },
      {
        'question': 'Hamzah Wasal pada Alif Lam (ال) dibaca baris?',
        'arabic': 'ٱلْحَمْدُ',
        'answers': ['Kasrah', 'Fathah', 'Dhammah', 'Sukun'],
        'correctIndex': 1,
        'explanation':
            'Hamzah Wasal pada Alif Lam Ma\'rifah sentiasa dibaca '
            'dengan baris fathah (atas).',
      },
      {
        'question': 'Untuk Fi\'il, baris Hamzah Wasal bergantung pada huruf ke?',
        'arabic': null,
        'answers': ['Huruf ke-2', 'Huruf ke-3', 'Huruf ke-4', 'Huruf ke-1'],
        'correctIndex': 1,
        'explanation':
            'Untuk Fi\'il (kata kerja), tengok baris huruf ketiga — '
            'kasrah/fathah → baca kasrah; dhammah → baca dhammah.',
      },
      {
        'question': 'Huruf ke-3 berbaris dhammah, Hamzah Wasal dibaca?',
        'arabic': 'ٱنظُر',
        'answers': ['Kasrah', 'Fathah', 'Dhammah', 'Sukun'],
        'correctIndex': 2,
        'explanation':
            'Apabila huruf ketiga berbaris dhammah (ٱنظُر), '
            'Hamzah Wasal juga dibaca dengan dhammah.',
      },
    ],

    // ─────────────────────────────────────────────────────────
    'Tanda Tanda Waqaf': [
      {
        'ruleDescription':
            'Tanda Waqaf menunjukkan cara berhenti dalam bacaan Al-Quran.\n\n'
            '① م (Lazim) — WAJIB berhenti\n'
            '② لا — DILARANG berhenti\n'
            '③ ج (Jaiz) — Boleh berhenti atau sambung\n'
            '④ ۗ — Berhenti LEBIH UTAMA\n'
            '⑤ ۖ — Sambung LEBIH UTAMA\n'
            '⑥ ∴ ∴ (Muanaqah) — Berhenti pada salah satu sahaja\n'
            '⑦ ۙ (Saktah) — Berhenti seketika tanpa nafas',
        'arabicExample': 'م   لا   ج   ۗ   ۖ',
        'question': 'Tanda (م) bermaksud?',
        'arabic': 'م',
        'answers': ['Wajib berhenti', 'Dilarang berhenti', 'Boleh berhenti', 'Sambung lebih utama'],
        'correctIndex': 0,
        'explanation':
            'Tanda م (Lazim) = WAJIB berhenti. '
            'Jika tidak berhenti, makna ayat boleh berubah atau rosak.',
      },
      {
        'question': 'Tanda (لا) bermaksud?',
        'arabic': 'لا',
        'answers': ['Wajib berhenti', 'Dilarang berhenti', 'Pilihan', 'Berhenti lebih utama'],
        'correctIndex': 1,
        'explanation':
            'Tanda لا = DILARANG berhenti. Jika terpaksa berhenti, '
            'kembali ke permulaan ayat atau kalimah sebelumnya.',
      },
      {
        'question': 'Tanda (ج) bermaksud?',
        'arabic': 'ج',
        'answers': ['Wajib berhenti', 'Harus berhenti atau sambung', 'Dilarang berhenti', 'Saktah'],
        'correctIndex': 1,
        'explanation':
            'Tanda ج (Jaiz) = harus — boleh berhenti atau menyambung, '
            'kedua-dua pilihan dibenarkan.',
      },
      {
        'question': 'Tanda (ۗ) bermaksud?',
        'arabic': 'ۗ',
        'answers': ['Berhenti lebih utama', 'Sambung lebih utama', 'Wajib berhenti', 'Dilarang berhenti'],
        'correctIndex': 0,
        'explanation':
            'Tanda ۗ = berhenti lebih utama daripada menyambung, '
            'walaupun menyambung masih dibenarkan.',
      },
      {
        'question': 'Tanda (ۖ) bermaksud?',
        'arabic': 'ۖ',
        'answers': ['Berhenti lebih utama', 'Sambung lebih utama', 'Wajib berhenti', 'Dilarang berhenti'],
        'correctIndex': 1,
        'explanation':
            'Tanda ۖ = menyambung bacaan lebih utama, '
            'walaupun berhenti masih dibenarkan.',
      },
      {
        'question': 'Tanda Muanaqah (∴ ∴) bermaksud?',
        'arabic': '∴   ∴',
        'answers': [
          'Wajib berhenti pada kedua-duanya',
          'Berhenti pada salah satu sahaja',
          'Dilarang berhenti',
          'Sambung sahaja'
        ],
        'correctIndex': 1,
        'explanation':
            'Muanaqah = dua tanda berpasangan. '
            'Berhenti pada salah satu sahaja — TIDAK BOLEH berhenti pada kedua-duanya.',
      },
    ],
  };
}