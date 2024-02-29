import 'dart:async';

import 'package:environment_hackaton/game/entity/player.dart';
import 'package:environment_hackaton/game/game.dart';
import 'package:flame/components.dart';
import 'package:flame_behaviors/flame_behaviors.dart';

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
  down,
  up,
}

class PlayerStateBehavior extends Behavior<Player>
    with HasGameRef<WattsChallenge> {
  PlayerState? _playerState;

  late final Map<PlayerState, PositionComponent> _stateMap;

  late final SpriteAnimationComponent forwardAnimation;
  late final SpriteAnimationComponent idleBackAnimation;
  late final SpriteAnimationComponent idleLeftAnimation;
  late final SpriteAnimationComponent idleRightAnimation;
  late final SpriteAnimationComponent forwardReallyAnimation;
  late final SpriteAnimationComponent backAnimation;
  late final SpriteAnimationComponent leftAnimation;
  late final SpriteAnimationComponent rightAnimation;
  late final SpriteAnimationComponent idleForwardAnimation;
  late final SpriteAnimationComponent idleReallyAnimation;

  PlayerState get state => _playerState ?? PlayerState.idleForward;

  set state(PlayerState state) {
    if (state != _playerState) {
      final current = _stateMap[_playerState];

      if (current != null) {
        current.removeFromParent();

        if (current is SpriteAnimationComponent) {
          current.animationTicker?.reset();
        }
      }

      final replacement = _stateMap[state];
      if (replacement != null) {
        parent.add(replacement);
      }
      _playerState = state;
    }
  }

  @override
  FutureOr<void> onLoad() async {
    await _loadAllAnimations();
    await super.onLoad();
  }

  Future<void> _loadAllAnimations() async {
    forwardAnimation = await _spriteAnimation(
      // animationPath: Assets.images.player.walkingForward.path,
      animationPath: 'player/walking_forward.png',
      jsonData: await gameRef.assets
          .readJson('images/player/json/walking_forward.json'),
    );
    forwardReallyAnimation = await _spriteAnimation(
      // animationPath: Assets.images.player.reallyForward.path,
      animationPath: 'player/really_face_walking.png',
      jsonData: await gameRef.assets.readJson(
        'images/player/json/walking_really_face.json',
      ),
    );
    backAnimation = await _spriteAnimation(
      // animationPath: Assets.images.player.walkingBack.path,
      animationPath: 'player/walking_back.png',
      jsonData: await gameRef.assets.readJson(
        'images/player/json/walking_back.json',
      ),
    );
    leftAnimation = await _spriteAnimation(
      // animationPath: Assets.images.player.walkingLeft.path,
      animationPath: 'player/walking_left.png',
      jsonData: await gameRef.assets.readJson(
        'images/player/json/walking_left.json',
      ),
    );
    rightAnimation = await _spriteAnimation(
      // animationPath: Assets.images.player.walkingRight.path,
      animationPath: 'player/walking_right.png',
      jsonData: await gameRef.assets.readJson(
        'images/player/json/walking_right.json',
      ),
    );
    idleForwardAnimation = await _spriteAnimation(
      // animationPath: Assets.images.player.idle.path,
      animationPath: 'player/idle_forward.png',
      jsonData: await gameRef.assets.readJson(
        'images/player/json/idle_forward.json',
      ),
    );
    idleReallyAnimation = await _spriteAnimation(
      // animationPath: Assets.images.player.reallyIdle.path,
      animationPath: 'player/idle_really.png',
      jsonData: await gameRef.assets.readJson(
        'images/player/json/idle_really.json',
      ),
    );
    idleBackAnimation = await _spriteAnimation(
      // animationPath: Assets.images.player.idle.path,
      animationPath: 'player/idle_back.png',
      jsonData: await gameRef.assets.readJson(
        'images/player/json/idle_back.json',
      ),
    );
    idleRightAnimation = await _spriteAnimation(
      // animationPath: Assets.images.player.idle.path,
      animationPath: 'player/right_idle.png',
      jsonData: await gameRef.assets.readJson(
        'images/player/json/right_idle.json',
      ),
    );
    idleLeftAnimation = await _spriteAnimation(
      // animationPath: Assets.images.player.reallyIdle.path,
      animationPath: 'player/left_idle.png',
      jsonData: await gameRef.assets.readJson(
        'images/player/json/left_idle.json',
      ),
    );

    // List of all animations
    _stateMap = {
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
    state = PlayerState.idleForward;
  }

  Future<SpriteAnimationComponent> _spriteAnimation({
    required String animationPath,
    required Map<String, dynamic> jsonData,
  }) async {
    final centerPosition = parent.size / 2 - Vector2(0, parent.size.y / 2);

    return SpriteAnimationComponent(
      animation: SpriteAnimation.fromAsepriteData(
        game.images.fromCache(animationPath),
        jsonData,
      ),
      anchor: Anchor.center,
      position: centerPosition,
    );
  }
}
