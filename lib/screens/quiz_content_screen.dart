import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'quiz_constant.dart';
import '../l10n/locale_provider.dart';
import '../l10n/string_quiz.dart';

class QuizContentScreen extends StatelessWidget {
  final String selectedModule;
  final Map<String, List<Map<String, dynamic>>> quizData;
  final int currentIndex;
  final bool isMuted;
  final int? selectedAnswerIndex;
  final int? correctAnswerIndex;
  final String? answerExplanation;
  final void Function(int) onAnswer;
  final VoidCallback onToggleMute;
  final VoidCallback onNext;
  final VoidCallback? onPrevious;

  const QuizContentScreen({
    super.key,
    required this.selectedModule,
    required this.quizData,
    required this.currentIndex,
    required this.isMuted,
    required this.onAnswer,
    required this.onToggleMute,
    required this.onNext,
    this.selectedAnswerIndex,
    this.correctAnswerIndex,
    this.answerExplanation,
    this.onPrevious,
  });

  Color _bgColor(int i) {
    if (selectedAnswerIndex == null) return Colors.white;
    if (i == correctAnswerIndex) return successGreen.withValues(alpha: 0.15);
    if (i == selectedAnswerIndex) return errorRed.withValues(alpha: 0.12);
    return Colors.white;
  }

  Color _borderColor(int i) {
    if (selectedAnswerIndex == null) return Colors.transparent;
    if (i == correctAnswerIndex) return successGreen;
    if (i == selectedAnswerIndex) return errorRed;
    return Colors.transparent;
  }

  IconData? _icon(int i) {
    if (selectedAnswerIndex == null) return null;
    if (i == correctAnswerIndex) return Icons.check_circle_rounded;
    if (i == selectedAnswerIndex) return Icons.cancel_rounded;
    return null;
  }

  @override
  Widget build(BuildContext context) {
    final sw = MediaQuery.of(context).size.width;
    final double s = (sw / 393).clamp(0.82, 1.18);
    final str = SQuiz(context.watch<LocaleProvider>().isEn);

    final questions = quizData[selectedModule]!;
    final question  = questions[currentIndex];
    final answered  = selectedAnswerIndex != null;
    final bottomInset = MediaQuery.of(context).padding.bottom;

    final bool canGoBack = currentIndex > 0 && onPrevious != null;

    final translatedQuestion =
        str.translateQuestion(question['question'] as String);
    final translatedAnswers =
        List<String>.from(question['answers'] as List)
            .map(str.translateAnswer)
            .toList();
    final translatedExplanation = answerExplanation != null
        ? str.translateExplanation(answerExplanation!)
        : null;

    return Column(children: [
      SafeArea(
        bottom: false,
        child: Padding(
          padding: EdgeInsets.only(top: s * 6, bottom: s * 16),
          child: Column(children: [
            // ── Top bar ──
            Padding(
              padding: EdgeInsets.symmetric(horizontal: s * 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(
                        horizontal: s * 12, vertical: s * 6),
                    decoration: BoxDecoration(
                      color: softBlue,
                      borderRadius: BorderRadius.circular(20)),
                    child: Text('${currentIndex + 1} / ${questions.length}',
                      style: TextStyle(color: navyBlue,
                        fontWeight: FontWeight.bold, fontSize: s * 13))),
                  Flexible(child: Text(selectedModule,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(fontSize: s * 20,
                      fontWeight: FontWeight.bold, color: navyBlue))),
                  GestureDetector(
                    onTap: onToggleMute,
                    child: Container(
                      width: s * 38, height: s * 38,
                      decoration: BoxDecoration(
                        color: softBlue, shape: BoxShape.circle,
                        border: Border.all(
                            color: navyBlue.withValues(alpha: 0.3))),
                      child: Icon(
                        isMuted
                            ? Icons.volume_off_rounded
                            : Icons.volume_up_rounded,
                        color: navyBlue, size: s * 18))),
                ])),
          ])),
      ),

      // ── Progress bar ──
      Padding(
        padding: EdgeInsets.symmetric(horizontal: s * 25),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(6),
          child: LinearProgressIndicator(
            value: (currentIndex + 1) / questions.length,
            backgroundColor: softBlue,
            valueColor: const AlwaysStoppedAnimation<Color>(goldAccent),
            minHeight: 7))),

      SizedBox(height: s * 32),

