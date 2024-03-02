import 'dart:async';

import 'package:environment_hackaton/game/game.dart';
import 'package:flame/components.dart';

class LightSwitchComponent extends SpriteComponent
    with HasGameRef<WattsChallenge> {
  LightSwitchComponent() {
    // Set the initial sprite to the on state
    sprite = onSprite;
  }
  bool isOn = true; // Initially, the light switch is on

  // Define the sprites for the light switch in its on and off states
  late Sprite onSprite;
  late Sprite offSprite;

  @override
  FutureOr<void> onLoad() {
    onSprite = Sprite(
      game.images.fromCache('interactables/light_switch_off.png'),
    );
    offSprite = Sprite(
      game.images.fromCache('interactables/light_switch_off.png'),
    );

    return super.onLoad();
  }

  // Toggle the state of the light switch
  void toggle() {
    isOn = !isOn;
    sprite = isOn ? onSprite : offSprite;
  }

  // @override
  // void render(Canvas canvas) {
  //   super.render(canvas);
  //   // Render additional effects or animations if needed
  // }

  // @override
  // void update(double dt) {
  //   super.update(dt);
  //   // Update any animations or effects if needed
  // }
}
