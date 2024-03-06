import 'package:environment_hackaton/game/entity/hud_buttons/custom_hud_button.dart';
import 'package:flame/components.dart';

class SprintHudButton extends CustomHudButton {
  SprintHudButton({
    required super.player,
    required super.buttonAsset,
    required super.buttonDownAsset,
  }) : super(
          buttonType: HudButtonType.sprint,
          position: Vector2(1120, 460),
        );

  @override
  void Function()? get onReleased {
    player.controllerBehavior.getWalkingState();
    return super.onReleased;
  }

  @override
  void Function()? get onPressed {
    player.controllerBehavior.getSprintState();
    return super.onPressed;
  }
}
