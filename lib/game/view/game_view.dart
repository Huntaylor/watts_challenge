import 'package:environment_hackaton/game/game.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';

class MyGame extends StatelessWidget {
  const MyGame({super.key});

  static PageRoute<void> route() {
    return PageRouteBuilder(
      pageBuilder: (_, __, ___) => const MyGame(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      builder: (context, child) => const GameView(),
      theme: ThemeData(fontFamily: 'Pixel'),
    );
  }
}

class GameView extends StatelessWidget {
  const GameView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          GameWidget<WattsChallenge>.controlled(
            gameFactory: WattsChallenge.new,
            overlayBuilderMap: {},
          ),
        ],
      ),
    );
  }
}
