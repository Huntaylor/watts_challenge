// import 'package:environment_hackaton/bootstrap.dart';
import 'package:environment_hackaton/game/game.dart';
import 'package:flame/flame.dart';
import 'package:flame/game.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

// void main() {
// bootstrap(() => const App());
// }

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Flame.device.fullScreen();

  await Flame.device.setLandscape();

  // runApp(
  //   const App(),
  // );

  final game = WattsChallenge();
  runApp(
    //Bypasses the reset, debug mode will allow hot reset to reset the game
    GameWidget(game: kDebugMode ? WattsChallenge() : game),
  );
}
