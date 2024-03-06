import 'dart:async';
import 'dart:ui';

import 'package:environment_hackaton/game/watts_challenge.dart';
import 'package:environment_hackaton/utils/asset_const.dart';
import 'package:flame/components.dart';

class ShaderComponent extends PositionComponent
    with HasGameRef<WattsChallenge> {
  ShaderComponent({required this.uniforms, super.position})
      : super(anchor: Anchor.center);
  late FragmentShader _shader;
  final Map<String, dynamic> uniforms;

  Future<void> _loadShader() async {
    final program = await FragmentProgram.fromAsset(
      AssetConst.darkeningShader,
    );

    _shader = program.fragmentShader();
  }

  @override
  void render(Canvas canvas) {
    final rect = toRect();
    final paintShader = Paint()..shader = _shader;
    canvas.drawRect(rect, paintShader);
  }

  @override
  FutureOr<void> onLoad() {
    _loadShader();
    debugMode = true;
    return super.onLoad();
  }

  @override
  void onRemove() {
    _shader.dispose();
    super.onRemove();
  }
}
