import 'package:environment_hackaton/game/behaviors/hud_drag_behavior.dart';
import 'package:environment_hackaton/game/entity/player.dart';
import 'package:environment_hackaton/game/watts_challenge.dart';
import 'package:flame/components.dart';
import 'package:flame/effects.dart';
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

  late OpacityEffect disabledEffect;
  late OpacityEffect enabledEffect;

  late bool isDisabled;

  late final HudDragBehavior dragBehavior = findBehavior<HudDragBehavior>();

  @override
  Future<void> onLoad() {
    disabledEffect = OpacityEffect.to(
      0.3,
      EffectController(duration: 0.1),
    );
    enabledEffect = OpacityEffect.fadeIn(
      EffectController(duration: 0.1),
    );
    isDisabled = !player.isWithinRange;
    if (buttonType == HudButtonType.interact) {
      button!.add(disabledEffect);
    }
    add(HudDragBehavior());
    return super.onLoad();
  }

  @override
  void update(double dt) {
    isDisabled = !player.isWithinRange;

    if (isDisabled && buttonType == HudButtonType.interact) {
      disabledEffect.reset();
      button!.add(disabledEffect);
    }
    if (!isDisabled && buttonType == HudButtonType.interact) {
      enabledEffect.reset();
      button!.add(enabledEffect);
    }

    super.update(dt);
  }

  @override
  void Function()? get onPressed {
    if (isDisabled && buttonType == HudButtonType.interact) {
      return null;
    } else {
      switch (buttonType) {
        case HudButtonType.interact:
          player.controllerBehavior.getInteraction(true);
        case HudButtonType.sprint:
          player.controllerBehavior.getSprintState();
      }
      return super.onPressed;
    }
  }

  @override
  void Function()? get onReleased {
    if (isDisabled && buttonType == HudButtonType.interact) {
      return null;
    } else {
      switch (buttonType) {
        case HudButtonType.interact:
          player.controllerBehavior.getInteraction(false);
        case HudButtonType.sprint:
          player.controllerBehavior.getWalkingState();
      }
      return super.onReleased;
    }
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
