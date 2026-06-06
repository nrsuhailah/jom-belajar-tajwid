import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../bookmark_manager.dart';
import 'tajwid_data.dart';
import '../l10n/locale_provider.dart';
import '../l10n/string_tajwid.dart';
import '../l10n/string_home.dart';
import '../screens/flag_toggle.dart';

const Color _navy = Color(0xFF073793);
const Color _teal = Color(0xFF0D6A75);
const Color _gold = Color(0xFFC9A84C);
const Color _soft = Color(0xFFDCE6F5);

const List<Color> _waqafColors = [
  Color(0xFFD32F2F),
  Color(0xFF7B1FA2),
  Color(0xFF1565C0),
  Color(0xFF2E7D32),
  Color(0xFF00838F),
  Color(0xFFE65100),
  Color(0xFF4527A0),
];

class WaqafPage extends StatefulWidget {
  final VoidCallback onBack;
  const WaqafPage({super.key, required this.onBack});

  @override
  State<WaqafPage> createState() => _WaqafPageState();
}

class _WaqafPageState extends State<WaqafPage>
    with SingleTickerProviderStateMixin {
  bool _bookmarked = false;
  late final AnimationController _anim = AnimationController(
      vsync: this, duration: const Duration(milliseconds: 600));

  static const String _bookmarkKey = 'Tanda-Tanda Waqaf';
  static const String _arabicSymbol = 'وَقْف';

  List<Map<String, String>> get _waqafData =>
      TajwidData.dataHukum['Tanda-Tanda Waqaf'] ?? [];

  @override
  void initState() {
    super.initState();
    _bookmarked = BookmarkManager.isBookmarked(_bookmarkKey);
    _anim.forward();
  }

  @override
  void dispose() {
    _anim.dispose();
    super.dispose();
  }

  void _toggleBookmark(STajwid str) {
    final result = BookmarkManager.toggleBookmark(
        title: _bookmarkKey, arabic: _arabicSymbol, color: _navy);
    setState(() => _bookmarked = result);
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(SnackBar(
          backgroundColor:
              _bookmarked ? const Color(0xFF073793) : Colors.redAccent,
          content: Text(
              _bookmarked ? str.bookmarkSaved : str.bookmarkRemoved,
              style: const TextStyle(fontWeight: FontWeight.bold)),
          behavior: SnackBarBehavior.floating,
          duration: const Duration(seconds: 1),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))));
  }

  @override
  Widget build(BuildContext context) {
    final sw = MediaQuery.of(context).size.width;
    final double s = (sw / 393).clamp(0.82, 1.18);
    final str = STajwid(context.watch<LocaleProvider>().isEn);
    final strH = SHome(context.watch<LocaleProvider>().isEn);

    final slideAnim =
        Tween<Offset>(begin: const Offset(0, -0.3), end: Offset.zero)
            .animate(CurvedAnimation(parent: _anim, curve: Curves.easeOut));
    final fadeAnim = CurvedAnimation(parent: _anim, curve: Curves.easeOut);

    return Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(children: [
          Positioned.fill(
              child: Image.asset('assets/images/background_4.jpg',
                  fit: BoxFit.cover)),
          Positioned.fill(
              child: Container(color: _navy.withValues(alpha: 0.08))),
          SafeArea(
            child: Column(children: [
              SlideTransition(
                  position: slideAnim,
                  child: FadeTransition(
                      opacity: fadeAnim, child: _buildHeader(str, s))),
              Expanded(
                  child: ListView(
                      padding:
                          EdgeInsets.fromLTRB(s * 18, 8, s * 18, 40),
                      physics: const BouncingScrollPhysics(),
                      children: [
                    _buildDefinisiCard(str, s),
                    SizedBox(height: s * 20),
                    _buildSectionLabel(str.waqafListTitle, s),
                    SizedBox(height: s * 10),
                    ..._waqafData.asMap().entries.map((e) {
                      final color =
                          _waqafColors[e.key % _waqafColors.length];
                      return _buildWaqafCard(
                          e.value, e.key + 1, color, strH, s);
                    }),
                  ])),
            ]),
          ),
        ]));
  }

  Widget _buildHeader(STajwid str, double s) {
    return Container(
        margin: EdgeInsets.fromLTRB(s * 18, s * 14, s * 18, 0),
        padding:
            EdgeInsets.symmetric(horizontal: s * 20, vertical: s * 16),
        decoration: BoxDecoration(
            gradient: const LinearGradient(
                colors: [_navy, _teal],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight),
            borderRadius: BorderRadius.circular(s * 24),
            boxShadow: [
              BoxShadow(
                  color: _navy.withValues(alpha: 0.4),
                  blurRadius: 16,
                  offset: const Offset(0, 6))
            ]),
        child: Stack(children: [
          Positioned(
              right: -8,
              top: -10,
              child: Text(_arabicSymbol,
                  style: TextStyle(
                      fontSize: s * 70,
                      color: Colors.white.withValues(alpha: 0.07),
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Amiri'))),
          Row(children: [
            Expanded(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                  Text(str.waqafPageTitle,
                      style: TextStyle(
                          fontSize: s * 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          height: 1.2)),
                  SizedBox(height: s * 4),
                  Container(
                      height: 2,
                      width: s * 40,
                      decoration: BoxDecoration(
                          color: _gold,
                          borderRadius: BorderRadius.circular(4))),
                ])),
            GestureDetector(
                onTap: () => _toggleBookmark(str),
                child: AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    width: s * 42,
                    height: s * 42,
                    decoration: BoxDecoration(
                        color: _bookmarked
                            ? _gold.withValues(alpha: 0.25)
                            : Colors.white.withValues(alpha: 0.12),
                        shape: BoxShape.circle,
                        border: Border.all(
                            color: _bookmarked
                                ? _gold
                                : Colors.white.withValues(alpha: 0.3),
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

  Widget _buildDefinisiCard(STajwid str, double s) {
    return Container(
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(s * 24),
            boxShadow: [
              BoxShadow(
                  color: _navy.withValues(alpha: 0.12),
                  blurRadius: 16,
                  offset: const Offset(0, 6))
            ]),
        child: ClipRRect(
            borderRadius: BorderRadius.circular(s * 24),
            child: Column(children: [
              Container(
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(
                      horizontal: s * 18, vertical: s * 12),
                  decoration: const BoxDecoration(
                      gradient: LinearGradient(
                          colors: [_navy, _teal],
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight)),
                  child: Row(children: [
                    Container(
                        padding: EdgeInsets.all(s * 6),
                        decoration: BoxDecoration(
                            color: Colors.white.withValues(alpha: 0.2),
                            shape: BoxShape.circle),
                        child: Icon(Icons.auto_awesome_rounded,
                            color: Colors.white, size: s * 16)),
                    SizedBox(width: s * 10),
                    Text(str.notaTajwid,
                        style: TextStyle(
                            fontSize: s * 15,
                            fontWeight: FontWeight.bold,
                            color: Colors.white)),
                    const Spacer(),
                    Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: s * 10, vertical: s * 4),
                        decoration: BoxDecoration(
                            color: _gold.withValues(alpha: 0.25),
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(
                                color: _gold.withValues(alpha: 0.5))),
                        child: Text(_arabicSymbol,
                            style: TextStyle(
                                fontSize: s * 18,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Amiri'))),
                  ])),
              Padding(
                  padding: EdgeInsets.all(s * 16),
                  child: Column(children: [
                    Container(
                        width: double.infinity,
                        padding: EdgeInsets.all(s * 14),
                        decoration: BoxDecoration(
                            color: _soft.withValues(alpha: 0.6),
                            borderRadius: BorderRadius.circular(14)),
                        child: Text(str.waqafDefinition,
                            style: TextStyle(
                                fontSize: s * 13.5,
                                color: Colors.black87,
                                height: 1.6),
                            textAlign: TextAlign.justify)),
                    SizedBox(height: s * 12),
                    Row(children: [
                      _buildJenisChip(str.waqafStop,
                          Icons.pause_circle_rounded, Colors.redAccent, s),
                      SizedBox(width: s * 10),
                      _buildJenisChip(str.waqafContinue,
                          Icons.play_circle_rounded, Colors.green, s),
                    ]),
                  ])),
            ])));
  }

  Widget _buildJenisChip(
      String label, IconData icon, Color color, double s) {
    return Expanded(
        child: Container(
            padding: EdgeInsets.symmetric(
                horizontal: s * 12, vertical: s * 10),
            decoration: BoxDecoration(
                color: color.withValues(alpha: 0.08),
                borderRadius: BorderRadius.circular(12),
                border:
                    Border.all(color: color.withValues(alpha: 0.3))),
            child: Row(children: [
              Icon(icon, color: color, size: s * 20),
              SizedBox(width: s * 8),
              Text(label,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: color,
                      fontSize: s * 13)),
            ])));
  }

  Widget _buildSectionLabel(String label, double s) {
    return Row(children: [
      Container(
          width: 4,
          height: s * 22,
          decoration: BoxDecoration(
              color: _gold, borderRadius: BorderRadius.circular(4))),
      SizedBox(width: s * 10),
      Text(label,
          style: TextStyle(
              fontSize: s * 17,
              fontWeight: FontWeight.bold,
              color: _navy)),
    ]);
  }

  // ─── Helper: detect sama ada simbol ni waqaf ta'anuq ───────────────
  bool _isTaanuq(String arabic) {
    // Simbol ta'anuq mengandungi U+06DD (End of Ayah mark) atau
    // dua tanda ۛ (U+06D9 Stop Sign) dengan spasi di tengah
    return arabic.contains('\u06D9') || arabic.contains('ۛ');
  }

  Widget _buildWaqafCard(Map<String, String> item, int index,
      Color color, SHome strH, double s) {
    final simbol = item['arabic'] ?? '';
    final nama = strH.translateTitle(item['title'] ?? '');
    final maksud = strH.translateDesc(item['description'] ?? '');
    final isTaanuq = _isTaanuq(simbol);

    return Container(
        margin: EdgeInsets.only(bottom: s * 12),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(s * 20),
            border: Border.all(
                color: color.withValues(alpha: 0.2), width: 1.5),
            boxShadow: [
              BoxShadow(
                  color: Colors.black.withValues(alpha: 0.07),
                  blurRadius: 10,
                  offset: const Offset(0, 4))
            ]),
        child: Row(children: [
          // Bar warna kiri
          Container(
              width: 6,
              height: s * 80,
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      colors: [color, color.withValues(alpha: 0.4)],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter),
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(s * 20),
                      bottomLeft: Radius.circular(s * 20)))),
          SizedBox(width: s * 10),

          // Nombor index
          Container(
              width: s * 26,
              height: s * 26,
              decoration:
                  const BoxDecoration(color: _soft, shape: BoxShape.circle),
              child: Center(
                  child: Text('$index',
                      style: TextStyle(
                          fontSize: s * 11,
                          fontWeight: FontWeight.bold,
                          color: _navy)))),
          SizedBox(width: s * 10),

          // ── Kotak simbol Arab ──────────────────────────────────────
          Container(
              width: s * 58,
              height: s * 58,
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      colors: [color, color.withValues(alpha: 0.75)],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight),
                  borderRadius: BorderRadius.circular(s * 14),
                  boxShadow: [
                    BoxShadow(
                        color: color.withValues(alpha: 0.35),
                        blurRadius: 6,
                        offset: const Offset(0, 3))
                  ]),
              // FIX: Guna Align + padding berbeza untuk ta'anuq
              child: isTaanuq
                  ? _buildTaanuqSymbol(simbol, s)
                  : Center(
                      child: Text(simbol,
                          textAlign: TextAlign.center,
                          textHeightBehavior: const TextHeightBehavior(
                            applyHeightToFirstAscent: false,
                            applyHeightToLastDescent: false,
                          ),
                          style: TextStyle(
                              fontSize: s * 22,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontFamily: 'Amiri',
                              height: 1.0)))),
          SizedBox(width: s * 12),

          // Nama dan penerangan
          Expanded(
              child: Padding(
                  padding: EdgeInsets.symmetric(
                      vertical: s * 14, horizontal: 4),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(nama,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: color,
                                fontSize: s * 13.5)),
                        SizedBox(height: s * 4),
                        Text(maksud,
                            style: TextStyle(
                                fontSize: s * 12.5,
                                color: Colors.black54,
                                height: 1.4)),
                      ]))),
          SizedBox(width: s * 10),
        ]));
  }

  Widget _buildTaanuqSymbol(String simbol, double s) {
    return Padding(
      // Tolak ke bawah sikit sebab tanda titik atas font Arab
      // secara semula jadi render terlalu tinggi dalam kotak
      padding: EdgeInsets.only(top: s * 8),
      child: Align(
        alignment: Alignment.center,
        child: Text(
          simbol,
          textAlign: TextAlign.center,
          textHeightBehavior: const TextHeightBehavior(
            applyHeightToFirstAscent: false,
            applyHeightToLastDescent: false,
          ),
          style: TextStyle(
            fontSize: s * 18, // Kecilkan sikit supaya dua simbol muat
            fontWeight: FontWeight.bold,
            color: Colors.white,
            fontFamily: 'Amiri',
            height: 1.0,
            letterSpacing: s * 8, // Bagi ruang antara dua tanda
          ),
        ),
      ),
    );
  }
}