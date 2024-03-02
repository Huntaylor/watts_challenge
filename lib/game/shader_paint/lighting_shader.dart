import 'dart:ui' as ui;

import 'package:flutter/material.dart';

class LightingShader extends CustomPainter {
  LightingShader(this.brightness);
  final double brightness; // Value to control brightness (0 = dark, 1 = normal)

  @override
  void paint(Canvas canvas, Size size) {
    const zero = Offset.zero;
    final paint = Paint()
      ..shader = ui.Gradient.linear(
        zero,
        Offset(size.width, size.height),
        [Colors.transparent, Colors.black.withOpacity(1 - brightness)],
      );

    canvas.drawRect(Rect.fromLTWH(0, 0, size.width, size.height), paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
