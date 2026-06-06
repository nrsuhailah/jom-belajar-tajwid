import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../l10n/locale_provider.dart';
import '../screens/home_page.dart';

const Color _navy = Color(0xFF073793);
const Color _gold = Color(0xFFC9A84C);

class LogoPage extends StatefulWidget {
  const LogoPage({super.key});
  @override
  State<LogoPage> createState() => _LogoPageState();
}

class _LogoPageState extends State<LogoPage> with TickerProviderStateMixin {
  late AnimationController _fadeCtrl, _floatCtrl, _pulseCtrl, _glowCtrl;
  late AnimationController _logoScaleCtrl;
  late Animation<double> _fadeIn, _float, _pulse, _glow;
  late Animation<double> _logoScale;

  @override
  void initState() {
    super.initState();

    _fadeCtrl      = AnimationController(vsync: this, duration: const Duration(milliseconds: 1600))..forward();
    _floatCtrl     = AnimationController(vsync: this, duration: const Duration(milliseconds: 5000))..repeat(reverse: true);
    _pulseCtrl     = AnimationController(vsync: this, duration: const Duration(milliseconds: 1600))..repeat(reverse: true);
    _glowCtrl      = AnimationController(vsync: this, duration: const Duration(milliseconds: 2800))..repeat(reverse: true);
    _logoScaleCtrl = AnimationController(vsync: this, duration: const Duration(milliseconds: 3500))..repeat(reverse: true);

    _fadeIn    = CurvedAnimation(parent: _fadeCtrl,      curve: Curves.easeOut);
    _float     = Tween<double>(begin: 0,    end: -8  ).animate(CurvedAnimation(parent: _floatCtrl,     curve: Curves.easeInOut));
    _pulse     = Tween<double>(begin: 0.5,  end: 1.0 ).animate(CurvedAnimation(parent: _pulseCtrl,     curve: Curves.easeInOut));
    _glow      = Tween<double>(begin: 0.0,  end: 1.0 ).animate(CurvedAnimation(parent: _glowCtrl,      curve: Curves.easeInOut));
    _logoScale = Tween<double>(begin: 0.88, end: 1.0 ).animate(CurvedAnimation(parent: _logoScaleCtrl, curve: Curves.easeInOut));
  }

  @override
  void dispose() {
    _fadeCtrl.dispose();
    _floatCtrl.dispose();
    _pulseCtrl.dispose();
    _glowCtrl.dispose();
    _logoScaleCtrl.dispose();
    super.dispose();
  }

