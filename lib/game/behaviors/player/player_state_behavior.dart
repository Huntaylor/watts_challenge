import 'dart:async';

import 'package:environment_hackaton/game/entity/player_entity.dart';
import 'package:environment_hackaton/game/game.dart';
import 'package:environment_hackaton/utils/asset_const.dart';
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

enum InteractionState {
  interacting,
  notInteracting,
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
      animationPath: AssetConst.walkingForwardSprite,
      jsonData: await gameRef.assets.readJson(AssetConst.walkingForwardJson),
    );
    forwardReallyAnimation = await _spriteAnimation(
      animationPath: AssetConst.reallyWalkingSprite,
      jsonData: await gameRef.assets.readJson(
        AssetConst.reallyWalkingJson,
      ),
    );
    backAnimation = await _spriteAnimation(
      animationPath: AssetConst.walkingBackSprite,
      jsonData: await gameRef.assets.readJson(
        AssetConst.walkingBackJson,
      ),
    );
    leftAnimation = await _spriteAnimation(
      animationPath: AssetConst.walkingLeftSprite,
      jsonData: await gameRef.assets.readJson(
        AssetConst.walkingLeftJson,
      ),
    );
    rightAnimation = await _spriteAnimation(
      animationPath: AssetConst.walkingRightSprite,
      jsonData: await gameRef.assets.readJson(
        AssetConst.walkingRightJson,
      ),
    );
    idleForwardAnimation = await _spriteAnimation(
      animationPath: AssetConst.idleForwardSprite,
      jsonData: await gameRef.assets.readJson(
        AssetConst.idleForwardJson,
      ),
    );
    idleReallyAnimation = await _spriteAnimation(
      animationPath: AssetConst.idleReallySprite,
      jsonData: await gameRef.assets.readJson(
        AssetConst.idleReallyJson,
      ),
    );
    idleBackAnimation = await _spriteAnimation(
      animationPath: AssetConst.idleBackSprite,
      jsonData: await gameRef.assets.readJson(
        AssetConst.idleBackJson,
      ),
    );
    idleRightAnimation = await _spriteAnimation(
      animationPath: AssetConst.idleRightSprite,
      jsonData: await gameRef.assets.readJson(
        AssetConst.idleRightJson,
      ),
    );
    idleLeftAnimation = await _spriteAnimation(
      animationPath: AssetConst.idleLeftSprite,
      jsonData: await gameRef.assets.readJson(
        AssetConst.idleLeftJson,
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
    state = PlayerState.idleBack;
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
      anchor: Anchor.topCenter,
      position: centerPosition,
    );
  }
}
