import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'dart:developer' as developer;
import 'package:audioplayers/audioplayers.dart';
import '../bookmark_manager.dart';
import 'tajwid_symbol.dart';
import 'arabic_size.dart';
import '../l10n/locale_provider.dart';
import '../l10n/string_tajwid.dart';
import '../screens/flag_toggle.dart';

const Color _navy = Color(0xFF073793);
const Color _teal = Color(0xFF0D6A75);
const Color _gold = Color(0xFFC9A84C);
const Color _soft = Color(0xFFDCE6F5);

const Map<String, String> _titleToAudioPrefix = {
  'Kerongkong':                       'kerongkong',
  'Lidah':                            'lidah',
  'Dua Bibir':                        'dua-bibir',
  'Rongga Hidung':                    'khaisyum',
  'Rongga Mulut':                     'jauf',
  'Izhar Halqi':                      'izhar_halqi',
  'Idgham Maal Ghunnah':              'idgham_maal_ghunnah',
  'Idgham Bila Ghunnah':              'idgham_bila_ghunnah',
  'Iqlab':                            'iqlab',
  "Ikhfa' Haqiqi":                    "ikhfa' haqiqi",
  "Ikhfa' Syafawi":                   'ikhfa_syafawi',
  'Idgham Mithlain':                  'idgham_mithlain',
  'Izhar Syafawi':                    'izhar_syafawi',
  'Idgham Mutamathilain':             'idgham_mutamathilain',
  'Idgham Mutajanisain':              'idgham_mutajanisain',
  'Idgham Mutaqaribain':              'idgham_mutaqaribain',
  'Mad Asli':                         'mad_asli',
  'Mad Lin':                          'mad_lin',
  'Mad Iwadh':                        'mad_iwadh',
  'Mad Tamkin':                       'mad_tamkin',
  'Mad Silah Qasirah':                'mad_silah_qasirah',
  'Mad Silah Thowilah':               'mad_silah_thowilah',
  'Mad Lazim Kalimi Mukhaffaf':       'mad_lazim_kalimi_mukhaffaf',
  'Mad Lazim Kalimi Muthaqqal':       'mad_lazim_kalimi_muthaqqal',
  'Mad Lazim Harfi Mukhaffaf':        'mad_lazim_harfi_mukhaffaf',
  'Mad Lazim Harfi Muthaqqal':        'mad_lazim_harfi_muthaqqal',
  'Mad Aridh Lissukun':               'mad_aridh_lissukun',
  'Mad Wajib Muttasil':               'mad_wajib_muttasil',
  'Mad Jaiz Munfasil':                'mad_jaiz_munfassil',
  'Qalqalah Sughra':                  'qalqalah_sughra',
  'Qalqalah Kubra':                   'qalqalah_kubra',
  'Qalqalah Akbar':                   'qalqalah_akbar',
  'Ra Tafkhim (Tebal)':               'ra_tafkhim',
  'Ra Tarqiq (Nipis)':                'ra_tarqiq',
  'Lam pada Lafaz Jalalah':           'lam_lafaz_jalalah',
  'Alif Lam Qamariah':                'alif_lam_qamariah',
  'Alif Lam Syamsiah':                'alif_lam_syamsiah',
  "Iltiqa' Sakinah (Nun Wiqayah)":   'iltiqa_sakinah',
  'Hamzah Wasal':                     'hamzah_wasal',
};

class DetailContentPage extends StatefulWidget {
  final String title;
  final String description;
  final List<dynamic> examples;
  final VoidCallback onBack;

  const DetailContentPage({
    super.key,
    required this.title,
    required this.description,
    required this.examples,
    required this.onBack,
  });

  @override
  State<DetailContentPage> createState() => _DetailContentPageState();
}