  void _goHome() => Navigator.pushReplacement(
    context,
    PageRouteBuilder(
      pageBuilder: (_, __, ___) => const HomePage(),
      transitionsBuilder: (_, a, __, child) => FadeTransition(opacity: a, child: child),
      transitionDuration: const Duration(milliseconds: 500),
    ),
  );

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: const Color(0xFF052D80),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.white,
              Color(0xFFEDF3FC),
              Color(0xFFC8D9F2),
              Color(0xFF7AAAD8),
              Color(0xFF2E6DBF),
              Color(0xFF073793),
              Color(0xFF052D80),
            ],
            stops: [0.0, 0.15, 0.32, 0.50, 0.64, 0.80, 1.0],
          ),
        ),
        child: GestureDetector(
          onTap: _goHome,
          child: Stack(
            fit: StackFit.expand,
            children: [

              // 🎨 Background pattern
              Positioned.fill(
                child: CustomPaint(painter: _ArabesquePainter()),
              ),

              // 📱 Content
              SafeArea(
                child: SizedBox.expand(
                  child: FadeTransition(
                    opacity: _fadeIn,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [

                        Expanded(
                          child: Center(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [

                                // ── Logo ──
                                AnimatedBuilder(
                                  animation: _floatCtrl,
                                  builder: (_, child) => Transform.translate(
                                    offset: Offset(0, _float.value),
                                    child: child,
                                  ),
                                  child: _buildLogo(size),
                                ),

                                SizedBox(height: size.height * 0.002),

                                _buildDivider(),
                                const SizedBox(height: 10),

                                // ── Caption ──
                                Consumer<LocaleProvider>(
                                  builder: (context, locale, _) => Column(
                                    children: [
                                      Text(
                                        locale.isEn
                                            ? 'Adapted from the MADAD e-book'
                                            : 'Adaptasi dari e-buku MADAD',
                                        style: TextStyle(
                                          fontSize: size.width * 0.016,
                                          fontWeight: FontWeight.w300,
                                          color: Colors.white,
                                          letterSpacing: 0.6,
                                          height: 1.85,
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                      Text(
                                        locale.isEn
                                            ? 'Learn Tajwid & Brief Tajwid Rules'
                                            : 'Jom Belajar Tajwid & Hukum Tajwid Ringkas',
                                        style: TextStyle(
                                          fontSize: size.width * 0.022,
                                          fontWeight: FontWeight.w300,
                                          color: Colors.white,
                                          letterSpacing: 0.6,
                                          height: 1.85,
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),

                        Padding(
                          padding: EdgeInsets.only(bottom: size.height * 0.06),
                          child: _buildTapHint(),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildLogo(Size size) {
    final logoSize = size.width * 0.50;

    return AnimatedBuilder(
      animation: _pulseCtrl,
      builder: (_, child) => Transform.scale(
        scale: 0.97 + _pulse.value * 0.06,
        child: child,
      ),
      child: SizedBox(
        width: logoSize,
        height: logoSize,
        child: AnimatedBuilder(
          animation: _logoScale,
          builder: (_, child) => Transform.scale(
            scale: _logoScale.value,
            child: child,
          ),
          child: Image.asset(
            'assets/images/logo.png',
            fit: BoxFit.contain,
          ),
        ),
      ),
    );
  }

  Widget _buildTapHint() {
    return Consumer<LocaleProvider>(
      builder: (context, locale, _) {
        final isEn = locale.isEn;
        return AnimatedBuilder(
          animation: _glowCtrl,
          builder: (_, __) => Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.touch_app_rounded,
                color: Colors.white.withOpacity(0.55 + _glow.value * 0.45),
                size: 28,
              ),
              const SizedBox(height: 6),
              Text(
                isEn ? 'Tap to Start' : 'Sentuh untuk Mula',
                style: TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.w400,
                  color: Colors.white.withOpacity(0.55 + _glow.value * 0.45),
                  letterSpacing: 2.0,
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildDivider() => SizedBox(
    width: 190,
    child: Row(children: [
      Expanded(child: Container(height: 0.5, color: Colors.white.withOpacity(0.30))),
      const SizedBox(width: 10),
      Transform.rotate(
        angle: math.pi / 4,
        child: Container(width: 5, height: 5, color: _gold),
      ),
      const SizedBox(width: 10),
      Expanded(child: Container(height: 0.5, color: Colors.white.withOpacity(0.30))),
    ]),
  );
}

// ─────────────────────────────────────────────────────────
//  Arabesque floral vines CustomPainter
// ─────────────────────────────────────────────────────────
class _ArabesquePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final w = size.width;
    final h = size.height;

    // Top border
    canvas.drawLine(Offset(w * 0.09, h * 0.036), Offset(w * 0.91, h * 0.036),
      Paint()..color = _navy.withOpacity(0.12)..strokeWidth = 0.5..style = PaintingStyle.stroke);
    _hollowRect(canvas, Offset(w * 0.082, h * 0.031), 5.5, _gold.withOpacity(0.50));
    _hollowRect(canvas, Offset(w * 0.900, h * 0.031), 5.5, _gold.withOpacity(0.50));
    canvas.drawCircle(Offset(w * 0.50, h * 0.036), 1.8, Paint()..color = _gold.withOpacity(0.60)..style = PaintingStyle.fill);
    canvas.drawCircle(Offset(w * 0.30, h * 0.036), 1.0, Paint()..color = _navy.withOpacity(0.15)..style = PaintingStyle.fill);
    canvas.drawCircle(Offset(w * 0.70, h * 0.036), 1.0, Paint()..color = _navy.withOpacity(0.15)..style = PaintingStyle.fill);

    _upperVines(canvas, w, h, mirror: false);
    _upperVines(canvas, w, h, mirror: true);
    _titleVine(canvas, w, h, mirror: false);
    _titleVine(canvas, w, h, mirror: true);
    _lowerVine(canvas, w, h, mirror: false);
    _lowerVine(canvas, w, h, mirror: true);
    _bottomFloral(canvas, w, h);

    // Bottom border
    canvas.drawLine(Offset(w * 0.09, h * 0.960), Offset(w * 0.91, h * 0.960),
      Paint()..color = Colors.white.withOpacity(0.11)..strokeWidth = 0.5..style = PaintingStyle.stroke);
    _hollowRect(canvas, Offset(w * 0.082, h * 0.955), 5.5, _gold.withOpacity(0.35));
    _hollowRect(canvas, Offset(w * 0.900, h * 0.955), 5.5, _gold.withOpacity(0.35));
    canvas.drawCircle(Offset(w * 0.50, h * 0.960), 1.7, Paint()..color = _gold.withOpacity(0.45)..style = PaintingStyle.fill);
  }

  void _upperVines(Canvas canvas, double w, double h, {required bool mirror}) {
    canvas.save();
    if (mirror) { canvas.translate(w, 0); canvas.scale(-1, 1); }

    final vine   = Paint()..color = _navy.withOpacity(0.09)..strokeWidth = 1.2..style = PaintingStyle.stroke..strokeCap = StrokeCap.round;
    final thin   = Paint()..color = _navy.withOpacity(0.07)..strokeWidth = 0.7..style = PaintingStyle.stroke..strokeCap = StrokeCap.round;
    final fill   = Paint()..color = _navy.withOpacity(0.045)..style = PaintingStyle.fill;
    final stroke = Paint()..color = _navy.withOpacity(0.08)..strokeWidth = 0.5..style = PaintingStyle.stroke;

    canvas.drawPath(Path()
      ..moveTo(0, h * 0.130)
      ..cubicTo(w*0.068, h*0.097, w*0.136, h*0.089, w*0.186, h*0.113)
      ..cubicTo(w*0.237, h*0.138, w*0.220, h*0.170, w*0.170, h*0.178)
      ..cubicTo(w*0.119, h*0.186, w*0.068, h*0.170, w*0.085, h*0.146)
      ..cubicTo(w*0.102, h*0.122, w*0.163, h*0.116, w*0.186, h*0.130), vine);

    final leaf = Path()
      ..moveTo(w*0.102, h*0.154)
      ..cubicTo(w*0.075, h*0.143, w*0.061, h*0.126, w*0.095, h*0.116)
      ..cubicTo(w*0.112, h*0.112, w*0.129, h*0.120, w*0.119, h*0.130)
      ..cubicTo(w*0.109, h*0.140, w*0.088, h*0.146, w*0.102, h*0.154)..close();
    canvas.drawPath(leaf, fill);
    canvas.drawPath(leaf, stroke);

    canvas.drawPath(Path()
      ..moveTo(w*0.186, h*0.130)
      ..cubicTo(w*0.210, h*0.119, w*0.231, h*0.122, w*0.224, h*0.133)
      ..cubicTo(w*0.217, h*0.143, w*0.197, h*0.143, w*0.193, h*0.134)
      ..cubicTo(w*0.190, h*0.126, w*0.204, h*0.122, w*0.213, h*0.127), thin);

    final bud1 = Path()
      ..moveTo(w*0.061, h*0.089)
      ..cubicTo(w*0.047, h*0.078, w*0.061, h*0.068, w*0.081, h*0.071)
      ..cubicTo(w*0.095, h*0.075, w*0.092, h*0.084, w*0.078, h*0.086)
      ..cubicTo(w*0.068, h*0.091, w*0.058, h*0.088, w*0.061, h*0.089)..close();
    canvas.drawPath(bud1, Paint()..color = _navy.withOpacity(0.04)..style = PaintingStyle.fill);
    canvas.drawPath(bud1, Paint()..color = _navy.withOpacity(0.07)..strokeWidth = 0.5..style = PaintingStyle.stroke);

    final bud2 = Path()
      ..moveTo(w*0.075, h*0.094)
      ..cubicTo(w*0.088, h*0.084, w*0.108, h*0.084, w*0.108, h*0.094)
      ..cubicTo(w*0.108, h*0.100, w*0.088, h*0.103, w*0.075, h*0.097)..close();
    canvas.drawPath(bud2, Paint()..color = _navy.withOpacity(0.04)..style = PaintingStyle.fill);
    canvas.drawPath(bud2, Paint()..color = _navy.withOpacity(0.07)..strokeWidth = 0.5..style = PaintingStyle.stroke);

    canvas.drawPath(Path()
      ..moveTo(0, h*0.178)
      ..cubicTo(w*0.051, h*0.162, w*0.102, h*0.159, w*0.143, h*0.175)
      ..cubicTo(w*0.170, h*0.186, w*0.163, h*0.207, w*0.129, h*0.211),
      Paint()..color = _navy.withOpacity(0.06)..strokeWidth = 0.8..style = PaintingStyle.stroke..strokeCap = StrokeCap.round);

    final leaf2 = Path()
      ..moveTo(w*0.129, h*0.211)
      ..cubicTo(w*0.102, h*0.207, w*0.088, h*0.194, w*0.108, h*0.186)
      ..cubicTo(w*0.119, h*0.183, w*0.136, h*0.186, w*0.133, h*0.197)..close();
    canvas.drawPath(leaf2, Paint()..color = _navy.withOpacity(0.035)..style = PaintingStyle.fill);
    canvas.drawPath(leaf2, Paint()..color = _navy.withOpacity(0.06)..strokeWidth = 0.4..style = PaintingStyle.stroke);

    canvas.restore();
  }

  void _titleVine(Canvas canvas, double w, double h, {required bool mirror}) {
    canvas.save();
    if (mirror) { canvas.translate(w, 0); canvas.scale(-1, 1); }

    canvas.drawPath(Path()
      ..moveTo(w*0.068, h*0.517)
      ..cubicTo(w*0.095, h*0.501, w*0.136, h*0.498, w*0.163, h*0.511)
      ..cubicTo(w*0.183, h*0.520, w*0.176, h*0.537, w*0.150, h*0.542)
      ..cubicTo(w*0.129, h*0.546, w*0.102, h*0.537, w*0.115, h*0.522),
      Paint()..color = _navy.withOpacity(0.055)..strokeWidth = 0.9..style = PaintingStyle.stroke..strokeCap = StrokeCap.round);

    final leaf = Path()
      ..moveTo(w*0.122, h*0.534)
      ..cubicTo(w*0.102, h*0.528, w*0.095, h*0.514, w*0.115, h*0.509)
      ..cubicTo(w*0.126, h*0.507, w*0.133, h*0.515, w*0.126, h*0.522)..close();
    canvas.drawPath(leaf, Paint()..color = _navy.withOpacity(0.03)..style = PaintingStyle.fill);
    canvas.drawPath(leaf, Paint()..color = _navy.withOpacity(0.055)..strokeWidth = 0.4..style = PaintingStyle.stroke);

    canvas.restore();
  }

  void _lowerVine(Canvas canvas, double w, double h, {required bool mirror}) {
    canvas.save();
    if (mirror) { canvas.translate(w, 0); canvas.scale(-1, 1); }

    final stem = Paint()..color = Colors.white.withOpacity(0.11)..strokeWidth = 1.1..style = PaintingStyle.stroke..strokeCap = StrokeCap.round;
    final thin  = Paint()..color = Colors.white.withOpacity(0.08)..strokeWidth = 0.6..style = PaintingStyle.stroke..strokeCap = StrokeCap.round;

    canvas.drawPath(Path()
      ..moveTo(0, h*0.937)
      ..cubicTo(w*0.051, h*0.897, w*0.085, h*0.856, w*0.061, h*0.816)
      ..cubicTo(w*0.041, h*0.778, -w*0.007, h*0.756, w*0.034, h*0.727)
      ..cubicTo(w*0.068, h*0.703, w*0.129, h*0.708, w*0.143, h*0.730)
      ..cubicTo(w*0.156, h*0.752, w*0.122, h*0.773, w*0.081, h*0.765), stem);

    final l1 = Path()
      ..moveTo(w*0.061, h*0.816)
      ..cubicTo(w*0.027, h*0.797, w*0.014, h*0.784, w*0.047, h*0.773)
      ..cubicTo(w*0.068, h*0.770, w*0.088, h*0.778, w*0.078, h*0.795)
      ..cubicTo(w*0.068, h*0.805, w*0.047, h*0.811, w*0.061, h*0.816)..close();
    canvas.drawPath(l1, Paint()..color = Colors.white.withOpacity(0.055)..style = PaintingStyle.fill);
    canvas.drawPath(l1, Paint()..color = Colors.white.withOpacity(0.10)..strokeWidth = 0.5..style = PaintingStyle.stroke);

    final l2 = Path()
      ..moveTo(w*0.034, h*0.727)
      ..cubicTo(w*0.007, h*0.708, 0, h*0.692, w*0.034, h*0.689)
      ..cubicTo(w*0.054, h*0.687, w*0.068, h*0.697, w*0.057, h*0.708)
      ..cubicTo(w*0.047, h*0.719, w*0.027, h*0.722, w*0.034, h*0.727)..close();
    canvas.drawPath(l2, Paint()..color = Colors.white.withOpacity(0.05)..style = PaintingStyle.fill);
    canvas.drawPath(l2, Paint()..color = Colors.white.withOpacity(0.09)..strokeWidth = 0.4..style = PaintingStyle.stroke);

    canvas.drawPath(Path()
      ..moveTo(w*0.143, h*0.730)
      ..cubicTo(w*0.170, h*0.716, w*0.190, h*0.719, w*0.183, h*0.733)
      ..cubicTo(w*0.176, h*0.746, w*0.156, h*0.746, w*0.153, h*0.733)
      ..cubicTo(w*0.150, h*0.722, w*0.163, h*0.716, w*0.176, h*0.724), thin);

    final bud1 = Path()
      ..moveTo(w*0.081, h*0.765)
      ..cubicTo(w*0.061, h*0.752, w*0.061, h*0.738, w*0.085, h*0.735)
      ..cubicTo(w*0.102, h*0.733, w*0.112, h*0.743, w*0.102, h*0.752)
      ..cubicTo(w*0.095, h*0.762, w*0.078, h*0.765, w*0.081, h*0.765)..close();
    canvas.drawPath(bud1, Paint()..color = Colors.white.withOpacity(0.06)..style = PaintingStyle.fill);
    canvas.drawPath(bud1, Paint()..color = Colors.white.withOpacity(0.10)..strokeWidth = 0.4..style = PaintingStyle.stroke);

    final bud2 = Path()
      ..moveTo(w*0.081, h*0.765)
      ..cubicTo(w*0.102, h*0.757, w*0.115, h*0.765, w*0.108, h*0.773)
      ..cubicTo(w*0.102, h*0.781, w*0.081, h*0.781, w*0.075, h*0.773)..close();
    canvas.drawPath(bud2, Paint()..color = Colors.white.withOpacity(0.05)..style = PaintingStyle.fill);
    canvas.drawPath(bud2, Paint()..color = Colors.white.withOpacity(0.08)..strokeWidth = 0.4..style = PaintingStyle.stroke);

    canvas.restore();
  }

  void _bottomFloral(Canvas canvas, double w, double h) {
    final s = Paint()..color = Colors.white.withOpacity(0.09)..strokeWidth = 0.8..style = PaintingStyle.stroke..strokeCap = StrokeCap.round;

    canvas.drawPath(Path()
      ..moveTo(w*0.339, h*0.984)
      ..cubicTo(w*0.390, h*0.968, w*0.448, h*0.965, w*0.500, h*0.975)
      ..cubicTo(w*0.552, h*0.965, w*0.610, h*0.968, w*0.661, h*0.984), s);

    final bloom = Path()
      ..moveTo(w*0.500, h*0.975)
      ..cubicTo(w*0.486, h*0.962, w*0.486, h*0.949, w*0.500, h*0.943)
      ..cubicTo(w*0.514, h*0.949, w*0.514, h*0.962, w*0.500, h*0.975);
    canvas.drawPath(bloom, Paint()..color = Colors.white.withOpacity(0.07)..style = PaintingStyle.fill);
    canvas.drawPath(bloom, s);

    for (final sign in [-1.0, 1.0]) {
      final p = Path()
        ..moveTo(w*0.500, h*0.943)
        ..cubicTo(w*0.500 + sign*w*0.027, h*0.933, w*0.500 + sign*w*0.039, h*0.919, w*0.500 + sign*w*0.027, h*0.911)
        ..cubicTo(w*0.500 + sign*w*0.019, h*0.908, w*0.500 + sign*w*0.007, h*0.913, w*0.500 + sign*w*0.007, h*0.924)..close();
      canvas.drawPath(p, Paint()..color = Colors.white.withOpacity(0.06)..style = PaintingStyle.fill);
      canvas.drawPath(p, Paint()..color = Colors.white.withOpacity(0.09)..strokeWidth = 0.4..style = PaintingStyle.stroke);
    }

    for (final x in [w*0.407, w*0.593]) {
      final bud = Path()
        ..moveTo(x, h*0.975)
        ..cubicTo(x - w*0.020, h*0.965, x - w*0.020, h*0.952, x, h*0.948)
        ..cubicTo(x + w*0.020, h*0.952, x + w*0.020, h*0.965, x, h*0.975)..close();
      canvas.drawPath(bud, Paint()..color = Colors.white.withOpacity(0.05)..style = PaintingStyle.fill);
      canvas.drawPath(bud, Paint()..color = Colors.white.withOpacity(0.08)..strokeWidth = 0.4..style = PaintingStyle.stroke);
    }
  }

  void _hollowRect(Canvas canvas, Offset tl, double size, Color color) {
    canvas.drawRect(Rect.fromLTWH(tl.dx, tl.dy, size, size),
      Paint()..color = color..strokeWidth = 0.7..style = PaintingStyle.stroke);
  }

  @override
  bool shouldRepaint(covariant CustomPainter old) => false;
}