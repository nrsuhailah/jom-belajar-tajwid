import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../l10n/locale_provider.dart';
import '../l10n/string_info.dart';
import '../screens/flag_toggle.dart';

const Color _navy = Color(0xFF073793);
const Color _teal = Color(0xFF0D6A75);
const Color _gold = Color(0xFFC9A84C);
const Color _soft = Color(0xFFDCE6F5);

class InfoPage extends StatefulWidget {
  const InfoPage({super.key});

  @override
  State<InfoPage> createState() => _InfoPageState();
}

class _InfoPageState extends State<InfoPage>
    with SingleTickerProviderStateMixin {
  bool _aboutExpanded = false;
  late AnimationController _controller;
  late Animation<double> _expandAnim;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this, duration: const Duration(milliseconds: 300));
    _expandAnim = CurvedAnimation(
      parent: _controller, curve: Curves.easeInOut);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _toggleAbout() {
    setState(() => _aboutExpanded = !_aboutExpanded);
    _aboutExpanded ? _controller.forward() : _controller.reverse();
  }

  @override
  Widget build(BuildContext context) {
    final sw = MediaQuery.of(context).size.width;
    final double s = (sw / 393).clamp(0.82, 1.18);
    final str = SInfo(context.watch<LocaleProvider>().isEn);

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Stack(children: [
        Positioned.fill(child: Image.asset(
            'assets/images/background_4.jpg', fit: BoxFit.cover)),
        Positioned.fill(
            child: Container(color: _navy.withValues(alpha: 0.06))),
        SafeArea(
          child: Column(children: [
            _buildHeader(str, s),
            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.fromLTRB(
                    s * 18, s * 8, s * 18, s * 8),
                child: Column(children: [
                  _buildAboutAppCard(str, s),
                  SizedBox(height: s * 12),
                  _buildSection(
                    icon: Icons.security_rounded,
                    title: str.infoPrivacyTitle,
                    subtitle: str.infoPrivacySub,
                    bullets: str.infoPrivacyBullets,
                    s: s),
                  SizedBox(height: s * 16),
                ]))),
          ])),
      ]));
  }

  Widget _buildHeader(SInfo str, double s) {
    return Padding(
      padding: EdgeInsets.fromLTRB(s * 20, s * 20, s * 20, s * 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(width: 48),
          Expanded(
            child: Column(children: [
              Text(str.infoTitle,
                style: TextStyle(fontSize: s * 24,
                  fontWeight: FontWeight.bold, color: _navy)),
              SizedBox(height: s * 6),
              Container(height: 3, width: s * 50,
                decoration: BoxDecoration(
                  color: _gold, borderRadius: BorderRadius.circular(4))),
            ]),
          ),
          const FlagToggleButton(),
        ],
      ));
  }

  Widget _buildAboutAppCard(SInfo str, double s) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.95),
        borderRadius: BorderRadius.circular(s * 20),
        boxShadow: [BoxShadow(
          color: _navy.withValues(alpha: 0.10),
          blurRadius: 16, offset: const Offset(0, 6))]),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(s * 20),
        child: Column(children: [
          // ── Header / tap to expand ──
          GestureDetector(
            onTap: _toggleAbout,
            child: Container(
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
                  child: Icon(Icons.info_rounded,
                    color: Colors.white, size: s * 16)),
                SizedBox(width: s * 10),
                Expanded(child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(str.infoAboutTitle,
                      style: TextStyle(fontSize: s * 15,
                        fontWeight: FontWeight.bold, color: Colors.white)),
                    Text(str.infoAboutSub,
                      style: TextStyle(fontSize: s * 11,
                        color: Colors.white.withValues(alpha: 0.8))),
                  ])),
                AnimatedRotation(
                  turns: _aboutExpanded ? 0.5 : 0,
                  duration: const Duration(milliseconds: 300),
                  child: Icon(Icons.keyboard_arrow_down_rounded,
                    color: Colors.white, size: s * 24)),
              ]))),

          // ── Expandable body ──
          SizeTransition(
            sizeFactor: _expandAnim,
            child: Padding(
              padding: EdgeInsets.all(s * 16),
              child: Column(children: [
                // E-book thumbnails
                Row(children: [
                  Expanded(child: _buildEbookThumbnail(
                      'assets/images/e-book1.png', s)),
                  SizedBox(width: s * 14),
                  Expanded(child: _buildEbookThumbnail(
                      'assets/images/e-book2.png', s)),
                ]),
                SizedBox(height: s * 12),

                // Body text — justify
                Text(str.infoEbookBody,
                  style: TextStyle(fontSize: s * 11,
                    fontWeight: FontWeight.w400,
                    color: const Color(0xFF2C3E50)),
                  textAlign: TextAlign.justify), // ← justify

                SizedBox(height: s * 12),

                // ── Divider pemisah ──
                Divider(color: _soft, thickness: 1.5, height: 1),

                SizedBox(height: s * 12),

                // About Us bullets
                ...str.infoAboutBullets.map((b) => Padding(
                    padding: EdgeInsets.only(bottom: s * 8),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Icon(Icons.check_circle,
                          color: _gold, size: s * 14),
                        SizedBox(width: s * 8),
                        Expanded(child: Text(b,
                          style: TextStyle(
                            fontSize: s * 11,
                            color: const Color(0xFF2C3E50),
                            height: 1.4))),
                      ]))),
              ]))),
        ])));
  }

  Widget _buildSection({
    required IconData icon,
    required String title,
    required double s,
    String? subtitle,
    List<String>? bullets,
  }) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.95),
        borderRadius: BorderRadius.circular(s * 20),
        boxShadow: [BoxShadow(
          color: _navy.withValues(alpha: 0.10),
          blurRadius: 16, offset: const Offset(0, 6))]),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(s * 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(
                  horizontal: s * 14, vertical: s * 12),
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [_navy, _teal],
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(children: [
                    Container(
                      padding: EdgeInsets.all(s * 6),
                      decoration: BoxDecoration(
                        color: Colors.white.withValues(alpha: 0.2),
                        shape: BoxShape.circle),
                      child: Icon(icon,
                        color: Colors.white, size: s * 14)),
                    SizedBox(width: s * 8),
                    Expanded(child: Text(title,
                      style: TextStyle(fontSize: s * 13,
                        fontWeight: FontWeight.bold,
                        color: Colors.white))),
                  ]),
                  if (subtitle != null) ...[
                    SizedBox(height: s * 3),
                    Text(subtitle,
                      style: TextStyle(fontSize: s * 10,
                        color: Colors.white.withValues(alpha: 0.8))),
                  ],
                ])),
            Padding(
              padding: EdgeInsets.all(s * 14),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (bullets != null)
                    ...bullets.map((b) => Padding(
                      padding: EdgeInsets.only(bottom: s * 8),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Icon(Icons.check_circle,
                            color: _gold, size: s * 14),
                          SizedBox(width: s * 8),
                          Expanded(child: Text(b,
                            style: TextStyle(
                              fontSize: s * 11,
                              color: const Color(0xFF2C3E50),
                              height: 1.4))),
                        ]))),
                ])),
          ])));
  }

  Widget _buildEbookThumbnail(String imagePath, double s) {
    return Container(
      height: s * 140,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [BoxShadow(
          color: _navy.withValues(alpha: 0.15),
          blurRadius: 10, offset: const Offset(0, 4))]),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Image.asset(
          imagePath,
          fit: BoxFit.contain,
          width: double.infinity,
          height: s * 140,
          errorBuilder: (context, error, stackTrace) => Container(
            height: s * 140, color: _soft,
            child: Icon(Icons.book_rounded,
                color: _navy, size: s * 40)))));
  }
}