class _DetailContentPageState extends State<DetailContentPage>
    with SingleTickerProviderStateMixin {
  late bool _bookmarked;
  int? _playingIndex;
  final AudioPlayer _audioPlayer = AudioPlayer();
  late final AnimationController _anim = AnimationController(
    vsync: this, duration: const Duration(milliseconds: 600));

  @override
  void initState() {
    super.initState();
    _bookmarked = BookmarkManager.isBookmarked(widget.title);
    _anim.forward();
    _audioPlayer.onPlayerComplete.listen((_) {
      if (mounted) setState(() => _playingIndex = null);
    });
  }

  @override
  void dispose() {
    _audioPlayer.dispose();
    _anim.dispose();
    super.dispose();
  }

  String get _arabicSymbol => TajwidSymbol.get(widget.title);

  String _getDiagramImage(String title) {
    final t = title.toLowerCase();
    if (t.contains('halq') || t.contains('kerongkong')) {
      return 'assets/images/halq_diagram.jpg';
    }
    if (t.contains('lisan') || t.contains('lidah')) {
      return 'assets/images/lisani_diagram.jpg';
    }
    if (t.contains('syafata') || t.contains('bibir')) {
      return 'assets/images/syafataini_diagram.jpg';
    }
    if (t.contains('hidung') || t.contains('khaisyum')) {
      return 'assets/images/khaisyum_diagram.jpg';
    }
    if (t.contains('mulut') || t.contains('jauf') || t.contains('rongga')) {
      return 'assets/images/jauf_diagram.jpg';
    }
    return 'assets/images/halq_diagram.jpg';
  }

  Future<void> _playSound(String fileName, int index) async {
    if (_playingIndex == index) {
      await _audioPlayer.stop();
      setState(() => _playingIndex = null);
      return;
    }
    setState(() => _playingIndex = index);
    try {
      developer.log('Memainkan: assets/sounds/$fileName', name: 'AudioModule');
      await _audioPlayer.stop();
      await _audioPlayer.play(
        AssetSource('sounds/$fileName'), mode: PlayerMode.lowLatency);
    } catch (e) {
      developer.log('Ralat audio: $e', name: 'AudioModule');
      if (mounted) {
        final str = STajwid(context.read<LocaleProvider>().isEn);
        setState(() => _playingIndex = null);
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(str.failNotFound(fileName)),
          backgroundColor: Colors.redAccent));
      }
    }
  }

  void _toggleBookmark(STajwid str) {
    final result = BookmarkManager.toggleBookmark(
      title: widget.title, arabic: _arabicSymbol, color: _navy);
    setState(() => _bookmarked = result);
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(SnackBar(
        backgroundColor: _bookmarked
            ? const Color(0xFF073793) : Colors.redAccent,
        content: Text(
          _bookmarked ? str.bookmarkSaved : str.bookmarkRemoved,
          style: const TextStyle(fontWeight: FontWeight.bold)),
        behavior: SnackBarBehavior.floating,
        duration: const Duration(seconds: 1),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))));
  }

  @override
  Widget build(BuildContext context) {
    final sw = MediaQuery.of(context).size.width;
    final double s = (sw / 393).clamp(0.82, 1.18);
    final str = STajwid(context.watch<LocaleProvider>().isEn);

    final infoList = widget.description
        .split(';')
        .where((s) => s.trim().isNotEmpty)
        .toList();
    final isRongga = widget.title.toLowerCase().contains('hidung') ||
        widget.title.toLowerCase().contains('khaisyum') ||
        widget.title.toLowerCase().contains('mulut') ||
        widget.title.toLowerCase().contains('jauf');

    final List<MapEntry<String, String>> exampleEntries = [];
    if (widget.examples.isNotEmpty && widget.examples[0] != '') {
      final audioPrefix = _titleToAudioPrefix[widget.title] ??
          widget.title
              .toLowerCase()
              .replaceAll(' ', '_')
              .replaceAll("'", '');
      int audioIndex = 1;
      for (final ex in widget.examples) {
        for (final seg in ex.toString().split(';')) {
          if (seg.trim().isNotEmpty) {
            exampleEntries.add(
                MapEntry(seg.trim(), '${audioPrefix}_$audioIndex.mp3'));
            audioIndex++;
          }
        }
      }
    }

    final slideAnim = Tween<Offset>(begin: const Offset(0, -0.3), end: Offset.zero)
        .animate(CurvedAnimation(parent: _anim, curve: Curves.easeOut));
    final fadeAnim =
        CurvedAnimation(parent: _anim, curve: Curves.easeOut);

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Stack(
        children: [
          Positioned.fill(child: Image.asset(
            'assets/images/background_4.jpg', fit: BoxFit.cover)),
          Positioned.fill(child: Container(color: _navy.withOpacity(0.08))),
          SafeArea(
            child: Column(
              children: [
                SlideTransition(
                  position: slideAnim,
                  child: FadeTransition(
                    opacity: fadeAnim,
                    child: _buildHeader(str, s))),
                Expanded(
                  child: ListView(
                    padding: EdgeInsets.fromLTRB(s * 18, s * 12, s * 18, 40),
                    physics: const BouncingScrollPhysics(),
                    children: [
                      _buildDiagramCard(str, s),
                      SizedBox(height: s * 16),
                      _buildInfoCard(infoList, isRongga, str, s),
                      if (exampleEntries.isNotEmpty) ...[
                        SizedBox(height: s * 20),
                        _buildSectionLabel(str.contohBacaan, s),
                        SizedBox(height: s * 10),
                        ...exampleEntries.asMap().entries.map((e) =>
                            _buildExampleCard(
                                e.value.key, e.value.value,
                                e.key + 1, str, s)),
                      ],
                    ])),
              ])),
        ]));
  }

  Widget _buildHeader(STajwid str, double s) {
    return Container(
      margin: EdgeInsets.fromLTRB(s * 18, s * 14, s * 18, 0),
      padding: EdgeInsets.symmetric(horizontal: s * 20, vertical: s * 16),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [_navy, _teal],
          begin: Alignment.topLeft, end: Alignment.bottomRight),
        borderRadius: BorderRadius.circular(s * 24),
        boxShadow: [BoxShadow(
          color: _navy.withOpacity(0.4),
          blurRadius: 16, offset: const Offset(0, 6))]),
      child: Stack(children: [
        Positioned(right: -8, top: -10,
          child: Text(_arabicSymbol,
            style: TextStyle(fontSize: s * 80,
              color: Colors.white.withOpacity(0.07),
              fontWeight: FontWeight.bold, fontFamily: 'Amiri'))),
        Row(children: [
          Expanded(
            child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text('بِسْمِ اللّٰهِ',
                style: TextStyle(fontSize: s * 13, color: _gold,
                  fontWeight: FontWeight.w600, letterSpacing: 1,
                  fontFamily: 'Amiri')),
              SizedBox(height: s * 2),
              Text(widget.title,
                style: TextStyle(fontSize: s * 20,
                  fontWeight: FontWeight.bold, color: Colors.white, height: 1.2)),
              SizedBox(height: s * 4),
              Container(height: 2, width: s * 40,
                decoration: BoxDecoration(
                  color: _gold, borderRadius: BorderRadius.circular(4))),
            ])),
          GestureDetector(
            onTap: () => _toggleBookmark(str),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              width: s * 42, height: s * 42,
              decoration: BoxDecoration(
                color: _bookmarked
                    ? _gold.withOpacity(0.25)
                    : Colors.white.withOpacity(0.12),
                shape: BoxShape.circle,
                border: Border.all(
                  color: _bookmarked
                      ? _gold : Colors.white.withOpacity(0.3), width: 1.5)),
              child: Icon(
                _bookmarked
                    ? Icons.bookmark_rounded
                    : Icons.bookmark_border_rounded,
                color: _bookmarked ? _gold : Colors.white,
                size: s * 22))),
          SizedBox(width: s * 10),
          const FlagToggleButton(),
        ]),
      ]));
  }

  Widget _buildDiagramCard(STajwid str, double s) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(s * 24),
        boxShadow: [BoxShadow(
          color: _navy.withOpacity(0.12),
          blurRadius: 16, offset: const Offset(0, 6))]),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(s * 24),
        child: Column(children: [
          Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(
              horizontal: s * 18, vertical: s * 10),
            decoration: const BoxDecoration(
              gradient: LinearGradient(colors: [_navy, _teal],
                begin: Alignment.centerLeft, end: Alignment.centerRight)),
            child: Row(children: [
              Container(
                padding: EdgeInsets.all(s * 5),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.2),
                  shape: BoxShape.circle),
                child: Icon(Icons.image_rounded,
                  color: Colors.white, size: s * 15)),
              SizedBox(width: s * 8),
              Text(str.rajahMakhraj,
                style: TextStyle(fontSize: s * 13,
                  fontWeight: FontWeight.bold, color: Colors.white)),
            ])),
          Padding(
            padding: EdgeInsets.all(s * 16),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(s * 16),
              child: Image.asset(
                _getDiagramImage(widget.title),
                height: s * 200, width: double.infinity,
                fit: BoxFit.contain))),
        ])));
  }

  Widget _buildInfoCard(
      List<String> infoList, bool isRongga, STajwid str, double s) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(s * 24),
        boxShadow: [BoxShadow(
          color: _navy.withOpacity(0.12),
          blurRadius: 16, offset: const Offset(0, 6))]),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(s * 24),
        child: Column(children: [
          Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(
              horizontal: s * 18, vertical: s * 10),
            decoration: const BoxDecoration(
              gradient: LinearGradient(colors: [_navy, _teal],
                begin: Alignment.centerLeft, end: Alignment.centerRight)),
            child: Row(children: [
              Container(
                padding: EdgeInsets.all(s * 5),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.2),
                  shape: BoxShape.circle),
                child: Icon(Icons.info_outline_rounded,
                  color: Colors.white, size: s * 15)),
              SizedBox(width: s * 8),
              Text(str.maklumat,
                style: TextStyle(fontSize: s * 13,
                  fontWeight: FontWeight.bold, color: Colors.white)),
            ])),
          Padding(
            padding: EdgeInsets.all(s * 10),
            child: Column(
              children: infoList.asMap().entries.map((e) =>
                  _buildInfoTile(
                      str.translatePoint(e.value.trim()),
                      isRongga, e.key, s)).toList())),
        ])));
  }

  Widget _buildInfoTile(String text, bool isRongga, int index, double s) {
    if (text.isEmpty) return const SizedBox();
    final parts = text.split(':');
    final info = parts[0].trim();
    final jawi = parts.length > 1 ? parts[1].trim() : '';

    return Padding(
      padding: EdgeInsets.only(bottom: s * 8),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(s * 14),
          boxShadow: [
            BoxShadow(color: _navy.withOpacity(0.13),
              blurRadius: 10, offset: const Offset(0, 4)),
            BoxShadow(color: _navy.withOpacity(0.06),
              blurRadius: 3, offset: const Offset(0, 1)),
          ]),
        child: IntrinsicHeight(
          child: Row(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
            Container(
              width: 5,
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [_gold, Color(0xFFE8C068)],
                  begin: Alignment.topCenter, end: Alignment.bottomCenter),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(s * 14),
                  bottomLeft: Radius.circular(s * 14)))),
            if (!isRongga && jawi.isNotEmpty)
              Container(
                width: s * 64,
                padding: EdgeInsets.symmetric(vertical: s * 10),
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Color(0xFF0A2E6E), _navy, _teal],
                    begin: Alignment.topCenter, end: Alignment.bottomCenter)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(jawi, textAlign: TextAlign.center,
                      style: TextStyle(fontSize: s * 24,
                        fontWeight: FontWeight.bold, color: Colors.white,
                        fontFamily: 'Amiri', height: 1.2,
                        shadows: const [Shadow(
                          color: Colors.black26, blurRadius: 3,
                          offset: Offset(1, 1))])),
                  ]))
            else
              Container(
                width: s * 40,
                decoration: const BoxDecoration(color: _soft),
                child: Center(child: Text('${index + 1}',
                  style: TextStyle(fontSize: s * 15,
                    fontWeight: FontWeight.bold, color: _navy)))),
            Container(width: 1, color: _navy.withOpacity(0.07)),
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: s * 12, vertical: s * 10),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    if (!isRongga && jawi.isNotEmpty) ...[
                      Container(
                        width: s * 18, height: s * 18,
                        decoration: const BoxDecoration(
                          color: _soft, shape: BoxShape.circle),
                        child: Center(child: Text('${index + 1}',
                          style: TextStyle(fontSize: s * 9,
                            fontWeight: FontWeight.bold, color: _navy)))),
                      SizedBox(width: s * 8),
                    ],
                    Expanded(child: Text(info,
                      style: TextStyle(fontSize: s * 13, height: 1.4,
                        fontWeight: FontWeight.w600,
                        color: const Color(0xFF1A1A2E)))),
                  ]))),
          ]))));
  }

  Widget _buildSectionLabel(String label, double s) {
    return Row(children: [
      Container(width: 4, height: s * 22,
        decoration: BoxDecoration(
          color: _gold, borderRadius: BorderRadius.circular(4))),
      SizedBox(width: s * 10),
      Text(label,
        style: TextStyle(fontSize: s * 17,
          fontWeight: FontWeight.bold, color: _navy)),
    ]);
  }

  Widget _buildExampleCard(String exampleText, String fileName,
      int index, STajwid str, double s) {
    final arabicSize = context.watch<ArabicSizeProvider>().fontSize;
    final isPlaying  = _playingIndex == index;

    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      margin: EdgeInsets.only(bottom: s * 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(s * 20),
        border: Border.all(
          color: isPlaying ? _navy.withOpacity(0.5) : Colors.transparent,
          width: 1.5),
        boxShadow: [BoxShadow(
          color: isPlaying
              ? _navy.withOpacity(0.2) : Colors.black.withOpacity(0.07),
          blurRadius: isPlaying ? 14 : 8, offset: const Offset(0, 3))]),
      child: Row(children: [
        Container(
          width: 6, height: s * 70,
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: [_navy, _teal],
              begin: Alignment.topCenter, end: Alignment.bottomCenter),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(s * 20),
              bottomLeft: Radius.circular(s * 20)))),
        Container(
          margin: EdgeInsets.symmetric(horizontal: s * 10),
          width: s * 28, height: s * 28,
          decoration: const BoxDecoration(color: _soft, shape: BoxShape.circle),
          child: Center(child: Text('$index',
            style: TextStyle(fontSize: s * 12,
              fontWeight: FontWeight.bold, color: _navy)))),
        GestureDetector(
          onTap: () => _playSound(fileName, index),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 250),
            padding: EdgeInsets.symmetric(
              horizontal: s * 12, vertical: s * 6),
            decoration: BoxDecoration(
              color: isPlaying
                  ? Colors.red.withOpacity(0.1)
                  : _navy.withOpacity(0.08),
              borderRadius: BorderRadius.circular(20),
              border: Border.all(
                color: isPlaying
                    ? Colors.red.withOpacity(0.4)
                    : _navy.withOpacity(0.2))),
            child: Row(mainAxisSize: MainAxisSize.min, children: [
              Icon(
                isPlaying
                    ? Icons.stop_circle_rounded
                    : Icons.play_circle_fill_rounded,
                size: s * 18,
                color: isPlaying ? Colors.red : _navy),
              SizedBox(width: s * 5),
              Text(isPlaying ? str.stop : str.play,
                style: TextStyle(fontSize: s * 12,
                  fontWeight: FontWeight.bold,
                  color: isPlaying ? Colors.red : _navy)),
            ]))),
        Expanded(
          child: Padding(
            padding: EdgeInsets.only(right: s * 14),
            child: Text(exampleText,
              textAlign: TextAlign.right,
              style: TextStyle(
                fontSize: arabicSize,
                fontWeight: FontWeight.bold,
                color: const Color(0xFF1A1A2E),
                fontFamily: 'Amiri', height: 1.8)))),
      ]));
  }
}