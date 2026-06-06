import 'package:flutter/material.dart';
import 'tajwid_rule.dart';

class TajwidHighlightWidget extends StatelessWidget {
  final String rawText;
  final TajwidRule rule;
  final double fontSize;
  final VoidCallback? onHighlightTapped;

  const TajwidHighlightWidget({
    super.key,
    required this.rawText,
    required this.rule,
    this.fontSize = 22,
    this.onHighlightTapped,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onHighlightTapped,
      child: RichText(
        textDirection: TextDirection.rtl,
        textAlign: TextAlign.right,
        text: TextSpan(
          style: TextStyle(
            fontSize: fontSize,
            height: 1.8,
            color: Colors.black87,
            fontWeight: FontWeight.bold,
            fontFamily: 'Amiri', // ← tambah di sini
          ),
          children: _buildSpans(),
        ),
      ),
    );
  }

  List<TextSpan> _buildSpans() {
    final List<TextSpan> spans = [];
    final regExp = RegExp(r'\{(.*?)\}');
    int lastMatchEnd = 0;

    for (final match in regExp.allMatches(rawText)) {
      // Teks biasa sebelum {}
      if (match.start > lastMatchEnd) {
        spans.add(TextSpan(
          text: rawText.substring(lastMatchEnd, match.start),
          style: const TextStyle(
            color: Colors.black87,
            fontFamily: 'Amiri', // ← tambah di sini
          ),
        ));
      }

      // Teks dalam {} — highlight warna hukum
      spans.add(TextSpan(
        text: match.group(1)!,
        style: TextStyle(
          color: rule.color,
          fontWeight: FontWeight.bold,
          fontFamily: 'Amiri', // ← tambah di sini
        ),
      ));

      lastMatchEnd = match.end;
    }

    // Teks biasa selepas {} terakhir
    if (lastMatchEnd < rawText.length) {
      spans.add(TextSpan(
        text: rawText.substring(lastMatchEnd),
        style: const TextStyle(
          color: Colors.black87,
          fontFamily: 'Amiri', // ← tambah di sini
        ),
      ));
    }

    // Kalau tiada {} langsung
    if (spans.isEmpty) {
      spans.add(TextSpan(
        text: rawText,
        style: const TextStyle(
          color: Colors.black87,
          fontFamily: 'Amiri', // ← tambah di sini
        ),
      ));
    }

    return spans;
  }
}