      // ── Main content ──
      Expanded(
        child: Padding(
          padding: EdgeInsets.fromLTRB(s * 20, 0, s * 20, 0),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [

                // Arabic
                if (question['arabic'] != null) ...[
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.symmetric(
                        vertical: s * 14, horizontal: s * 16),
                    decoration: BoxDecoration(
                      color: cardGold,
                      borderRadius: BorderRadius.circular(s * 16),
                      border: Border.all(
                          color: goldAccent.withValues(alpha: 0.5),
                          width: 1.5)),
                    child: Text(question['arabic'],
                      textAlign: TextAlign.center,
                      textDirection: TextDirection.rtl,
                      style: TextStyle(
                        fontSize: s * 30, color: navyBlue,
                        fontWeight: FontWeight.w600, height: 1.8,
                        fontFamily: 'Amiri'))),
                  SizedBox(height: s * 10),
                ],

                // Question
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(
                      vertical: s * 18, horizontal: s * 18),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(s * 20),
                    boxShadow: [BoxShadow(
                      color: navyBlue.withValues(alpha: 0.1),
                      blurRadius: 12, offset: const Offset(0, 4))]),
                  child: Text(translatedQuestion,
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: s * 16,
                      fontWeight: FontWeight.bold,
                      color: navyBlue, height: 1.4))),
                SizedBox(height: s * 10),

                // Answers
                Column(
                  children: List.generate(translatedAnswers.length, (i) {
                    final icon = _icon(i);
                    return Padding(
                      padding: EdgeInsets.only(bottom: s * 10),
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 300),
                        decoration: BoxDecoration(
                          color: _bgColor(i),
                          borderRadius: BorderRadius.circular(s * 14),
                          border: Border.all(
                              color: _borderColor(i), width: 2),
                          boxShadow: [BoxShadow(
                            color: Colors.black.withValues(alpha: 0.05),
                            blurRadius: 6, offset: const Offset(0, 2))]),
                        child: Material(
                          color: Colors.transparent,
                          child: InkWell(
                            borderRadius: BorderRadius.circular(s * 14),
                            onTap: answered ? null : () => onAnswer(i),
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: s * 16, vertical: s * 16),
                              child: Row(children: [
                                Container(
                                  width: s * 28, height: s * 28,
                                  decoration: BoxDecoration(
                                    color: answered
                                        ? _borderColor(i)
                                            .withValues(alpha: 0.15)
                                        : softBlue,
                                    shape: BoxShape.circle),
                                  child: Center(child: Text(
                                    String.fromCharCode(65 + i),
                                    style: TextStyle(
                                      fontSize: s * 12,
                                      fontWeight: FontWeight.bold,
                                      color: answered
                                          ? _borderColor(i)
                                          : navyBlue)))),
                                SizedBox(width: s * 12),
                                Expanded(child: Text(translatedAnswers[i],
                                  style: TextStyle(
                                      fontSize: s * 14,
                                      color: Colors.black87))),
                                if (icon != null) ...[
                                  SizedBox(width: s * 6),
                                  Icon(icon,
                                    color: i == correctAnswerIndex
                                        ? successGreen : errorRed,
                                    size: s * 20),
                                ],
                              ]))))));
                  })),

                // Explanation
                if (answered && translatedExplanation != null) ...[
                  SizedBox(height: s * 8),
                  AnimatedContainer(
                    duration: const Duration(milliseconds: 400),
                    padding: EdgeInsets.symmetric(
                        vertical: s * 12, horizontal: s * 14),
                    decoration: BoxDecoration(
                      color: selectedAnswerIndex == correctAnswerIndex
                          ? successGreen.withValues(alpha: 0.08)
                          : errorRed.withValues(alpha: 0.07),
                      borderRadius: BorderRadius.circular(s * 14),
                      border: Border.all(
                        color: selectedAnswerIndex == correctAnswerIndex
                            ? successGreen.withValues(alpha: 0.4)
                            : errorRed.withValues(alpha: 0.4))),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Icon(
                          selectedAnswerIndex == correctAnswerIndex
                              ? Icons.lightbulb_rounded
                              : Icons.info_outline_rounded,
                          color: selectedAnswerIndex == correctAnswerIndex
                              ? successGreen : errorRed,
                          size: s * 20),
                        SizedBox(width: s * 8),
                        Expanded(child: Text(translatedExplanation,
                          style: TextStyle(fontSize: s * 13,
                            color: Colors.black87, height: 1.4))),
                      ])),
                ],

                // ── Butang Kembali + Seterusnya ──
                if (answered) ...[
                  SizedBox(height: s * 8),
                  IntrinsicHeight(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        // Butang Kembali — Expanded tanpa flex, sama lebar
                        if (canGoBack) ...[
                          Expanded(
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: softBlue,
                                foregroundColor: navyBlue,
                                minimumSize: Size(0, s * 50),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(s * 14),
                                    side: BorderSide(
                                        color: navyBlue.withValues(alpha: 0.3),
                                        width: 1.5)),
                                elevation: 0),
                              onPressed: onPrevious,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(Icons.arrow_back_rounded,
                                      color: navyBlue, size: s * 18),
                                  SizedBox(width: s * 6),
                                  Text(str.soalanSebelumnya,
                                    style: TextStyle(
                                      color: navyBlue,
                                      fontWeight: FontWeight.bold,
                                      fontSize: s * 13)),
                                ]))),
                          SizedBox(width: s * 12),
                        ],

                        // Butang Seterusnya — Expanded tanpa flex, sama lebar
                        Expanded(
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: navyBlue,
                              minimumSize: Size(0, s * 50),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(s * 14)),
                              elevation: 4),
                            onPressed: onNext,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(str.nextQuestion,
                                  style: TextStyle(color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: s * 13)),
                                SizedBox(width: s * 6),
                                Icon(Icons.arrow_forward_rounded,
                                    color: Colors.white, size: s * 18),
                              ]))),
                      ],
                    ),
                  ),
                ],

                // ── Butang Kembali sahaja (sebelum jawab) ──
                if (!answered && canGoBack) ...[
                  SizedBox(height: s * 8),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: TextButton.icon(
                      onPressed: onPrevious,
                      icon: Icon(Icons.arrow_back_rounded,
                          color: navyBlue.withValues(alpha: 0.6),
                          size: s * 16),
                      label: Text(str.soalanSebelumnya,
                        style: TextStyle(
                          color: navyBlue.withValues(alpha: 0.6),
                          fontSize: s * 13,
                          fontWeight: FontWeight.w500)),
                    )),
                ],

                SizedBox(height: s * 16 + bottomInset),
              ],
            ),
          ),
        ),
      ),
    ]);
  }
}