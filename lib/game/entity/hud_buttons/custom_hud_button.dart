import 'dart:async';

import 'package:environment_hackaton/game/behaviors/hud_drag_behavior.dart';
import 'package:environment_hackaton/game/entity/player_entity.dart';
import 'package:environment_hackaton/game/watts_challenge.dart';
import 'package:flame/components.dart';
import 'package:flame/image_composition.dart';
import 'package:flame/input.dart';
import 'package:flame_behaviors/flame_behaviors.dart';

enum HudButtonType {
  interact,
  sprint,
}

class CustomHudButton extends HudButtonComponent with EntityMixin {
  CustomHudButton({
    required this.player,
    required this.buttonType,
    required this.buttonAsset,
    required this.buttonDownAsset,
    super.position,
    super.scale,
    super.priority,
    super.onPressed,
    super.onReleased,
  }) : super(
          anchor: Anchor.center,
          button: CustomButtonSprite(
            sprite: Sprite(
              buttonAsset,
            ),
            size: Vector2(147, 123),
          ),
          buttonDown: CustomButtonSprite(
            sprite: Sprite(
              buttonDownAsset,
            ),
            size: Vector2(147, 123),
          ),
        );
  final Player player;
  final Image buttonDownAsset;
  final Image buttonAsset;
  final HudButtonType buttonType;

  late final HudDragBehavior dragBehavior = findBehavior<HudDragBehavior>();

  @override
  FutureOr<void> onLoad() {
    add(HudDragBehavior());
    return super.onLoad();
  }
}

class CustomButtonSprite extends SpriteComponent
    with HasGameRef<WattsChallenge> {
  CustomButtonSprite({
    super.sprite,
    super.size,
    super.position,
  }) : super(
          anchor: Anchor.topLeft,
        );
}
