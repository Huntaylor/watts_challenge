import 'dart:async';

import 'package:environment_hackaton/game/components/shader_component.dart';
import 'package:environment_hackaton/utils/app_library.dart';
import 'package:flame/components.dart';

class LightShaderEntity extends PositionComponent {
  LightShaderEntity({
    super.position,
    super.anchor,
    super.size,
  });
  late ValueNotifier<bool> isLightOn;

  late ShaderComponent shaderComponent;

  @override
  FutureOr<void> onLoad() {
    priority = 25;
    shaderComponent = ShaderComponent(
      uniforms: {
        'lightPosition':
            Float32List.fromList([0.5, 0.5]), // Set the light position
        'lightRadius': 0.3, // Set the light radius
        'darkness': 0.0, // Set the initial darkness level (0.0 = no darkness)
      },
    );

    isLightOn = ValueNotifier(false);
    return super.onLoad();
  }

  @override
  void update(double dt) {
    shaderComponent.uniforms['darkness'] = isLightOn.value ? 0.0 : 1.0;
    super.update(dt);
  }
}
