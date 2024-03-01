import 'package:environment_hackaton/game/components/hud_sprint_button_component.dart';
import 'package:environment_hackaton/game/game.dart';
import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flame_behaviors/flame_behaviors.dart';

class HudDragBehavior extends Behavior<CustomHudButtonComponent>
    with DragCallbacks, HasGameRef<WattsChallenge>, EntityMixin {
  HudDragBehavior();

  @override
  void onDragUpdate(DragUpdateEvent event) {
    final details = event.parentContext;

    if (!isWithinButtonBounds(
      details!.start,
    )) {
      parent.onReleased;
    } else {}

    super.onDragUpdate(event);
  }

  bool isWithinButtonBounds(
    Vector2 touchPosition,
  ) {
    return touchPosition.x >= 0 &&
        touchPosition.x <= parent.width &&
        touchPosition.y >= 0 &&
        touchPosition.y <= parent.height;
  }
}
