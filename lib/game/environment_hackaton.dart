import 'package:audioplayers/audioplayers.dart';
import 'package:environment_hackaton/l10n/l10n.dart';
import 'package:flame/game.dart';
import 'package:flutter/painting.dart';

class EnvironmentHackaton extends FlameGame {
  EnvironmentHackaton({
    required this.l10n,
    required this.effectPlayer,
    required this.textStyle,
  }) {
    images.prefix = '';
  }

  final AppLocalizations l10n;

  final AudioPlayer effectPlayer;

  final TextStyle textStyle;

  int counter = 0;

  @override
  Color backgroundColor() => const Color(0xFF2A48DF);

  @override
  Future<void> onLoad() async {}
}
