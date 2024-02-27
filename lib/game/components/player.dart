import 'dart:async';

import 'package:environment_hackaton/game/components/utils.dart';
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

enum DirectionState {
  left,
  right,
  forward,
  back,
}

class Player extends SpriteAnimationGroupComponent<PlayerState>
    with HasGameRef<WattsChallenge>, KeyboardHandler {
  Player({super.position, super.current})
      : super(
          anchor: Anchor.topLeft,
          priority: 1,
          // size: Vector2(14, 18),
          size: Vector2(65, 72),
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
  late DirectionState directionState;

  late bool isWalkingLeft;
  late bool isWalkingRight;
  late bool isWalkingForward;
  late bool isWalkingBack;

  final Vector2 _direction = Vector2.zero();

  double stepTime = 0.5;
  double walkingStepTime = 0.15;
  double fixedDeltaTime = 1 / 60;
  double accumulatedTime = 0;
  double moveSpeed = 200;
  double horizontalMovement = 0;
  double verticalMovement = 0;

  @override
  FutureOr<void> onLoad() {
    hitbox = RectangleHitbox(
      size: size,
      isSolid: true,
    );
    add(hitbox);
    _loadAllAnimations();
    playerState = PlayerState.idleForward;
    directionState = DirectionState.forward;
    isWalkingForward = true;
    return super.onLoad();
  }

  @override
  void update(double dt) {
    final displacement = _direction.normalized() * moveSpeed * dt;

    position.add(displacement);

    _checkHorizontalCollisions();
    _checkVerticalCollisions();

    super.update(dt);
  }

  @override
  bool onKeyEvent(KeyEvent event, Set<LogicalKeyboardKey> keysPressed) {
    final isKeyRepeat = event is KeyRepeatEvent;
    final isKeyDown = event is KeyDownEvent;

    if (!isKeyRepeat) {
      if (!isKeyDown) {
        if (event.logicalKey == LogicalKeyboardKey.keyA ||
            event.logicalKey == LogicalKeyboardKey.keyD) {
          if (event.logicalKey == LogicalKeyboardKey.keyA) {
            _setAnimation(DirectionState.left, isMoving: false);
          } else {
            _setAnimation(DirectionState.right, isMoving: false);
          }
          _direction.x = 0;
        } else if (event.logicalKey == LogicalKeyboardKey.keyW ||
            event.logicalKey == LogicalKeyboardKey.keyS) {
          if (event.logicalKey == LogicalKeyboardKey.keyW) {
            _setAnimation(DirectionState.back, isMoving: false);
          } else {
            _setAnimation(DirectionState.forward, isMoving: false);
          }
          _direction.y = 0;
        }
      } else {
        // Detect movement keys
        if (event.logicalKey == LogicalKeyboardKey.keyA ||
            event.logicalKey == LogicalKeyboardKey.keyD) {
          if (event.logicalKey == LogicalKeyboardKey.keyA) {
            _setAnimation(DirectionState.left, isMoving: true);
          } else {
            _setAnimation(DirectionState.right, isMoving: true);
          }
          _direction
            ..x = event.logicalKey == LogicalKeyboardKey.keyA ? -1 : 1
            ..y = 0; // Disable vertical movement
        } else if (event.logicalKey == LogicalKeyboardKey.keyW ||
            event.logicalKey == LogicalKeyboardKey.keyS) {
          if (event.logicalKey == LogicalKeyboardKey.keyW) {
            _setAnimation(DirectionState.back, isMoving: true);
          } else {
            _setAnimation(DirectionState.forward, isMoving: true);
          }
          _direction
            ..y = event.logicalKey == LogicalKeyboardKey.keyW ? -1 : 1
            ..x = 0; // Disable horizontal movement
        }
      }

      // Handle other keys like shiftLeft
      if (event.logicalKey == LogicalKeyboardKey.shiftLeft) {
        moveSpeed = isKeyDown ? 350 : 200;
        walkingStepTime += isKeyDown ? 0.10 : 0.15;
      }
    }

    return super.onKeyEvent(event, keysPressed);
  }

  Future<void> _loadAllAnimations() async {
    forwardAnimation = await _spriteAnimation(
      // animationPath: Assets.images.player.walkingForward.path,
      animationPath: 'player/upscaled/walking_forward_upscaled.png',
      jsonData: await gameRef.assets
          .readJson('images/player/upscaled/json/walking_forward.json'),
    );
    forwardReallyAnimation = await _spriteAnimation(
      // animationPath: Assets.images.player.reallyForward.path,
      animationPath: 'player/upscaled/really_face_walking_upscaled.png',
      jsonData: await gameRef.assets.readJson(
        'images/player/upscaled/json/walking_really_face.json',
      ),
    );
    backAnimation = await _spriteAnimation(
      // animationPath: Assets.images.player.walkingBack.path,
      animationPath: 'player/upscaled/walking_back_upscaled.png',
      jsonData: await gameRef.assets.readJson(
        'images/player/upscaled/json/walking_back.json',
      ),
    );
    leftAnimation = await _spriteAnimation(
      // animationPath: Assets.images.player.walkingLeft.path,
      animationPath: 'player/upscaled/walking_left_upscaled.png',
      jsonData: await gameRef.assets.readJson(
        'images/player/upscaled/json/walking_left.json',
      ),
    );
    rightAnimation = await _spriteAnimation(
      // animationPath: Assets.images.player.walkingRight.path,
      animationPath: 'player/upscaled/walking_right_upscaled.png',
      jsonData: await gameRef.assets.readJson(
        'images/player/upscaled/json/walking_right.json',
      ),
    );
    idleForwardAnimation = await _spriteAnimation(
      // animationPath: Assets.images.player.idle.path,
      animationPath: 'player/upscaled/idle_forward_upscaled.png',
      jsonData: await gameRef.assets.readJson(
        'images/player/upscaled/json/idle_forward.json',
      ),
    );
    idleReallyAnimation = await _spriteAnimation(
      // animationPath: Assets.images.player.reallyIdle.path,
      animationPath: 'player/upscaled/idle_really_upscaled.png',
      jsonData: await gameRef.assets.readJson(
        'images/player/upscaled/json/idle_really.json',
      ),
    );
    idleBackAnimation = await _spriteAnimation(
      // animationPath: Assets.images.player.idle.path,
      animationPath: 'player/upscaled/idle_back_upscaled.png',
      jsonData: await gameRef.assets.readJson(
        'images/player/upscaled/json/idle_back.json',
      ),
    );
    idleRightAnimation = await _spriteAnimation(
      // animationPath: Assets.images.player.idle.path,
      animationPath: 'player/upscaled/right_idle_upscaled.png',
      jsonData: await gameRef.assets.readJson(
        'images/player/upscaled/json/right_idle.json',
      ),
    );
    idleLeftAnimation = await _spriteAnimation(
      // animationPath: Assets.images.player.reallyIdle.path,
      animationPath: 'player/upscaled/left_idle_upscaled.png',
      jsonData: await gameRef.assets.readJson(
        'images/player/upscaled/json/left_idle.json',
      ),
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

  Future<SpriteAnimation> _spriteAnimation({
    required String animationPath,
    required Map<String, dynamic> jsonData,
  }) async {
    return SpriteAnimation.fromAsepriteData(
      game.images.fromCache(animationPath),
      jsonData,
    );
  }

  void _checkHorizontalCollisions() {
    // moveSpeed = 100;
    for (final block in game.level.collisionBlock) {
      if (checkCollisions(
        player: this,
        block: block,
      )) {
        if (_direction.x > 0) {
          position.x = block.x - hitbox.x - hitbox.width;
        }
        if (_direction.x < 0) {
          position.x = block.x + block.width + hitbox.x;
        }
      }
    }
  }

  void _checkVerticalCollisions() {
    // moveSpeed = 100;
    for (final block in game.level.collisionBlock) {
      if (checkCollisions(
        player: this,
        block: block,
      )) {
        if (_direction.y > 0) {
          position.y = block.y - hitbox.y - hitbox.height;
        }
        if (_direction.y < 0) {
          position.y = block.y + block.height + hitbox.y;
        }
      }
    }
  }

  void _setAnimation(DirectionState state, {required bool isMoving}) {
    switch (state) {
      // The Left direction
      case DirectionState.left:
        if (isMoving) {
          playerState = PlayerState.walkingLeft;
        } else {
          playerState = PlayerState.idleLeft;
        }

      // The Right direction
      case DirectionState.right:
        if (isMoving) {
          playerState = PlayerState.walkingRight;
        } else {
          playerState = PlayerState.idleRight;
        }

      // The Forward direction
      case DirectionState.forward:
        if (isMoving) {
          playerState = PlayerState.walkingForward;
        } else {
          playerState = PlayerState.idleForward;
        }

      // The Back direction
      case DirectionState.back:
        if (isMoving) {
          playerState = PlayerState.walkingBack;
        } else {
          playerState = PlayerState.idleBack;
        }
    }

    current = playerState;
  }
}
