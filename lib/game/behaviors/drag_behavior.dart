import 'dart:async';

import 'package:environment_hackaton/game/entity/hud_entity.dart';
import 'package:environment_hackaton/game/game.dart';
import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flame_behaviors/flame_behaviors.dart';

class DragBehavior extends Behavior<DpadEntity>
    with DragCallbacks, HasGameRef<WattsChallenge> {
  DragBehavior({required this.size}) : super();

  final Vector2 size;

  @override
  FutureOr<void> onLoad() {
    debugMode = true;
    parent.debugMode = true;
    return super.onLoad();
  }

  @override
  void onDragUpdate(DragUpdateEvent event) {
    final details = event.localDelta;
    //Not within the bounds?

    /*  if (_isWithinButtonBounds(details)) {
      print('im inside!');
      parent.onPressed!();
    } else  */
    if (!_isWithinButtonBounds(details)) {
      parent.onReleased;
    }

    // final buttons = gameRef.hudComponents;
    // // print(buttons);

    // for (final button in buttons) {
    //   if (button.stateBehavior._isWithinButtonBounds(details)) {
    //     print('true');
    //     button.onPressed!();
    //   } else {
    //     print('false');
    //   }
    // }
    super.onDragUpdate(event);
  }

  bool _isWithinButtonBounds(Vector2 touchPosition) {
    return touchPosition.x >= parent.position.x &&
        touchPosition.x <= parent.position.x + parent.width &&
        touchPosition.y >= parent.position.y &&
        touchPosition.y <= parent.position.y + parent.height;
  }
}
