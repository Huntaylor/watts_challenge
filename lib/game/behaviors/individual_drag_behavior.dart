import 'package:environment_hackaton/game/entity/hud_entity.dart';
import 'package:environment_hackaton/game/game.dart';
import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flame_behaviors/flame_behaviors.dart';

class IndividualDragBehavior extends Behavior<IndividualDpadEntity>
    with DragCallbacks, HasGameRef<WattsChallenge> {
  IndividualDragBehavior({this.dpadEntities});

  final List<IndividualDpadEntity>? dpadEntities;

  @override
  void onDragUpdate(DragUpdateEvent event) {
    final details = event.parentContext;

    print(details);

    if (!isWithinButtonBounds(
      details!.start,
      parent,
    )) {
      // print(isWithinButtonBounds(details, parent));
      parent.onReleased;
    } else {
      if (parent.onPressed != null) {
        parent.onPressed!();
      }
    }

    if (dpadEntities != null) {
      final buttons = dpadEntities;

      for (final button in buttons!) {
        if (button.stateBehavior.isWithinButtonBounds(details.start, button)) {
          button.onPressed!();
        }
      }
    }
    super.onDragUpdate(event);
  }

  bool isWithinButtonBounds(
    Vector2 touchPosition,
    IndividualDpadEntity button,
  ) {
    return touchPosition.x >= 0 &&
        touchPosition.x <= button.width &&
        touchPosition.y >= 0 &&
        touchPosition.y <= button.height;
  }
}
