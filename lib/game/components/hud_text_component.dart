import 'dart:async';

import 'package:flame/components.dart';
import 'package:google_fonts/google_fonts.dart';

class HudText extends TextComponent {
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
    textRenderer = TextPaint(
      style: GoogleFonts.pixelifySans(),
    );
    text = remainingTime.toString();
    countDown = Timer(
      1,
      repeat: true,
      onTick: () {
        if (remainingTime > 0) {
          remainingTime -= 1;
        }
      },
    );
    return super.onLoad();
  }

  @override
  void update(double dt) {
    super.update(dt);

    if (timerStarted && remainingTime > 0) {
      countDown.update(dt);
    }
  }
}
