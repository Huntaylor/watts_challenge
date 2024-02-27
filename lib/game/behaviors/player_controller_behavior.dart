import 'package:environment_hackaton/game/components/player.dart';
import 'package:flame/components.dart';
import 'package:flame_behaviors/flame_behaviors.dart';
import 'package:flutter/services.dart';

class PlayerControllerBehavior extends Behavior<Player>
    with KeyboardHandler, HasGameRef {
  PlayerControllerBehavior({
    this.speed = 200,
  });
  final int speed;

  @override
  void update(double dt) {
    // TODO: implement update
    super.update(dt);
  }

  @override
  bool onKeyEvent(KeyEvent event, Set<LogicalKeyboardKey> keysPressed) {
    return super.onKeyEvent(event, keysPressed);
  }
}
