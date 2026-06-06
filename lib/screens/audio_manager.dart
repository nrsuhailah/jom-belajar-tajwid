import 'package:audioplayers/audioplayers.dart';

class AudioManager {
  static final AudioPlayer _player = AudioPlayer();

  // ✅ Simpan listener supaya boleh cancel bila perlu
  // ✅ Guna void Function()? instead of VoidCallback (tak perlu import flutter)
  static void Function()? _onCompleteCallback;

  static const Map<String, String> _titleToKey = {
    // Makhraj
    'Kerongkong':               'makhraj_halq',
    'Lidah':                    'makhraj_lisan',
    'Dua Bibir':                'makhraj_syafatain',
    'Rongga Hidung':            'makhraj_khaisyum',
    'Rongga Mulut':             'makhraj_jauf',
    // Nun Mati
    'Izhar Halqi':              'izhar_halqi',
    'Idgham Maal Ghunnah':      'idgham_maal_ghunnah',
    'Idgham Bila Ghunnah':      'idgham_bila_ghunnah',
    'Iqlab':                    'iqlab',
    "Ikhfa' Haqiqi":            'ikhfa_haqiqi',
    // Mim Mati
    "Ikhfa' Syafawi":           'ikhfa_syafawi',
    'Idgham Mithlain':          'idgham_mithlain',
    'Izhar Syafawi':            'izhar_syafawi',
    // Idgham
    'Idgham Mutamathilain':     'idgham_mutamathilain',
    'Idgham Mutajanisain':      'idgham_mutajanisain',
    'Idgham Mutaqaribain':      'idgham_mutaqaribain',
    // Mad
    'Mad Asli':                 'mad_asli',
    'Mad Lin':                  'mad_lin',
    'Mad Iwadh':                'mad_iwadh',
    'Mad Tamkin':               'mad_tamkin',
    'Mad Silah Qasirah':        'mad_silah_qasirah',
    'Mad Silah Thowilah':       'mad_silah_thowilah',
    'Mad Lazim Kalimi Mukhaffaf': 'mad_lazim_kalimi_mukhaffaf',
    'Mad Lazim Kalimi Muthaqqal': 'mad_lazim_kalimi_muthaqqal',
    'Mad Lazim Harfi Mukhaffaf':  'mad_lazim_harfi_mukhaffaf',
    'Mad Lazim Harfi Muthaqqal':  'mad_lazim_harfi_muthaqqal',
    'Mad Aridh Lissukun':       'mad_aridh_lissukun',
    'Mad Wajib Muttasil':       'mad_wajib_muttasil',
    'Mad Jaiz Munfasil':        'mad_jaiz_munfassil',
    // Qalqalah
    'Qalqalah Sughra':          'qalqalah_sughra',
    'Qalqalah Kubra':           'qalqalah_kubra',
    'Qalqalah Akbar':           'qalqalah_akbar',
    // Ra
    'Ra Tafkhim (Tebal)':       'ra_tafkhim',
    'Ra Tarqiq (Nipis)':        'ra_tarqiq',
    // Lam
    'Lam pada Lafaz Jalalah':   'lam_lafaz_jalalah',
    'Alif Lam Qamariah':        'alif_lam_qamariah',
    'Alif Lam Syamsiah':        'alif_lam_syamsiah',
    // Lain-lain
    "Iltiqa' Sakinah (Nun Wiqayah)": 'iltiqa_sakinah',
    'Hamzah Wasal':             'hamzah_wasal',
  };

  // ✅ Tambah parameter onComplete supaya caller tahu bila audio habis
  static Future<void> play(
    String title,
    int index, {
    void Function()? onComplete, // ✅ void Function()? instead of VoidCallback
  }) async {
    final key = _titleToKey[title];
    if (key == null) return;

    final path = 'sounds/${key}_$index.mp3';
    try {
      await _player.stop();

      // ✅ Daftar listener onComplete SEKALI sahaja di sini
      _onCompleteCallback = onComplete;
      _player.onPlayerComplete.first.then((_) {
        _onCompleteCallback?.call();
        _onCompleteCallback = null;
      });

      await _player.play(AssetSource(path));
    } catch (e) {
      print('Audio error: $e — $path');
      // ✅ Kalau error, tetap call onComplete supaya button reset
      onComplete?.call();
    }
  }

  static Future<void> stop() async {
    _onCompleteCallback = null; // ✅ Clear callback bila stop manual
    await _player.stop();
  }

  static void dispose() => _player.dispose();
}