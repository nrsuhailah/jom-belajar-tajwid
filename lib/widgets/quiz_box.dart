import 'package:flutter/material.dart';

class QuizBox extends StatelessWidget {
  final String letter;

  const QuizBox({super.key, required this.letter});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 28,
      height: 28,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.12),
        borderRadius: BorderRadius.circular(6),
        border: Border.all(color: Colors.white.withValues(alpha: 0.35), width: 1.5),
      ),
      child: Text(
        letter,
        style: const TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.bold,
          color: Color(0xFFC9A84C),
          fontFamily: 'Amiri',
        ),
      ),
    );
  }
}