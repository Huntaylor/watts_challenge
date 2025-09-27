import 'package:environment_hackaton/game/entity/hud_buttons/custom_hud_button.dart';
import 'package:environment_hackaton/game/game.dart';
import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flame_behaviors/flame_behaviors.dart';

class HudDragBehavior extends Behavior<CustomHudButton>
    with DragCallbacks, HasGameReference<WattsChallenge> {
  HudDragBehavior();

  @override
  void onDragUpdate(DragUpdateEvent event) {
    final details = event.parentContext;

    if (!isWithinButtonBounds(
      details!.start,
    )) {
      if (parent.onReleased != null) {
        parent.onReleased?.call();
      }
    }

    super.onDragUpdate(event);
  }

  @override
  void onDragEnd(DragEndEvent event) {
    if (parent.onReleased != null) {
      parent.onReleased?.call();
    }
    super.onDragEnd(event);
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
