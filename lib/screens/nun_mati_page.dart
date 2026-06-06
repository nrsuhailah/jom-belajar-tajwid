import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../bookmark_manager.dart';
import 'tajwid_rule.dart';
import 'tajwid_highlight.dart';
import 'audio_manager.dart';
import 'tajwid_symbol.dart';
import 'arabic_size.dart';
import '../l10n/locale_provider.dart';
import '../l10n/string_tajwid.dart';
import '../l10n/string_home.dart';
import '../screens/flag_toggle.dart';

const Color _navy = Color(0xFF073793);
const Color _teal = Color(0xFF0D6A75);
const Color _gold = Color(0xFFC9A84C);
const Color _soft = Color(0xFFDCE6F5);

class NunMatiPage extends StatefulWidget {
  final String title;
  final String description;
  final List<dynamic> examples;
  final VoidCallback onBack;

  const NunMatiPage({
    super.key,
    required this.title,
    required this.description,
    required this.examples,
    required this.onBack,
  });

  @override
  State<NunMatiPage> createState() => _NunMatiPageState();
}

class _NunMatiPageState extends State<NunMatiPage>
    with SingleTickerProviderStateMixin {
  bool _bookmarked = false;
  int? _playingIndex;
  late final TajwidRule _rule = TajwidRuleExtension.fromTitle(widget.title);
  late final AnimationController _anim = AnimationController(
    vsync: this, duration: const Duration(milliseconds: 600));

  Color get _themeColor => _rule != TajwidRule.none ? _rule.color : _navy;
  String get _arabicSymbol => TajwidSymbol.get(widget.title);

  @override
  void initState() {
    super.initState();
    _bookmarked = BookmarkManager.isBookmarked(widget.title);
    _anim.forward();
  }

  @override
  void dispose() {
    AudioManager.stop();
    _anim.dispose();
    super.dispose();
  }

  Future<void> _playAudio(int index) async {
    if (_playingIndex == index) {
      await AudioManager.stop();
      setState(() => _playingIndex = null);
      return;
    }
    setState(() => _playingIndex = index);
    await AudioManager.play(
      widget.title, index,
      onComplete: () {
        if (mounted) setState(() => _playingIndex = null);
      });
  }

  void _toggleBookmark(STajwid str) {
    final result = BookmarkManager.toggleBookmark(
      title: widget.title, arabic: _arabicSymbol, color: _themeColor);
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

  String _translatePoint(String ms, bool isEn) {
    if (!isEn) return ms;

    const extra = <String, String>{
      'Pangkal Lidah \n(Anak Tekak): ق': 'Back of Tongue\n(Uvula): ق',
    };
    final fromExtra = extra[ms];
    if (fromExtra != null) return fromExtra;

    return SHome(true).translateDesc(ms.trim());
  }

  @override
  Widget build(BuildContext context) {
    final sw = MediaQuery.of(context).size.width;
    final double s = (sw / 393).clamp(0.82, 1.18);
    final str = STajwid(context.watch<LocaleProvider>().isEn);
    final isEn = context.watch<LocaleProvider>().isEn;

    final examples = widget.examples.isNotEmpty
        ? widget.examples[0].toString()
            .split(';')
            .where((e) => e.trim().isNotEmpty)
            .toList()
        : <String>[];
    final points = widget.description.split(';');

    final slideAnim = Tween<Offset>(
      begin: const Offset(0, -0.3), end: Offset.zero)
        .animate(CurvedAnimation(parent: _anim, curve: Curves.easeOut));
    final fadeAnim =
        CurvedAnimation(parent: _anim, curve: Curves.easeOut);

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Stack(
        children: [
          Positioned.fill(child: Image.asset(
            'assets/images/background_4.jpg', fit: BoxFit.cover)),
          Positioned.fill(
              child: Container(color: _navy.withOpacity(0.08))),
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
                    padding: EdgeInsets.fromLTRB(s * 18, 8, s * 18, 40),
                    physics: const BouncingScrollPhysics(),
                    children: [
                      _buildNoteCard(points, str, s, isEn),
                      SizedBox(height: s * 20),
                      Row(children: [
                        Container(width: 4, height: s * 22,
                          decoration: BoxDecoration(
                            color: _gold,
                            borderRadius: BorderRadius.circular(4))),
                        SizedBox(width: s * 10),
                        Text(str.jomBerlatih,
                          style: TextStyle(fontSize: s * 17,
                            fontWeight: FontWeight.bold, color: _navy)),
                      ]),
                      SizedBox(height: s * 10),
                      ...examples.asMap().entries.map((e) =>
                          _buildExampleCard(
                              e.value.trim(), e.key + 1, str, s)),
                    ])),
              ])),
        ]));
  }

  Widget _buildHeader(STajwid str, double s) {
    return Container(
      margin: EdgeInsets.fromLTRB(s * 18, s * 14, s * 18, 0),
      padding: EdgeInsets.symmetric(
          horizontal: s * 20, vertical: s * 16),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [_navy, _themeColor == _navy ? _teal : _themeColor],
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
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(widget.title,
                  style: TextStyle(fontSize: s * 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white, height: 1.2)),
                SizedBox(height: s * 4),
                Container(height: 2, width: s * 40,
                  decoration: BoxDecoration(
                    color: _gold,
                    borderRadius: BorderRadius.circular(4))),
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
                      ? _gold : Colors.white.withOpacity(0.3),
                  width: 1.5)),
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

  Widget _buildNoteCard(
      List<String> points, STajwid str, double s, bool isEn) {
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
              horizontal: s * 18, vertical: s * 12),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  _navy,
                  _themeColor == _navy ? _teal : _themeColor
                ],
                begin: Alignment.centerLeft,
                end: Alignment.centerRight)),
            child: Row(children: [
              Container(
                padding: EdgeInsets.all(s * 6),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.2),
                  shape: BoxShape.circle),
                child: Icon(Icons.auto_awesome_rounded,
                  color: Colors.white, size: s * 16)),
              SizedBox(width: s * 10),
              Text(str.notaTajwid,
                style: TextStyle(fontSize: s * 15,
                  fontWeight: FontWeight.bold, color: Colors.white)),
              const Spacer(),
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: s * 10, vertical: s * 4),
                decoration: BoxDecoration(
                  color: _gold.withOpacity(0.25),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: _gold.withOpacity(0.5))),
                child: Text(_arabicSymbol,
                  style: TextStyle(fontSize: s * 20,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Amiri'))),
            ])),
          Padding(
            padding: EdgeInsets.all(s * 16),
            child: Column(
              children: points.asMap().entries.map((e) => Padding(
                padding: EdgeInsets.only(bottom: s * 10),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: s * 3),
                      width: s * 22, height: s * 22,
                      decoration: const BoxDecoration(
                        color: _soft, shape: BoxShape.circle),
                      child: Center(child: Text('${e.key + 1}',
                        style: TextStyle(fontSize: s * 11,
                          fontWeight: FontWeight.bold,
                          color: _navy)))),
                    SizedBox(width: s * 10),
                    Expanded(child: Text(
                      _translatePoint(e.value.trim(), isEn),
                      style: TextStyle(fontSize: s * 13.5,
                        color: Colors.black87, height: 1.5))),
                  ]))).toList())),
        ])));
  }

  Widget _buildExampleCard(
      String rawText, int index, STajwid str, double s) {
    final arabicSize = context.watch<ArabicSizeProvider>().fontSize;
    final isPlaying  = _playingIndex == index;

    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      margin: EdgeInsets.only(bottom: s * 14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(s * 20),
        border: Border.all(
          color: isPlaying
              ? _themeColor.withOpacity(0.5) : Colors.transparent,
          width: 1.5),
        boxShadow: [BoxShadow(
          color: isPlaying
              ? _themeColor.withOpacity(0.25)
              : Colors.black.withOpacity(0.08),
          blurRadius: isPlaying ? 16 : 10,
          offset: const Offset(0, 4))]),
      child: Row(children: [
        Container(
          width: 6, height: s * 130,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [_themeColor, _themeColor.withOpacity(0.5)],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(s * 20),
              bottomLeft: Radius.circular(s * 20)))),
        Container(
          margin: EdgeInsets.symmetric(horizontal: s * 10),
          width: s * 28, height: s * 28,
          decoration: const BoxDecoration(
              color: _soft, shape: BoxShape.circle),
          child: Center(child: Text('$index',
            style: TextStyle(fontSize: s * 12,
              fontWeight: FontWeight.bold, color: _navy)))),
        Expanded(
          child: Padding(
            padding: EdgeInsets.fromLTRB(0, s * 12, s * 14, s * 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                TajwidHighlightWidget(
                  rawText: rawText,
                  rule: _rule,
                  fontSize: arabicSize,
                  onHighlightTapped: () {
                    final desc =
                        str.translateRuleDesc(_rule.description);
                    ScaffoldMessenger.of(context)
                      ..hideCurrentSnackBar()
                      ..showSnackBar(SnackBar(
                        backgroundColor: _rule.color,
                        content: Text('${_rule.label}: $desc',
                          style: const TextStyle(
                            color: Colors.white, fontSize: 12)),
                        behavior: SnackBarBehavior.floating,
                        duration: const Duration(seconds: 2),
                        shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.circular(10))));
                  }),
                SizedBox(height: s * 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    if (_rule != TajwidRule.none)
                      Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: s * 8, vertical: s * 3),
                        decoration: BoxDecoration(
                          color: _rule.color.withOpacity(0.12),
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            color: _rule.color.withOpacity(0.3))),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Container(width: 7, height: 7,
                              decoration: BoxDecoration(
                                color: _rule.color,
                                shape: BoxShape.circle)),
                            SizedBox(width: s * 5),
                            Text(_rule.label,
                              style: TextStyle(
                                color: _rule.color,
                                fontSize: s * 10,
                                fontWeight: FontWeight.bold)),
                          ]))
                    else
                      const SizedBox.shrink(),
                    GestureDetector(
                      onTap: () => _playAudio(index),
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
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(
                              isPlaying
                                  ? Icons.stop_circle_rounded
                                  : Icons.play_circle_fill_rounded,
                              size: s * 18,
                              color: isPlaying ? Colors.red : _navy),
                            SizedBox(width: s * 5),
                            Text(
                              isPlaying ? str.stop : str.listen,
                              style: TextStyle(fontSize: s * 12,
                                fontWeight: FontWeight.bold,
                                color: isPlaying
                                    ? Colors.red : _navy)),
                          ]))),
                  ]),
              ]))),
      ]));
  }
}