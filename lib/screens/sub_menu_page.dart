import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../l10n/locale_provider.dart';
import '../l10n/string_home.dart';
import '../screens/flag_toggle.dart';

const Color _navyBlue   = Color(0xFF073793);
const Color _deepTeal   = Color(0xFF0D6A75);
const Color _goldAccent = Color(0xFFC9A84C);
const Color _softBlue   = Color(0xFFDCE6F5);

class SubMenuPage extends StatelessWidget {
  final String title;
  final List<Map<String, String>> subHukum;
  final String descriptionKey;
  final Function(String) onSelectSub;

  const SubMenuPage({
    super.key,
    required this.title,
    required this.subHukum,
    required this.descriptionKey,
    required this.onSelectSub,
  });

  @override
  Widget build(BuildContext context) {
    final sw = MediaQuery.of(context).size.width;
    final double s = (sw / 393).clamp(0.82, 1.18);
    final str = SHome(context.watch<LocaleProvider>().isEn);
    final description = str.infoHukum[descriptionKey]
        ?? ['Penerangan untuk $descriptionKey'];

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset('assets/images/background_4.jpg',
                fit: BoxFit.cover)),
          Positioned.fill(
            child: Container(color: _navyBlue.withValues(alpha: 0.06))),
          SafeArea(
            child: Column(
              children: [
                SizedBox(height: s * 12),
                _buildPageHeader(title, s),
                SizedBox(height: s * 14),
                _buildDescriptionBox(description, str, s),
                SizedBox(height: s * 14),
                Expanded(
                  child: ListView.builder(
                    padding: EdgeInsets.fromLTRB(s * 18, 0, s * 18, 40),
                    physics: const BouncingScrollPhysics(),
                    itemCount: subHukum.length,
                    itemBuilder: (context, index) =>
                        _buildSubHukumCard(subHukum[index], index, str,
                            onSelectSub, s),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPageHeader(String title, double s) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: s * 18),
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: s * 20, vertical: s * 14),
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: [_navyBlue, _deepTeal],
            begin: Alignment.topLeft, end: Alignment.bottomRight),
          borderRadius: BorderRadius.circular(s * 22),
          boxShadow: [BoxShadow(
            color: _navyBlue.withValues(alpha: 0.4),
            blurRadius: 14, offset: const Offset(0, 5))]),
        child: Stack(
          children: [
            Positioned.fill(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(s * 22),
                child: CustomPaint(
                  painter: _SubtleGeometricPainter(
                    Colors.white.withValues(alpha: 0.05))))),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(width: 48),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text('بِسْمِ اللّٰهِ الرَّحْمٰنِ الرَّحِيْمِ',
                        style: TextStyle(fontSize: s * 13, color: _goldAccent,
                          fontWeight: FontWeight.w600, letterSpacing: 1.2,
                          fontFamily: 'Amiri')),
                      SizedBox(height: s * 6),
                      Text(title,
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: s * 22,
                          fontWeight: FontWeight.w900,
                          color: Colors.white, height: 1.2)),
                      SizedBox(height: s * 6),
                      Container(height: 2, width: s * 50,
                        decoration: BoxDecoration(
                          color: _goldAccent,
                          borderRadius: BorderRadius.circular(4))),
                    ]),
                ),
                const FlagToggleButton(),
              ],
            ),
          ])));
  }

  Widget _buildDescriptionBox(List<String> desc, SHome str, double s) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: s * 18),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(s * 20),
          boxShadow: [BoxShadow(
            color: _navyBlue.withValues(alpha: 0.1),
            blurRadius: 12, offset: const Offset(0, 4))]),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(s * 20),
          child: Column(
            children: [
              Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(
                  horizontal: s * 16, vertical: s * 10),
                color: _softBlue,
                child: Row(children: [
                  Container(
                    padding: EdgeInsets.all(s * 5),
                    decoration: BoxDecoration(
                      color: _navyBlue.withValues(alpha: 0.1),
                      shape: BoxShape.circle),
                    child: Icon(Icons.info_outline_rounded,
                      color: _navyBlue, size: s * 15)),
                  SizedBox(width: s * 8),
                  Text(str.description,
                    style: TextStyle(fontSize: s * 13,
                      fontWeight: FontWeight.bold, color: _navyBlue)),
                ])),
              Padding(
                padding: EdgeInsets.all(s * 14),
                child: Column(
                  children: desc.map((entry) => Padding(
                    padding: EdgeInsets.only(bottom: s * 8),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Icon(Icons.auto_awesome_rounded,
                          color: _goldAccent, size: s * 14),
                        SizedBox(width: s * 10),
                        Expanded(child: Text(
                          str.translateDesc(entry),
                          style: TextStyle(fontSize: s * 12.5,
                            fontWeight: FontWeight.w600,
                            color: Colors.black87, height: 1.4))),
                      ]))).toList())),
            ]))));
  }

  Widget _buildSubHukumCard(Map<String, String> item, int index,
      SHome str, Function(String) onTap, double s) {
    final isEven    = index % 2 == 0;
    final cardColor = isEven ? _navyBlue : _deepTeal;

    return Container(
      margin: EdgeInsets.only(bottom: s * 12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(s * 20),
        boxShadow: [BoxShadow(
          color: cardColor.withValues(alpha: 0.3),
          blurRadius: 10, offset: const Offset(0, 4))]),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(s * 20),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: () => onTap(item['title']!),
            splashColor: Colors.white.withValues(alpha: 0.1),
            child: Container(
              height: s * 90,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [cardColor, cardColor.withValues(alpha: 0.75)],
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight)),
              child: Stack(
                children: [
                  Positioned.fill(
                    child: CustomPaint(
                      painter: _CardPatternPainter(
                        Colors.white.withValues(alpha: 0.04)))),
                  Positioned(bottom: -14, left: -8,
                    child: Icon(Icons.stars_rounded, size: s * 65,
                      color: Colors.white.withValues(alpha: 0.08))),
                  Positioned(top: -18, right: 50,
                    child: Container(width: s * 55, height: s * 55,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: _goldAccent.withValues(alpha: 0.08)))),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: s * 18),
                    child: Row(children: [
                      Container(
                        width: s * 32, height: s * 32,
                        decoration: BoxDecoration(
                          color: Colors.white.withValues(alpha: 0.15),
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: Colors.white.withValues(alpha: 0.3),
                            width: 1)),
                        child: Center(child: Text('${index + 1}',
                          style: TextStyle(fontSize: s * 13,
                            fontWeight: FontWeight.bold,
                            color: Colors.white)))),
                      SizedBox(width: s * 14),
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            if ((item['arabic'] ?? '').isNotEmpty)
                              Text(item['arabic']!,
                                style: TextStyle(fontSize: s * 32,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white, height: 1.3,
                                  fontFamily: 'Amiri')),
                            Text(str.translateTitle(item['title'] ?? ''),
                              style: TextStyle(fontSize: s * 14,
                                fontWeight: FontWeight.w800,
                                color: _goldAccent, letterSpacing: 0.5)),
                          ])),
                      Container(
                        width: s * 32, height: s * 32,
                        decoration: BoxDecoration(
                          color: Colors.white.withValues(alpha: 0.12),
                          shape: BoxShape.circle),
                        child: Icon(Icons.chevron_right_rounded,
                          color: Colors.white, size: s * 20)),
                    ])),
                ]))))));
  }
}

class _SubtleGeometricPainter extends CustomPainter {
  final Color color;
  _SubtleGeometricPainter(this.color);
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color ..strokeWidth = 0.8 ..style = PaintingStyle.stroke;
    const spacing = 28.0;
    for (double i = -spacing; i < size.width + spacing; i += spacing) {
      for (double j = -spacing; j < size.height + spacing; j += spacing) {
        final path = Path()
          ..moveTo(i + spacing / 2, j)
          ..lineTo(i + spacing, j + spacing / 2)
          ..lineTo(i + spacing / 2, j + spacing)
          ..lineTo(i, j + spacing / 2)
          ..close();
        canvas.drawPath(path, paint);
      }
    }
  }
  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class _CardPatternPainter extends CustomPainter {
  final Color color;
  _CardPatternPainter(this.color);
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color ..strokeWidth = 0.7 ..style = PaintingStyle.stroke;
    const spacing = 20.0;
    for (double i = -size.height; i < size.width + size.height; i += spacing) {
      canvas.drawLine(
          Offset(i, 0), Offset(i + size.height, size.height), paint);
    }
  }
  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}