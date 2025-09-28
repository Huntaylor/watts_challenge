import 'package:app_ui/app_ui.dart';
import 'package:environment_hackaton/app/view/main_menu.dart';
import 'package:flame_splash_screen/flame_splash_screen.dart';
import 'package:flutter/material.dart';

class FlameSplashView extends StatelessWidget {
  const FlameSplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FlameSplashScreen(
        theme: FlameSplashTheme.white,
        showBefore: (context) {
          return Text(
            'Get Gaming Under Development',
            style: WattsChallengeTextStyle.caption,
          );
        },
        onFinish: (context) => Navigator.of(context).push(
          MaterialPageRoute<void>(
            builder: (context) => const MainMenu(),
          ),
        ),
      ),
    );
  }
}
