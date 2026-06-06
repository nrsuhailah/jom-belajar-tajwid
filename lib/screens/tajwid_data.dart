class TajwidData {
  static Map<String, List<Map<String, String>>> dataHukum = {
    'Makhraj Huruf': [
      {
        'arabic': 'اَلْحَلْقُ',
        'title': 'Kerongkong',
        'description': 'Pangkal Kerongkong: ء هـ ; Tengah Kerongkong: ع ح ; Hujung Kerongkong: غ خ',
        'examples': 'أَنْعَمْتَ ; غَيْرِ'
      },
      {
        'arabic': 'اَللِّسَانُ',
        'title': 'Lidah',
        'description': 'Pangkal Lidah \n(Anak Tekak): ق ; Pangkal Lidah (Lelangit Lembut): ك ; Tengah Lidah: ج ش ي ; Tepi Lidah: ض ; Hujung Lidah (Gusi): ل ; Hujung Lidah (Gusi atas): ن ; Hujung Lidah (Gusi atas belakang): ر ; Hujung Lidah (Pangkal gigi atas): ط د ت ; Hujung Lidah (Belakang gigi bawah): ص ز س ; Hujung Lidah (Hujung gigi atas): ظ ذ ث',
        'examples': 'قَالَ ; كَانَ'
      },
      {
        'arabic': 'اَلشَّفَتَانِ',
        'title': 'Dua Bibir',
        'description': 'Bibir Bawah (Hujung gigi atas): ف ; Dua Bibir (Rapat): ب م ; Dua Bibir (Bulat): و',
        'examples': 'فِيلٍ ; بِمَا '
      },
      {
        'arabic': 'اَلْخَيْشُومُ',
        'title': 'Rongga Hidung',
        'description': 'Tempat keluar Ghunnah (dengung) sama ada dari huruf Nun Syaddah (نّ) atau Mim Syaddah (مّ).',
        'examples': 'إِنَّ ; ثُمَّ'
      },
      {
        'arabic': 'اَلْجَوْفُ',
        'title': 'Rongga Mulut',
        'description': 'Terjadi apabila huruf-huruf mad (ا) (و) (ي) keluar dari rongga kerongkong hingga rongga mulut',
        'examples': 'بَا ; بُو '
      },
    ],

    'Nun Mati dan Tanwin': [
      {
        'arabic': 'إِظْهَارٌ حَلْقِي',
        'title': 'Izhar Halqi',
        'description': 'Berlaku apabila nun mati atau tanwin bertemu salah satu huruf izhar: ء هـ ع ح غ خ',
        'examples':
            'نُزُلًا مِّ{نْ غَ}فُورٍ رَّحِيمٍ'
            ';مَّا لَهُم بِهِۦ مِ{نْ عِ}لْمٍ وَلَا لِآبَآئِهِمْ'
            ';وَقُلْنَا يٰٓـَٔادَمُ اسْكُ{نْ أَ}نْتَ وَزَوْجُكَ الْجَنَّةَ',
      },
      {
        'arabic': 'إِدْغَامٌ مَعَ الْغُنَّةِ',
        'title': 'Idgham Maal Ghunnah',
        'description': 'Berlaku apabila nun mati atau tanwin bertemu salah satu daripada huruf idgham maal ghunnah: ي ن م و',
        'examples':
            'فَوَيْ{لٌ لِّ}لْمُصَلِّينَ'
            ';وَلَمْ يَكُ{نْ لَّ}هُۥ كُفُوًا أَحَدٌۢ'
            ';كَلَّا لَئِ{نْ لَّ}مْ يَنتَهِ لَنَسْفَعًا بِالنَّاصِيَةِ',
      },
      {
        'arabic': 'إِدْغَامٌ بِلَا غُنَّةِ',
        'title': 'Idgham Bila Ghunnah',
        'description': 'Berlaku apabila nun mati atau tanwin bertemu salah satu huruf idgham bila ghunnah: ل ر',
        'examples':
            'تَبَّتْ يَدَآ أَبِى لَهَ{بٍ وَ}تَبَّ'
            ';ٱلَّذِىٓ أَطْعَمَهُم مِّن جُو{عٍ وَ}ءَامَنَهُم مِّنْ خَوْفٍۭ'
            ';عَلَيْهِمْ نَا{رٌ مُّ}ؤْصَدَةٌۢ',
      },
      {
        'arabic': 'إِقْلَابٌ',
        'title': 'Iqlab',
        'description': 'Menukarkan bunyi Nun mati kepada bunyi Mim (م) apabila bertemu huruf: ب',
        'examples':
            'كَلَّا لَئِن لَّمْ يَنتَهِ لَنَسْفَعًا {بِالنَّ}اصِيَةِ'
            ';الَّذِينَ يَنقُضُونَ عَهْدَ اللَّهِ مِ{نْ بَ}عْدِ مِيثَاقِهِ'
            ';وَأَمَّا مَ{نْ بَ}خِلَ وَاسْتَغْنَىٰ',
      },
      {
        'arabic': 'إِخْفَاءٌ حَقِيقِي',
        'title': 'Ikhfa\' Haqiqi',
        'description': 'Berlaku apabila nun mati atau tanwin bertemu salah satu huruf ikhfa: ت ث ج د ذ ز س ش ص ض ط ظ ف ق ك',
        'examples':
            'وَكَأْ{سًا دِ}هَاقًا'
            ';سَيَصْلَىٰ نَا{رًا ذَ}اتَ لَهَبٍ'
            ';قَالُوا تِلْكَ إِ{ذًا كَ}رَّةٌ خَاسِرَةٌ',
      },
    ],

    'Mim Mati': [
      {
        'arabic': 'إِخْفَاءٌ شَفَوِي',
        'title': 'Ikhfa\' Syafawi',
        'description': 'Mim mati bertemu huruf ب dibaca dengung 2 harakat.',
        // مْ + ب highlight — mim mati bertemu ba
        'examples':
            'أَلَمْ يَعْلَ{مْ بِ}أَنَّ ٱللَّهَ يَرَىٰ'
            ';تَرْمِيهِ{مْ بِ}حِجَارَةٍ مِّن سِجِّيلٍ'
            ';لَّسْتَ عَلَيْهِ{مْ بِ}مُصَيْطِرٍ',
      },
      {
        'arabic': 'إِدْغَامٌ مِثْلَيْنِ',
        'title': 'Idgham Mithlain',
        'description': 'Mim mati bertemu mim bertanda sabdu dibaca dengung 2 harakat.',
        // مْ + مّ highlight — mim mati bertemu mim sabdu
        'examples':
            'الَّذِي أَطْعَمَهُ{مْ مِّ}ن جُوعٍ وَءَامَنَهُم مِّنْ خَوْفٍ'
            ';إِنَّهَا عَلَيْهِ{مْ مُّ}ؤْصَدَةٌ'
            ';تَنَزَّلُ الْمَلَائِكَةُ وَالرُّوحُ فِيهَا بِإِذْنِ رَبِّهِ{مْ مِّ}ن كُلِّ أَمْرٍ',
      },
      {
        'arabic': 'إِظْهَارٌ شَفَوِي',
        'title': 'Izhar Syafawi',
        'description': 'Mim mati bertemu huruf selain م dan ب, dibaca jelas tanpa dengung.',
        // مْ + و highlight — mim mati bertemu wau
        // مْ + د highlight — mim mati bertemu dal
        // مْ + ع highlight — mim mati bertemu ain
        'examples':
            'اللَّهُ يَسْتَهْزِئُ بِهِ{مْ وَ}يَمُدُّهُمْ فِي طُغْيَانِهِمْ يَعْمَهُونَ'
            ';لَكُ{مْ دِ}ينُكُمْ وَلِيَ دِينِ'
            ';ٱلَّذِينَ هُ{مْ عَ}ن صَلَاتِهِمْ سَاهُونَ',
      },
    ],

    'Hukum Idgham': [
      {
        'arabic': 'إِدْغَامٌ مُتَمَاثِلَيْنِ',
        'title': 'Idgham Mutamathilain',
        'description': 'Pertemuan dua huruf yang sama makhraj dan sifatnya.',
        // دْ + دّ highlight — dua huruf dal
        // فْ + فّ highlight — dua huruf fa
        // تْ + تّ highlight — dua huruf ta
        'examples':
            'وَقَ{دْ دَّ}خَلُوا بِالْكُفْرِ'
            ';فَلَا يُسْرِ{فْ فِّ}ي الْقَتْلِ'
            ';فَمَا رَبِحَ{تْ تِّ}ـجَارَتُهُمْ',
      },
      {
        'arabic': 'إِدْغَامٌ مُتَجَانِسَيْنِ',
        'title': 'Idgham Mutajanisain',
        'description': 'Pertemuan dua huruf yang sama makhraj tetapi berlainan sifat.',
        // بْ + مّ highlight — ba mati bertemu mim
        // تْ + طّ highlight — ta mati bertemu tho
        // تّ + ت highlight — ta sabdu bertemu ta
        'examples':
            'يَابُنَيَّ ارْكَ{بْ مَّ}عَنَا وَلَا تَكُن مَّعَ الْكَافِرِينَ'
            ';فَآمَنَ{تْ طَّ}ائِفَةٌ'
            ';وَلَوْلَا أَن ثَبَّتْنَاكَ لَقَدْ كِدْ{تَّ تَ}رْكَنُ إِلَيْهِمْ شَيْئًا قَلِيلًا',
      },
      {
        'arabic': 'إِدْغَامٌ مُتَقَارِبَيْنِ',
        'title': 'Idgham Mutaqaribain',
        'description': 'Pertemuan dua huruf yang makhraj dan sifatnya hampir sama.',
        // قْ + كّ highlight — qaf mati bertemu kaf sabdu
        // لْ + رّ highlight — lam mati bertemu ra sabdu
        'examples':
            'أَلَمْ نَخْلُ{قْكُّ}م مِّن مَّاءٍ مَّهِينٍ'
            ';قُ{لْ رَّ}بِّي أَعْلَمُ بِعِدَّتِهِم مَّا يَعْلَمُهُمْ إِلَّا قَلِيلٌ'
            ';وَقُ{لْ رَّ}بِّ زِدْنِي عِلْمًا',
      },
    ],

    'Hukum Mad': [
      {
        'arabic': 'مَدّ أَصْلِي',
        'title': 'Mad Asli',
        'description': 'Memanjangkan bacaan ayat sebanyak 2 harakat.',
        // Highlight huruf mad sahaja (ا و ي)
        'examples':
            'قُلْ أَعُ{وذُ} بِرَبِّ النَّاسِ'
            ';وَالنَّهَ{ارِ} إِذَا جَلَّاهَا'
            ';إِيَّاكَ نَعْبُدُ وَإِيَّ{اكَ} نَسْتَعِينُ',
      },
      {
        'arabic': 'مَدّ لِين',
        'title': 'Mad Lin',
        'description': 'Berlaku apabila huruf Wau (و) atau Ya (ي) mati didahului huruf berbaris atas, dan selepasnya ada huruf yang diwakafkan. Dibaca 2, 4, atau 6 harakat.',
        // Highlight و/ي mati + huruf akhir yang diwaqafkan
        'examples':
            'أَلَمْ نَجْعَل لَّهُ {عَيْنَ}يْنِ'
            ';إِيلَافِهِمْ رِحْلَةَ الشِّتَاءِ وَالصَّ{يْفِ}'
            ';وَهَدَيْنَاهُ النَّجْدَ{يْنِ}',
      },
      {
        'arabic': 'مَدّ عِوَض',
        'title': 'Mad Iwadh',
        'description': 'Berlaku apabila berhenti (waqaf) pada huruf yang berbaris Fathatain (baris dua di atas), kecuali Ta Marbutah dan baris tanwin diganti dengan mad asli 2 harakat.',
        // Highlight tanwin fathah yang diwaqafkan
        'examples':
            'أَوْ أَجِدُ عَلَى النَّارِ {هُدًى}'
            ';وَيَتَّخِذَهَا {هُزُوًا}'
            ';وَكَانُوا قَوْمًا {بُورًا}',
      },
      {
        'arabic': 'مَدّ تَمْكِين',
        'title': 'Mad Tamkin',
        'description': 'Pertemuan diantara dua huruf Ya (ي). Ya pertama berbaris bawah dan bersabdu, manakala Ya kedua mati dan dibaca 2 harakat untuk menetapkan bunyi Ya (ي).',
        // Highlight يِّيْ — dua ya bertemu
        'examples':
            'وَإِذَا حُ{يِّيْ}تُم بِتَحِيَّةٍ فَحَيُّوا بِأَحْسَنَ مِنْهَا أَوْ رُدُّوهَا'
            ';وَقُل لِّلَّذِينَ أُوتُوا الْكِتَابَ وَالْأُمِّ{يِّيْ}نَ أَأَسْلَمْتُمْ'
            ';كَلَّا إِنَّ كِتَابَ الْأَبْرَارِ لَفِي عِلِّ{يِّيْ}نَ',
      },
      {
        'arabic': 'مَدّ صِلَة قَصِيرَة',
        'title': 'Mad Silah Qasirah',
        'description': 'Berlaku pada Ha Dhamir (هـ) yang diapit dua huruf berbaris, dan selepasnya BUKAN Hamzah. Dibaca 2 harakat.',
        // Highlight Ha Dhamir هُ/هِ
        'examples':
            'مَا أَغْنَىٰ عَنْ{هُ} مَالُهُ وَمَا كَسَبَ'
            ';وَأَمَّا مَنْ خَافَ مَقَامَ رَبِّ{هِ} وَنَهَى النَّفْسَ عَنِ الْهَوَىٰ'
            ';إِذْ نَادَا{هُ} رَبُّهُ بِالْوَادِ الْمُقَدَّسِ طُوًى',
      },
      {
        'arabic': 'مَدّ صِلَة طَوِيلَة',
        'title': 'Mad Silah Thowilah',
        'description': 'Berlaku apabila Ha Dhamir (هـ) bertemu dengan huruf Hamzah (ء) dalam kalimah berasingan. Dibaca 4 atau 5 harakat.',
        // Highlight Ha Dhamir + Hamzah selepasnya
        'examples':
            'وَمَا يُضِلُّ بِ{هِ إِ}لَّا الْفَاسِقِينَ'
            ';وَإِذْ قَالَ مُوسَىٰ لِقَوْمِ{هِ إِ}نَّ اللَّهَ يَأْمُرُكُمْ أَن تَذْبَحُوا بَقَرَةً'
            ';قُلْ بِئْسَمَا يَأْمُرُكُم بِ{هِ إِ}يمَانُكُمْ إِن كُنتُم مُّؤْمِنِينَ',
      },
      {
        'arabic': 'مَدّ لَازِم',
        'title': 'Mad Lazim',
        'description': 'Klik untuk melihat 4 pembahagian utama Mad Lazim.',
        'examples': '⚙️ Lihat Jenis',
      },
      {
        'arabic': 'مَدّ عَارِض لِلسُّكُون',
        'title': 'Mad Aridh Lissukun',
        'description': 'Huruf Mad bertemu sukun mendatang kerana berhenti (waqaf).',
        // Highlight huruf mad + huruf akhir yang diwaqafkan
        'examples':
            'أَرَأَيْتَ الَّذِي يُكَذِّبُ بِالدِّ{ينِ}'
            ';قُلْ أَعُوذُ بِرَبِّ النَّ{اسِ}'
            ';وَالتِّينِ وَالزَّيْتُ{ونِ}',
      },
      {
        'arabic': 'مَدّ وَاجِب مُتَّصِل',
        'title': 'Mad Wajib Muttasil',
        'description': 'Huruf Mad bertemu Hamzah dalam satu kalimah (4-5 harakat).',
        // Highlight mad + hamzah dalam satu kalimah
        'examples':
            'وَوَجَدَكَ ع{َائِ}لًا فَأَغْنَىٰ'
            ';عَمَّ يَتَس{َاءَ}لُونَ'
            ';وَالسَّم{َاءِ} وَالطَّارِقِ',
      },
      {
        'arabic': 'مَدّ جَائِز مُنْفَصِل',
        'title': 'Mad Jaiz Munfasil',
        'description': 'Huruf Mad bertemu Hamzah dalam dua kalimah berbeza (2, 4, 5 harakat).',
        // Highlight mad (akhir kalimah) + hamzah (awal kalimah seterusnya)
        'examples':
            'إِنَّ{ا أَ}نزَلْنَاهُ فِي لَيْلَةِ الْقَدْرِ'
            ';إِنَّ{ا أَ}عْطَيْنَاكَ الْكَوْثَرَ'
            ';قَالَ رَبِّ اجْعَل لِّ{ي آ}يَةً',
      },
    ],

    'Mad Lazim': [
      {
        'arabic': 'كَلِمِي مُخَفَّف',
        'title': 'Mad Lazim Kalimi Mukhaffaf',
        'description': 'Huruf mad bertemu sukun asli dalam satu kalimah tanpa idgham (sabdu). Dibaca 6 harakat.',
        // Highlight آلْ — mad bertemu sukun asli
        'examples':
            '{آلْ}آنَ وَقَدْ كُنتُم بِهِ تَسْتَعْجِلُونَ'
            ';{آلْ}آنَ وَقَدْ عَصَيْتَ قَبْلُ وَكُنتَ مِنَ الْمُفْسِدِينَ',
      },
      {
        'arabic': 'كَلِمِي مُثَقَّل',
        'title': 'Mad Lazim Kalimi Muthaqqal',
        'description': 'Huruf mad bertemu huruf bertasydid (sabdu) dalam satu kalimah. Dibaca 6 harakat.',
        // Highlight mad + huruf sabdu
        'examples':
            'ذَٰلِكَ بِأَنَّهُمْ ش{َاقُّ}وا اللَّهَ وَرَسُولَهُ'
            ';أَجَعَلْتُمْ سِقَايَةَ الْح{َاجِّ} وَعِمَارَةَ الْمَسْجِدِ الْحَرَامِ'
            ';وَبَثَّ فِيهَا مِن كُلِّ د{َابَّ}ةٍ وَتَصْرِيفِ الرِّيَاحِ',
      },
      {
        'arabic': 'حَرْفِي مُخَفَّف',
        'title': 'Mad Lazim Harfi Mukhaffaf',
        'description': 'Berlaku pada huruf di awal surah yang tidak diidghamkan. Dibaca 6 harakat.',
        // Highlight seluruh huruf awal surah
        'examples':
            '{يسٓ}'
            ';{طسٓ}'
            ';{الٓر}',
      },
      {
        'arabic': 'حَرْفِي مُثَقَّل',
        'title': 'Mad Lazim Harfi Muthaqqal',
        'description': 'Berlaku pada huruf di awal surah yang diidghamkan kepada huruf seterusnya. Dibaca 6 harakat.',
        // Highlight seluruh huruf awal surah
        'examples':
            '{الٓمٓ}'
            ';{طسٓمٓ}'
            ';{الٓمٓصٓ}',
      },
    ],

    'Qalqalah': [
      {
        'arabic': 'قَلْقَلَةٌ صُغْرَى',
        'title': 'Qalqalah Sughra',
        'description': 'Lantunan kecil di tengah kalimah.',
        // Highlight huruf qalqalah mati di tengah kalimah
        'examples':
            'أَلَمْ يَجْعَلْ كَيْدَهُمْ فِي تَ{ضْ}لِيلٍ'
            ';وَالْعَادِيَاتِ {ضَبْ}حًا'
            ';سَلَامٌ هِيَ حَتَّىٰ مَطْلَعِ الْفَ{جْ}رِ',
      },
      {
        'arabic': 'قَلْقَلَةٌ كُبْرَى',
        'title': 'Qalqalah Kubra',
        'description': 'Lantunan kuat di akhir kalimah kerana waqaf.',
        // Highlight huruf qalqalah di akhir kalimah
        'examples':
            'قُلْ أَعُوذُ بِرَبِّ الْفَلَ{قِ}'
            ';وَالسَّمَاءِ ذَاتِ الْبُرُو{جِ}'
            ';مَا أَغْنَىٰ عَنْهُ مَالُهُ وَمَا كَسَ{بَ}',
      },
      {
        'arabic': 'قَلْقَلَةٌ أَكْبَرُ',
        'title': 'Qalqalah Akbar',
        'description': 'Lantunan paling kuat pada huruf qalqalah yang bersabdu.',
        // Highlight huruf qalqalah bersabdu
        'examples':
            'أَ{قْ}تُلُهُ'
            ';يَ{قْ}بِضُ'
            ';يَ{جْ}لِدُ',
      },
    ],

    'Hukum Ra': [
      {
        'arabic': 'الرَّاءُ التَّفْخِيمُ',
        'title': 'Ra Tafkhim (Tebal)',
        'description': 'Ra dibaca tebal apabila berbaris atas, depan, atau sukun yang didahului baris atas/depan.',
        // Highlight huruf Ra
        'examples':
            'وَالْفُ{رْ}قَانُ'
            ';شَكَ{رَ}'
            ';أَمِ ٱ{رْ}تَابُوٓا۟',
      },
      {
        'arabic': 'الرَّاءُ التَّرْقِيقُ',
        'title': 'Ra Tarqiq (Nipis)',
        'description': 'Ra dibaca nipis apabila berbaris bawah atau sukun yang didahului baris bawah asli.',
        // Highlight huruf Ra
        'examples':
            'بَا{رِ}ئِكُمْ'
            ';وَفِ{رْ}عَوْنَ'
            ';وَٱلطَّيْ{رِ}',
      },
    ],

    'Lam Lafaz Jalalah': [
      {
        'arabic': 'لَامُ لَفْظِ الْجَلَالَةِ',
        'title': 'Lam pada Lafaz Jalalah',
        'description': 'Tebal (Tafkhim) jika huruf sebelumnya baris atas/depan. Nipis (Tarqiq) jika sebelumnya baris bawah.',
        // Highlight Lam dalam lafaz Allah
        'examples':
            'ٱل{لَّ}هُ لَآ إِلَٰهَ إِلَّا هُوَ ٱلۡحَيُّ ٱلۡقَيُّومُ'
            ';وَٱل{لَّ}هُ عَزِيزٌ ذُو ٱنتِقَامٍ'
            ';كَيۡفَ تَكۡفُرُونَ بِٱل{لَّ}هِ وَكُنتُمۡ أَمۡوَٰتًا فَأَحۡيَٰكُمۡ',
      },
    ],

    'Alif Lam Marifah': [
      {
        'arabic': 'أَلِف لَام قَمَرِيَّة',
        'title': 'Alif Lam Qamariah',
        'description': 'Alif Lam bertemu huruf Qamariah. Huruf Lam dibaca jelas (Izhar). Tanda sukun jelas di atas Lam.',
        // Highlight الْ — lam qamariah
        'examples':
            '{الْ}كَبِيرُ'
            ';{الْ}يَمِينُ'
            ';{الْ}قَوِيُّ',
      },
      {
        'arabic': 'أَلِف لَام شَمْسِيَّة',
        'title': 'Alif Lam Syamsiah',
        'description': 'Alif Lam bertemu huruf Syamsiah. Bunyi Lam dimasukkan ke huruf seterusnya (Idgham). Tanda sabdu pada huruf selepas Lam.',
        'examples':
            '{التَّ}وَّابُ'
            ';{الطَّ}يِّبُ'
            ';{الشَّ}دِيدُ',
      },
    ],

    'Iltiqa Sakinah': [
      {
        'arabic': 'اِلْتِقَاءُ السَّاكِنَيْنِ',
        'title': 'Iltiqa\' Sakinah (Nun Wiqayah)',
        'description': 'Pertemuan dua sukun antara dua kalimah. Biasanya ditambah bunyi "ni" (nun kecil) untuk menyambung bacaan.',
        'examples':
            'يَوۡمَئِ{ذٍ ٱلْ}مُسۡتَقَرُّ'
            ';يَوۡمَئِ{ذٍ ٱلْ}حَقُّ',
      },
    ],

    'Hamzah Wasal': [
      {
        'arabic': 'هَمْزَةُ الْوَصْلِ',
        'title': 'Hamzah Wasal',
        'description': 'Hamzah tambahan yang dibaca jika memulakan bacaan (Ibtida\') dan digugurkan jika dibaca secara sambung (Wasal).',
        // Highlight hamzah wasal di awal kalimah
        'examples':
            'الشَّمْسُ وَالْقَمَرُ بِحُسْبَانٍ'
            ';{اهْ}دِنَا الصِّرَاطَ الْمُسْتَقِيمَ'
            ';فَانفَجَرَتْ مِنْهُ {اثْ}نَتَا عَشْرَةَ عَيْنًا',
      },
    ],
    // tanda-tanda waqaf
    'Tanda-Tanda Waqaf': [
      {
        'arabic': 'مـ',
        'title': 'Waqaf Lazim',
        'description': 'Dituntut berhenti pada tanda ini. Jika tidak berhenti, makna ayat akan berubah atau menjadi salah.',
        'examples': '',
      },
      {
        'arabic': 'قلى',
        'title': 'Waqaf Qala',
        'description': 'Waqaf lebih utama berbanding wasal. Lebih baik berhenti di sini walaupun boleh disambung.',
        'examples': '',
      },
      {
        'arabic': '∴',
        'title': 'Waqaf Ta\'anuq',
        'description': 'Tanda ini hadir berpasangan. Boleh berhenti pada salah satu tanda sahaja, tidak boleh berhenti pada kedua-duanya sekali.',
        'examples': '',
      },
      {
        'arabic': 'ج',
        'title': 'Waqaf Jaiz',
        'description': 'Harus berhenti atau menyambung bacaan. Kedua-dua pilihan adalah sama.',
        'examples': '',
      },
      {
        'arabic': 'صلى',
        'title': 'Waqaf Sala',
        'description': 'Wasal (sambung) lebih utama berbanding waqaf. Lebih baik disambung walaupun boleh berhenti.',
        'examples': '',
      },
      {
        'arabic': 'لا',
        'title': 'Waqaf Tegah',
        'description': 'Tidak elok berhenti pada tanda ini kerana boleh mengubah makna atau merosakkan bacaan.',
        'examples': '',
      },
      {
        'arabic': '○',
        'title': 'Ra\'sul Ayah',
        'description': 'Tanda berakhirnya satu-satu ayat Al-Quran. Boleh berhenti atau menyambung ke ayat seterusnya.',
        'examples': '',
      },
    ],
  };
}