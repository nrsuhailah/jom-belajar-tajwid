import 'package:flutter/material.dart';
import 'dart:math' as math;
import '../l10n/string_quiz.dart';

const Color navyBlue      = Color(0xFF073793);
const Color deepTeal      = Color(0xFF0D6A75);
const Color goldAccent    = Color(0xFFC9A84C);
const Color softBlue      = Color(0xFFEAF1FB);
const Color ultraSoftBlue = Color(0xFFF0F4FA);
const Color successGreen  = Color(0xFF2E7D52);
const Color errorRed      = Color(0xFFB71C1C);
const Color cardGold      = Color(0xFFFFF8E7);

class QuizHelpers {
  static Path drawStar(Size size) {
    double degToRad(double deg) => deg * (math.pi / 180.0);
    final halfWidth = size.width / 2;
    final degreesPerStep = degToRad(360 / 5);
    final path = Path();
    path.moveTo(size.width, halfWidth);
    for (double step = 0;
        step < degToRad(360);
        step += degreesPerStep) {
      path.lineTo(
        halfWidth + halfWidth * math.cos(step),
        halfWidth + halfWidth * math.sin(step),
      );
      path.lineTo(
        halfWidth + (halfWidth / 2.5) * math.cos(step + degreesPerStep / 2),
        halfWidth + (halfWidth / 2.5) * math.sin(step + degreesPerStep / 2),
      );
    }
    path.close();
    return path;
  }

  static IconData moduleIcon(String name) {
    const icons = {
      'Makhraj Huruf':          Icons.record_voice_over_rounded,
      'Nun Mati dan Tanwin':    Icons.auto_stories_rounded,
      'Mim Mati':               Icons.menu_book_rounded,
      'Hukum Idgham':           Icons.join_inner_rounded,
      'Hukum Mad':              Icons.straighten_rounded,
      'Hukum Ra':               Icons.campaign_rounded,
      'Lam Lafaz Jalalah':      Icons.mosque_rounded,
      'Qalqalah':               Icons.vibration_rounded,
      'Alif Lam Ma\'rifah':     Icons.font_download_rounded,
      'Iltiqa Sakinah':         Icons.layers_rounded,
      'Hamzah Wasal':           Icons.title_rounded,
      'Tanda Tanda Waqaf':      Icons.pan_tool_rounded,
    };
    return icons[name] ?? Icons.quiz_rounded;
  }

  static LinearGradient moduleGradient(int index) {
    const gradients = [
      LinearGradient(
        colors: [Color(0xFFEAF1FB), Color(0xFFB8CCF5)],
        begin: Alignment.topLeft, end: Alignment.bottomRight),
      LinearGradient(
        colors: [navyBlue, deepTeal],
        begin: Alignment.topLeft, end: Alignment.bottomRight),
      LinearGradient(
        colors: [Color(0xFFEAF1FB), Color(0xFF9BB7F0)],
        begin: Alignment.topLeft, end: Alignment.bottomRight),
      LinearGradient(
        colors: [navyBlue, deepTeal],
        begin: Alignment.topLeft, end: Alignment.bottomRight),
    ];
    return gradients[index % gradients.length];
  }

  static double starCount(int score, int total) {
    if (score <= 0) return 0.0;
    double stars = score * 0.5;
    return stars > 3.0 ? 3.0 : stars;
  }
}

class StreakBanner extends StatelessWidget {
  final int streakDays;
  final int totalXp;
  final SQuiz str;

  const StreakBanner({
    super.key,
    required this.streakDays,
    required this.totalXp,
    required this.str,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
          horizontal: 24, vertical: 12),
      padding: const EdgeInsets.symmetric(
          horizontal: 16, vertical: 14),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
            colors: [navyBlue, deepTeal]),
        borderRadius: BorderRadius.circular(18),
        border: Border.all(
            color: Colors.white.withOpacity(0.4)),
        boxShadow: [BoxShadow(
          color: navyBlue.withOpacity(0.35),
          blurRadius: 14, offset: const Offset(0, 6))],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(child: _Chip(
            icon: '🔥',
            label: '$streakDays ${str.hariLabel}',
            sub: str.berturutTurut)),
          _divider(),
          Expanded(child: _Chip(
            icon: '⭐',
            label: '$totalXp XP',
            sub: str.mataTerkumpul)),
          _divider(),
          const Expanded(child: _Chip(
            icon: '📖',
            label: 'Tajwid',
            sub: 'Al-Quran')),
        ],
      ),
    );
  }

  Widget _divider() => Container(
    width: 1, height: 36,
    color: Colors.white.withOpacity(0.3));
}

class _Chip extends StatelessWidget {
  final String icon;
  final String label;
  final String sub;
  const _Chip({
    required this.icon,
    required this.label,
    required this.sub,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(icon,
                style: const TextStyle(fontSize: 16)),
            const SizedBox(width: 8),
            Text(label,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 14)),
          ],
        ),
        const SizedBox(height: 4),
        Text(sub,
          style: TextStyle(
            color: Colors.white.withOpacity(0.75),
            fontSize: 11)),
      ],
    );
  }
}