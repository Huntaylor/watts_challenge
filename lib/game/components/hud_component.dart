import 'dart:async';

import 'package:flame/components.dart';
import 'package:flame/input.dart';

enum DpadPositionState {
  middle,
  up,
  down,
  left,
  right,
}

class DpadComponent extends HudButtonComponent {
  DpadComponent({
    required this.dpadSprite,
    required this.dpadState,
    super.position,
    super.size,
    super.priority,
    super.buttonDown,
    super.onPressed,
    super.onReleased,
  }) : super(anchor: Anchor.topLeft, button: dpadSprite);

  final SpriteComponent dpadSprite;
  final DpadPositionState dpadState;
}

class DpadSprite extends SpriteComponent {
  DpadSprite({
    super.sprite,
    super.size,
    super.position,
  }) : super(
          anchor: Anchor.topLeft,
        );

  @override
  FutureOr<void> onLoad() {
    _loadAssets();
    return super.onLoad();
  }

  void _loadAssets() {}
}
