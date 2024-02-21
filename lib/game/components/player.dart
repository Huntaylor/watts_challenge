import 'dart:async';

import 'package:environment_hackaton/game/watts_challenge.dart';
import 'package:environment_hackaton/gen/assets.gen.dart';
import 'package:flame/collisions.dart';
import 'package:flame/components.dart';

enum PlayerState {
  idle,
  reallyForward,
  reallyIdle,
  walkingBack,
  walkingForward,
  walkingLeft,
  walkingRight,
}

class Player extends SpriteAnimationGroupComponent<PlayerState>
    with HasGameRef<WattsChallenge>, KeyboardHandler {
  Player({super.position, super.current})
      : super(
          anchor: Anchor.center,
          priority: 1,
          size: Vector2(14, 18),
        );

  late final SpriteAnimation forwardAnimation;
  late final SpriteAnimation forwardReallyAnimation;
  late final SpriteAnimation backAnimation;
  late final SpriteAnimation leftAnimation;
  late final SpriteAnimation rightAnimation;
  late final SpriteAnimation idleAnimation;
  late final SpriteAnimation idleReallyAnimation;
  late RectangleHitbox hitbox;
  late PlayerState playerState;

  final double stepTime = 0.05;

  @override
  FutureOr<void> onLoad() {
    _loadAllAnimations();
    playerState = PlayerState.idle;
    return super.onLoad();
  }

  void _loadAllAnimations() {
    forwardAnimation = _spriteAnimation(
      // animationPath: Assets.images.player.walkingForward.path,
      animationPath: 'player/walkingForward.png',
      amount: 4,
    );

    forwardReallyAnimation = _spriteAnimation(
      // animationPath: Assets.images.player.reallyForward.path,
      animationPath: 'player/reallyForward.png',
      amount: 4,
    );
    backAnimation = _spriteAnimation(
      // animationPath: Assets.images.player.walkingBack.path,
      animationPath: 'player/walkingBack.png',
      amount: 4,
    );
    leftAnimation = _spriteAnimation(
      // animationPath: Assets.images.player.walkingLeft.path,
      animationPath: 'player/walkingLeft.png',
      amount: 4,
    );
    rightAnimation = _spriteAnimation(
      // animationPath: Assets.images.player.walkingRight.path,
      animationPath: 'player/walkingRight.png',
      amount: 4,
    );
    idleAnimation = _spriteAnimation(
      // animationPath: Assets.images.player.idle.path,
      animationPath: 'player/idle.png',
      amount: 2,
    );
    idleReallyAnimation = _spriteAnimation(
      // animationPath: Assets.images.player.reallyIdle.path,
      animationPath: 'player/reallyIdle.png',
      amount: 2,
    );

    // List of all animations
    animations = {
      PlayerState.idle: idleAnimation,
      PlayerState.reallyForward: forwardReallyAnimation,
      PlayerState.reallyIdle: idleReallyAnimation,
      PlayerState.walkingBack: backAnimation,
      PlayerState.walkingForward: forwardAnimation,
      PlayerState.walkingLeft: leftAnimation,
      PlayerState.walkingRight: rightAnimation,
    };

    // Set current animation
    current = PlayerState.idle;
  }

  SpriteAnimation _spriteAnimation({
    required String animationPath,
    required int amount,
  }) {
    return SpriteAnimation.fromFrameData(
      game.images.fromCache(animationPath),
      SpriteAnimationData.sequenced(
        amount: amount,
        stepTime: stepTime,
        textureSize: size,
      ),
    );
  }
}
