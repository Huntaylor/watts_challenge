import 'dart:async';

import 'package:environment_hackaton/game/watts_challenge.dart';
import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flutter/services.dart';

enum PlayerState {
  idleForward,
  idleBack,
  idleLeft,
  idleRight,
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
          anchor: Anchor.topLeft,
          priority: 1,
          size: Vector2(14, 18),
        );

  late final SpriteAnimation forwardAnimation;
  late final SpriteAnimation idleBackAnimation;
  late final SpriteAnimation idleLeftAnimation;
  late final SpriteAnimation idleRightAnimation;
  late final SpriteAnimation forwardReallyAnimation;
  late final SpriteAnimation backAnimation;
  late final SpriteAnimation leftAnimation;
  late final SpriteAnimation rightAnimation;
  late final SpriteAnimation idleForwardAnimation;
  late final SpriteAnimation idleReallyAnimation;
  late RectangleHitbox hitbox;
  late PlayerState playerState;

  final Vector2 _direction = Vector2.zero();

  final double stepTime = 0.5;
  double fixedDeltaTime = 1 / 60;
  double accumulatedTime = 0;
  double moveSpeed = 50;
  double horizontalMovement = 0;
  double verticalMovement = 0;

  @override
  FutureOr<void> onLoad() {
    _loadAllAnimations();
    playerState = PlayerState.idleForward;
    return super.onLoad();
  }

  @override
  void update(double dt) {
    final displacement = _direction.normalized() * moveSpeed * dt;

    position.add(displacement);

    super.update(dt);
  }

  @override
  bool onKeyEvent(KeyEvent event, Set<LogicalKeyboardKey> keysPressed) {
    horizontalMovement = 0;
    final isKeyRepeat = event is KeyRepeatEvent;
    final isKeyDown = event is KeyDownEvent;

    if (!isKeyRepeat) {
      if (event.logicalKey == LogicalKeyboardKey.keyA) {
        _direction.x += isKeyDown ? -1 : 1;
      } else if (event.logicalKey == LogicalKeyboardKey.keyD) {
        _direction.x += isKeyDown ? 1 : -1;
      } else if (event.logicalKey == LogicalKeyboardKey.keyW) {
        _direction.y += isKeyDown ? -1 : 1;
      } else if (event.logicalKey == LogicalKeyboardKey.keyS) {
        _direction.y += isKeyDown ? 1 : -1;
      } else if (event.logicalKey == LogicalKeyboardKey.shiftLeft) {
        moveSpeed = isKeyDown ? 150 : 50;
      }
    }
    return super.onKeyEvent(event, keysPressed);
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
    idleForwardAnimation = _spriteAnimation(
      // animationPath: Assets.images.player.idle.path,
      animationPath: 'player/idle-sheet.png',
      amount: 2,
    );
    idleReallyAnimation = _spriteAnimation(
      // animationPath: Assets.images.player.reallyIdle.path,
      animationPath: 'player/reallyIdle.png',
      amount: 2,
    );
    idleBackAnimation = _spriteAnimation(
      // animationPath: Assets.images.player.idle.path,
      animationPath: 'player/idle_back.png',
      amount: 2,
    );
    idleRightAnimation = _spriteAnimation(
      // animationPath: Assets.images.player.idle.path,
      animationPath: 'player/player_idle_right.png',
      amount: 2,
    );
    idleLeftAnimation = _spriteAnimation(
      // animationPath: Assets.images.player.reallyIdle.path,
      animationPath: 'player/player_idle_left.png',
      amount: 2,
    );

    // List of all animations
    animations = {
      PlayerState.idleForward: idleForwardAnimation,
      PlayerState.idleBack: idleBackAnimation,
      PlayerState.idleLeft: idleLeftAnimation,
      PlayerState.idleRight: idleRightAnimation,
      PlayerState.reallyForward: forwardReallyAnimation,
      PlayerState.reallyIdle: idleReallyAnimation,
      PlayerState.walkingBack: backAnimation,
      PlayerState.walkingForward: forwardAnimation,
      PlayerState.walkingLeft: leftAnimation,
      PlayerState.walkingRight: rightAnimation,
    };

    // Set current animationdw
    current = PlayerState.idleForward;
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
