import 'dart:async';

import 'package:environment_hackaton/utils/app_library.dart';
import 'package:flame/components.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_shaders/flutter_shaders.dart';

class LightShaderEntity extends PositionComponent {
  LightShaderEntity({
    required this.shader,
    required this.location,
    super.position,
    super.anchor,
    super.size,
    super.key,
    super.priority,
  });
  final FragmentShader shader;
  final String location;

  late double lightDoub;
  late ValueNotifier<bool> isLightOn;

  late Size shaderSize;

  @override
  FutureOr<void> onLoad() {
    shaderSize = Size(width, height);
    isLightOn = ValueNotifier(true);
    lightDoub = 1;
    isLightOn.addListener(() {
      if (isLightOn.value) {
        lightDoub = 1;
      } else {
        lightDoub = 0;
      }
    });
    return super.onLoad();
  }

  @override
  void render(Canvas canvas) {
    shader.setFloatUniforms((value) {
      value
        ..setSize(shaderSize)
        ..setFloats(Float32List.fromList([.5, .5]))
        ..setFloat(lightDoub) // Set the lights (transparency)
        ..setFloat(.9); // Set the strength of the darkness
    });
    canvas.drawRect(
      Rect.fromLTWH(0, 0, size.x, size.y),
      Paint()..shader = shader,
    );
  }
}
