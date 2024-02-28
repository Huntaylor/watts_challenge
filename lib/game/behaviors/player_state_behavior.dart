import 'dart:async';

import 'package:environment_hackaton/game/entity/player.dart';
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

class PlayerStateBehavior extends Behavior<Player> {
  PlayerState? _playerState;

  late final Map<PlayerState, PositionComponent> _stateMap;

  late final Map<PlayerState, SpriteAnimation> _animations;

  PlayerState get state => _playerState ?? PlayerState.idleForward;

  set state(PlayerState state) {
    if (state != _playerState) {
      final replacement = _stateMap[state];
      if (replacement != null) {
        parent.add(replacement);
      }
      _playerState = state;
    }
  }

  @override
  FutureOr<void> onLoad() async {
    await super.onLoad();
    final [] = await Future.wait([]);
  }
}
