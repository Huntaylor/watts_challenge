import 'dart:ui';

import 'package:flutter/widgets.dart';

class Shader extends CustomPainter {
  const Shader(this.color, {required this.shader});

  final Color color;
  final FragmentShader shader;

  @override
  void paint(Canvas canvas, Size size) {
    shader
      ..setFloat(0, size.width)
      ..setFloat(0, size.height);
    canvas.drawRect(
      Rect.fromLTWH(0, 0, size.width, size.height),
      Paint()..shader = shader,
    );
  }

  @override
  bool shouldRepaint(Shader oldDelegate) => color != oldDelegate.color;
}
