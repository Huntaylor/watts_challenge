import 'package:environment_hackaton/utils/asset_const.dart';
import 'package:flutter/material.dart';

class GameBackground extends StatelessWidget {
  const GameBackground({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: Image.asset(
        AssetConst.background,
        fit: BoxFit.cover,
      ),
    );
  }
}
