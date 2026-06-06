import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'quiz_constant.dart';
import '../l10n/locale_provider.dart';
import '../l10n/string_quiz.dart';

class QuizResultScreen extends StatefulWidget {
  final String selectedModule;
  final int score;
  final int totalQuestions;
  final VoidCallback onBack;
  final VoidCallback onRetry;

  const QuizResultScreen({
    super.key,
    required this.selectedModule,
    required this.score,
    required this.totalQuestions,
    required this.onBack,
    required this.onRetry,
  });

  @override
  State<QuizResultScreen> createState() => _QuizResultScreenState();
}

class _QuizResultScreenState extends State<QuizResultScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _ctrl;
  late Animation<int> _scoreAnim;
  late Animation<double> _fadeAnim;

  @override
  void initState() {
    super.initState();
    _ctrl = AnimationController(
        vsync: this,
        duration: const Duration(milliseconds: 1200));
    _scoreAnim = IntTween(begin: 0, end: widget.score).animate(
        CurvedAnimation(parent: _ctrl, curve: Curves.easeOut));
    _fadeAnim =
        CurvedAnimation(parent: _ctrl, curve: Curves.easeIn);
    _ctrl.forward();
  }

  @override
  void dispose() {
    _ctrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final sw = MediaQuery.of(context).size.width;
    final double s = (sw / 393).clamp(0.82, 1.18);
    final str = SQuiz(context.watch<LocaleProvider>().isEn);

    final double stars =
        QuizHelpers.starCount(widget.score, widget.totalQuestions);
    final pct = widget.totalQuestions > 0
        ? (widget.score / widget.totalQuestions * 100).round()
        : 0;

    final label = stars >= 3.0
        ? str.cemerlang
        : stars >= 1.5
            ? str.bagus
            : str.teruskanBelajar;

    return FadeTransition(
      opacity: _fadeAnim,
      child: Center(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(
              horizontal: s * 28, vertical: s * 40),
          child: Container(
            padding: EdgeInsets.all(s * 36),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(s * 32),
              boxShadow: [BoxShadow(
                color: Colors.black.withOpacity(0.12),
                blurRadius: 30, offset: const Offset(0, 10))]),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text('🏆', style: TextStyle(fontSize: s * 64)),
                SizedBox(height: s * 6),
                Text(label,
                  style: TextStyle(fontSize: s * 24,
                    fontWeight: FontWeight.bold, color: navyBlue)),
                SizedBox(height: s * 6),
                Text('${str.modulLabel}: ${widget.selectedModule}',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.grey, fontSize: s * 13)),
                SizedBox(height: s * 24),
                AnimatedBuilder(
                  animation: _scoreAnim,
                  builder: (_, __) => Text(
                    '${_scoreAnim.value} / ${widget.totalQuestions}',
                    style: TextStyle(fontSize: s * 52,
                      fontWeight: FontWeight.bold,
                      color: goldAccent))),
                Text('$pct${str.peratus}',
                  style: TextStyle(
                      color: Colors.grey, fontSize: s * 14)),
                SizedBox(height: s * 20),

                // Bintang
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(3, (i) {
                    double starIndex = i + 1.0;
                    IconData iconData;
                    Color iconColor;
                    if (stars >= starIndex) {
                      iconData = Icons.star_rounded;
                      iconColor = goldAccent;
                    } else if (stars >= starIndex - 0.5) {
                      iconData = Icons.star_half_rounded;
                      iconColor = goldAccent;
                    } else {
                      iconData = Icons.star_outline_rounded;
                      iconColor = Colors.grey.shade300;
                    }
                    return Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: s * 4),
                      child: Icon(iconData,
                          color: iconColor, size: s * 42));
                  }),
                ),

                SizedBox(height: s * 8),
                Text(
                  stars >= 3.0
                      ? str.skorSempurna
                      : stars >= 1.5
                          ? str.hampir
                          : str.ulangKaji,
                  style: TextStyle(
                      color: Colors.grey, fontSize: s * 12)),
                SizedBox(height: s * 32),

                // XP
                Container(
                  padding: EdgeInsets.symmetric(
                      horizontal: s * 20, vertical: s * 10),
                  decoration: BoxDecoration(
                    color: cardGold,
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                        color: goldAccent.withOpacity(0.5),
                        width: 1.5)),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text('⭐',
                          style: TextStyle(fontSize: s * 18)),
                      SizedBox(width: s * 6),
                      Text(str.xpDiperoleh(widget.score * 10),
                        style: TextStyle(color: navyBlue,
                          fontWeight: FontWeight.bold,
                          fontSize: s * 14)),
                    ])),
                SizedBox(height: s * 28),

                // Butang Cuba Lagi
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: deepTeal,
                    minimumSize: Size(double.infinity, s * 52),
                    shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(s * 14)),
                    elevation: 3),
                  onPressed: widget.onRetry,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.refresh_rounded,
                          color: Colors.white, size: s * 20),
                      SizedBox(width: s * 8),
                      Text(str.cubaLagi,
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 16)),
                    ])),
                SizedBox(height: s * 12),

                // Butang Kembali
                OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    side: const BorderSide(
                        color: navyBlue, width: 2),
                    minimumSize: Size(double.infinity, s * 52),
                    shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(s * 14))),
                  onPressed: widget.onBack,
                  child: Text(str.kembaliKuiz,
                    style: const TextStyle(
                      color: navyBlue,
                      fontWeight: FontWeight.bold,
                      fontSize: 16))),
              ],
            ),
          ),
        ),
      ),
    );
  }
}