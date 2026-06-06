import 'package:flutter/material.dart';
import '../widgets/quiz_box.dart';

const Color _navy  = Color(0xFF073793);
const Color _teal  = Color(0xFF0D6A75);
const Color _soft  = Color(0xFFDCE6F5);

class TajwidCard extends StatelessWidget {
  final String arabic;
  final String title;
  final Color color;
  final Color textColor;
  final VoidCallback? onTap;
  final bool isQuiz;
  final LinearGradient? gradient;

  const TajwidCard({
    super.key,
    required this.arabic,
    required this.title,
    required this.color,
    this.textColor = Colors.black,
    this.onTap,
    this.isQuiz = false,
    this.gradient,
  });

  bool get _isDark => color == const Color(0xFF8FAAD8);

  LinearGradient get _resolvedGradient {
    if (gradient != null) return gradient!;
    return _isDark
        ? const LinearGradient(
            colors: [_navy, _teal],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          )
        : LinearGradient(
            colors: [_soft, const Color(0xFFEAF0FB)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          );
  }

  bool get _resolvedIsDark {
    if (gradient != null) {
      return gradient!.colors.first.computeLuminance() < 0.2;
    }
    return _isDark;
  }

  String _getWatermarkChar(String text) {
    if (text.isEmpty) return '';

    // Check codeUnit untuk ٱ (U+0671) — Iltiqa Sakinah
    if (text.trim().codeUnits.isNotEmpty &&
        text.trim().codeUnits.first == 0x0671){
           return 'ا';
        }
    const fallback = {
      'إِلْتِقَا': 'ل',
      'ء': 'ء',
      'ال': 'ل',
      'قلى': 'ق',
      'ا و ي': 'و',
    };

    for (final entry in fallback.entries) {
      if (text.trim() == entry.key || text.contains(entry.key)) {
        return entry.value;
      }
    }

    final cleaned = text.replaceAll(' ', '').trim();
    if (cleaned.isEmpty) return '';
    return cleaned[0];
  }

  @override
  Widget build(BuildContext context) {
    final bool dark = _resolvedIsDark;

    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(18),
        child: Container(
          decoration: BoxDecoration(
            gradient: _resolvedGradient,
            borderRadius: BorderRadius.circular(18),
            border: Border.all(
              color: dark
                  ? Colors.white.withValues(alpha: 0.15)
                  : _navy.withValues(alpha: 0.12),
              width: 1.2,
            ),
            boxShadow: [
              BoxShadow(
                color: dark
                    ? _navy.withValues(alpha: 0.5)
                    : _navy.withValues(alpha: 0.18),
                blurRadius: 10,
                offset: const Offset(0, 6),
              ),
              BoxShadow(
                color: Colors.white.withValues(alpha: 0.6),
                blurRadius: 4,
                offset: const Offset(0, -2),
              ),
            ],
          ),
          child: Stack(
            alignment: Alignment.center,
            children: [

              // Wave kat bawah kad
              Positioned.fill(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(18),
                  child: CustomPaint(
                    painter: _CardWavePainter(
                      dark
                          ? Colors.white.withValues(alpha: 0.06)
                          : _navy.withValues(alpha: 0.07),
                    ),
                  ),
                ),
              ),

              // Huruf Arab watermark
              Positioned(
                right: -10, top: -2,
                child: Text(
                  _getWatermarkChar(arabic),
                  style: TextStyle(
                    fontSize: 52,
                    color: dark
                        ? Colors.white.withValues(alpha: 0.18)
                        : _navy.withValues(alpha: 0.15),
                    fontFamily: 'Amiri',
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),

              // Bulatan geometric bawah kiri — besar
              Positioned(
                bottom: -8, left: -8,
                child: Container(
                  width: 38, height: 38,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: dark
                        ? Colors.white.withValues(alpha: 0.18)
                        : _navy.withValues(alpha: 0.15),
                  ),
                ),
              ),

              // Bulatan geometric bawah kiri — kecil
              Positioned(
                bottom: 8, left: 8,
                child: Container(
                  width: 20, height: 20,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: dark
                        ? Colors.white.withValues(alpha: 0.18)
                        : _navy.withValues(alpha: 0.15),
                  ),
                ),
              ),

              // Content
              SizedBox(
                width: double.infinity,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    if (arabic.isNotEmpty)
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 4),
                        child: Text(
                          arabic,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 26,
                            fontWeight: FontWeight.bold,
                            color: dark ? Colors.white : _navy,
                            fontFamily: 'Amiri',
                            height: 1.4,
                            shadows: [
                              Shadow(
                                offset: const Offset(1, 1),
                                blurRadius: 3,
                                color: Colors.black.withValues(alpha: 0.2),
                              ),
                            ],
                          ),
                        ),
                      ),
                    const SizedBox(height: 4),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 6),
                      child: Text(
                        title,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 11,
                          fontWeight: FontWeight.w600,
                          color: dark
                              ? Colors.white.withValues(alpha: 0.9)
                              : _navy.withValues(alpha: 0.85),
                          height: 1.3,
                        ),
                      ),
                    ),
                    if (isQuiz)
                      const Padding(
                        padding: EdgeInsets.only(top: 6),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          textDirection: TextDirection.ltr,
                          children: [
                            QuizBox(letter: 'ك'),
                            SizedBox(width: 3),
                            QuizBox(letter: 'و'),
                            SizedBox(width: 3),
                            QuizBox(letter: 'ي'),
                            SizedBox(width: 3),
                            QuizBox(letter: 'ز'),
                          ],
                        ),
                      ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _CardWavePainter extends CustomPainter {
  final Color color;
  _CardWavePainter(this.color);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..color = color;
    final path = Path()
      ..moveTo(0, size.height * 0.65)
      ..quadraticBezierTo(
          size.width * 0.25, size.height * 0.5,
          size.width * 0.5, size.height * 0.65)
      ..quadraticBezierTo(
          size.width * 0.75, size.height * 0.8,
          size.width, size.height * 0.65)
      ..lineTo(size.width, size.height)
      ..lineTo(0, size.height)
      ..close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}