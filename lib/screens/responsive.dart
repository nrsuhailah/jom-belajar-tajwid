import 'package:flutter/material.dart';

class R {
  static late double _width;
  static late double _height;

  static void init(BuildContext context) {
    final mq = MediaQuery.of(context);
    _width  = mq.size.width;
    _height = mq.size.height;
  }

  // Baseline: Pixel 4 = 393 x 851
  static double get w => _width;
  static double get h => _height;

  // Scale font ikut screen width
  static double fs(double size) =>
      (size * _width / 393).clamp(size * 0.82, size * 1.18);

  // Scale padding/spacing/height ikut screen
  static double sp(double size) =>
      (size * _width / 393).clamp(size * 0.80, size * 1.20);

  // Scale ikut height (untuk vertical spacing)
  static double hp(double size) =>
      (size * _height / 851).clamp(size * 0.80, size * 1.20);

  // Icon size
  static double icon(double size) =>
      (size * _width / 393).clamp(size * 0.85, size * 1.15);

  // Grid column ikut screen
  static int get gridCols => _width > 600 ? 4 : 3;
  static bool get isTablet => _width > 600;
}