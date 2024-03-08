import 'package:environment_hackaton/game/behaviors/player/player.dart';
import 'package:environment_hackaton/game/entity/player_entity.dart';
import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flame/image_composition.dart';

class JoyStickEntity extends JoystickComponent {
  JoyStickEntity({
    required this.player,
    required this.knobImage,
    required this.backgroundImage,
  }) : super(
          knob: SpriteComponent(
            sprite: Sprite(
              knobImage,
            ),
            size: Vector2.all(120),
          ),
          knobRadius: 64,
          size: 128,
          background: SpriteComponent(
            sprite: Sprite(
              backgroundImage,
            ),
            size: Vector2.all(260),
          ),
          position: Vector2(150, 520),
          anchor: Anchor.center,
        );
  final Image knobImage;
  final Image backgroundImage;
  final Player player;

  @override
  bool onDragEnd(DragEndEvent _) {
    player.controllerBehavior.setMovementState(
      isMoving: false,
    );
    return super.onDragEnd(_);
  }

  @override
  bool onDragUpdate(DragUpdateEvent event) {
    player.controllerBehavior.setMovementState(
      isMoving: true,
    );
    switch (direction) {
      case JoystickDirection.left:
        player.directionState = DirectionState.left;
      case JoystickDirection.right:
        player.directionState = DirectionState.right;
      case JoystickDirection.down:
        player.directionState = DirectionState.down;
      case JoystickDirection.up:
        player.directionState = DirectionState.up;
      case JoystickDirection.idle:
      case JoystickDirection.upLeft:
      case JoystickDirection.upRight:
      case JoystickDirection.downRight:
      case JoystickDirection.downLeft:
        break;
    }
    return super.onDragUpdate(event);
  }
}
