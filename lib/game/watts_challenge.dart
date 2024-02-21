import 'package:flame/game.dart';
import 'package:flutter/painting.dart';

class WattsChallenge extends FlameGame {
  WattsChallenge(
      // required this.l10n,
      // required this.effectPlayer,
      // required this.textStyle,
      ) {
    images.prefix = '';
  }

  // final AppLocalizations l10n;

  // final AudioPlayer effectPlayer;

  // final TextStyle textStyle;

  @override
  Color backgroundColor() => const Color.fromARGB(255, 1, 0, 52);

  @override
  Future<void> onLoad() async {}
}
