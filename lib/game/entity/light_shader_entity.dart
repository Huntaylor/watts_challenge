import 'dart:async';

import 'package:environment_hackaton/utils/app_library.dart';
import 'package:flame/components.dart';
import 'package:flutter_shaders/flutter_shaders.dart';

class LightShaderEntity extends PositionComponent {
  LightShaderEntity({
    required this.shader,
    super.position,
    super.anchor,
    super.size,
    super.priority,
  });
  late ValueNotifier<bool> isLightOn;
  final FragmentShader shader;

  late Size shaderSize;

  @override
  FutureOr<void> onLoad() {
    shaderSize = Size(width, height);

    return super.onLoad();
  }

  @override
  void render(Canvas canvas) {
    shader.setFloatUniforms((value) {
      value
        ..setSize(shaderSize)
        ..setFloats(Float32List.fromList([.5, .5]))
        ..setFloat(0) // Set the lights (transparency)
        ..setFloat(.9); // Set the strength of the darkness
    });
    canvas.drawRect(
      Rect.fromLTWH(0, 0, size.x, size.y),
      Paint()..shader = shader,
    );
  }
}
