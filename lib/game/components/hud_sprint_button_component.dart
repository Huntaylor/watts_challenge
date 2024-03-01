import 'package:environment_hackaton/game/behaviors/hud_drag_behavior.dart';
import 'package:environment_hackaton/game/entity/player.dart';
import 'package:environment_hackaton/game/watts_challenge.dart';
import 'package:flame/components.dart';
import 'package:flame/image_composition.dart';
import 'package:flame/input.dart';
import 'package:flame_behaviors/flame_behaviors.dart';

enum HudButtonType {
  interact,
  sprint,
}

class CustomHudButtonComponent extends HudButtonComponent with EntityMixin {
  CustomHudButtonComponent({
    required this.player,
    required this.buttonType,
    required this.buttonAsset,
    required this.buttonDownAsset,
    super.position,
    super.size,
    super.priority,
    super.onPressed,
    super.onReleased,
  }) : super(
          anchor: Anchor.center,
          button: CustomButtonSprite(
            sprite: Sprite(
              buttonAsset,
            ),
            size: size,
          ),
          buttonDown: CustomButtonSprite(
            sprite: Sprite(
              buttonDownAsset,
            ),
            size: size,
          ),
        );
  final Player player;
  final Image buttonDownAsset;
  final Image buttonAsset;
  final HudButtonType buttonType;

  late final HudDragBehavior dragBehavior = findBehavior<HudDragBehavior>();

  @override
  Future<void> onLoad() {
    add(HudDragBehavior());
    return super.onLoad();
  }

  @override
  void Function()? get onPressed {
    switch (buttonType) {
      case HudButtonType.interact:
        player.controllerBehavior.getInteraction(isInteracting: true);
      case HudButtonType.sprint:
        player.controllerBehavior.getSprintState();
    }
    return super.onPressed;
  }

  @override
  void Function()? get onReleased {
    switch (buttonType) {
      case HudButtonType.interact:
        player.controllerBehavior.getInteraction(isInteracting: false);
      case HudButtonType.sprint:
        player.controllerBehavior.getWalkingState();
    }
    return super.onReleased;
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
