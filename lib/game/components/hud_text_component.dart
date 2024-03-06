import 'dart:async';

import 'package:app_ui/app_ui.dart';
import 'package:environment_hackaton/game/game.dart';
import 'package:flame/components.dart';

class HudText extends TextComponent with HasGameRef<WattsChallenge> {
  HudText({
    required super.size,
    super.position,
    super.textRenderer,
  });

  late Timer countDown;
  int remainingTime = 30;
  bool timerStarted = false;

  @override
  FutureOr<void> onLoad() {
    // remainingTime = gameRef.gameState.asStarting.gameTimer;

    textRenderer = TextPaint(style: WattsChallengeTextStyle.headline1);
    countDown = Timer(
      1,
      repeat: true,
      onTick: () {
        if (remainingTime > 0) {
          remainingTime -= 1;
        }
      },
    );

    startTimer();
    return super.onLoad();
  }

  @override
  void update(double dt) {
    super.update(dt);

    if (timerStarted && remainingTime > 0) {
      countDown.update(dt);
    }
    text = remainingTime.toString();
  }

  void startTimer() {
    timerStarted = true;
    countDown.start();
  }

  void stopTimer() {
    timerStarted = false;
    countDown.stop();
  }

  void resetTimer() {
    timerStarted = false;
    countDown.stop();
    remainingTime = 30; // Set the initial value here
    text = remainingTime.toString();
  }
}
