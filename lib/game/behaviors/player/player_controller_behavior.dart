import 'package:environment_hackaton/game/behaviors/player/player.dart';
import 'package:environment_hackaton/game/behaviors/player/player_state_behavior.dart';
import 'package:environment_hackaton/game/cubit/player/player_cubit.dart';
import 'package:environment_hackaton/game/entity/player_entity.dart';
import 'package:environment_hackaton/game/game.dart';
import 'package:environment_hackaton/utils/app_library.dart';
import 'package:flame/components.dart';
import 'package:flame_behaviors/flame_behaviors.dart';
import 'package:flame_bloc/flame_bloc.dart';

enum DirectionState {
  left,
  right,
  down,
  up,
}

class PlayerControllerBehavior extends Behavior<Player>
    with
        KeyboardHandler,
        HasGameRef<WattsChallenge>,
        FlameBlocReader<PlayerGameCubit, PlayerGameState> {
  PlayerControllerBehavior();

  @override
  bool onKeyEvent(KeyEvent event, Set<LogicalKeyboardKey> keysPressed) {
    final isKeyRepeat = event is KeyRepeatEvent;
    final isKeyDown = event is KeyDownEvent;

    if (!isKeyRepeat) {
      if (!isKeyDown) {
        if (event.logicalKey == LogicalKeyboardKey.keyA ||
            event.logicalKey == LogicalKeyboardKey.keyD) {
          if (event.logicalKey == LogicalKeyboardKey.keyA) {
            parent.directionState = DirectionState.left;
            setMovementState(
              isMoving: false,
            );
          } else {
            parent.directionState = DirectionState.right;
            setMovementState(
              isMoving: false,
            );
          }
        } else if (event.logicalKey == LogicalKeyboardKey.keyW ||
            event.logicalKey == LogicalKeyboardKey.keyS) {
          if (event.logicalKey == LogicalKeyboardKey.keyW) {
            parent.directionState = DirectionState.up;
            setMovementState(
              isMoving: false,
            );
          } else {
            parent.directionState = DirectionState.down;
            setMovementState(
              isMoving: false,
            );
          }
        }
      } else {
        if (event.logicalKey == LogicalKeyboardKey.keyA ||
            event.logicalKey == LogicalKeyboardKey.keyD) {
          if (event.logicalKey == LogicalKeyboardKey.keyA) {
            parent.directionState = DirectionState.left;
            setMovementState(
              isMoving: true,
            );
          } else {
            parent.directionState = DirectionState.right;
            setMovementState(
              isMoving: true,
            );
          }
        } else if (event.logicalKey == LogicalKeyboardKey.keyW ||
            event.logicalKey == LogicalKeyboardKey.keyS) {
          if (event.logicalKey == LogicalKeyboardKey.keyW) {
            parent.directionState = DirectionState.up;
            setMovementState(
              isMoving: true,
            );
          } else {
            parent.directionState = DirectionState.down;
            setMovementState(
              isMoving: true,
            );
          }
        }
      }

      if (event.logicalKey == LogicalKeyboardKey.shiftLeft) {
        isKeyDown ? getSprintState() : getWalkingState();
      }

      if (event.logicalKey == LogicalKeyboardKey.space) {
        bloc.getInteractionCubit(isInteracting: isKeyDown);
      }
    }

    return super.onKeyEvent(event, keysPressed);
  }

  void stopPlayer() {
    parent.direction
      ..x = 0
      ..y = 0;
  }

  void movePlayer({required DirectionState state}) {
    switch (state) {
      case DirectionState.left:
        parent.direction
          ..x = -1
          ..y = 0;
      case DirectionState.right:
        parent.direction
          ..x = 1
          ..y = 0;
      case DirectionState.down:
        parent.direction
          ..x = 0
          ..y = 1;
      case DirectionState.up:
        parent.direction
          ..x = 0
          ..y = -1;
    }
  }

  void getWalkingState() {
    parent.moveSpeed = 200;
  }

  void getSprintState() {
    parent.moveSpeed = 350;
  }

  void setMovementState({
    required bool isMoving,
  }) {
    final PlayerState playerState;
    switch (parent.directionState) {
      // The Left direction
      case DirectionState.left:
        if (isMoving) {
          playerState = PlayerState.walkingLeft;
          movePlayer(state: parent.directionState);
        } else {
          stopPlayer();
          playerState = PlayerState.idleLeft;
        }

      // The Right direction
      case DirectionState.right:
        if (isMoving) {
          playerState = PlayerState.walkingRight;
          movePlayer(state: parent.directionState);
        } else {
          stopPlayer();
          playerState = PlayerState.idleRight;
        }

      // The Forward direction
      case DirectionState.down:
        if (isMoving) {
          movePlayer(state: parent.directionState);
          playerState = PlayerState.walkingForward;
        } else {
          stopPlayer();
          playerState = PlayerState.idleForward;
        }

      // The Back direction
      case DirectionState.up:
        if (isMoving) {
          movePlayer(state: parent.directionState);
          playerState = PlayerState.walkingBack;
        } else {
          stopPlayer();
          playerState = PlayerState.idleBack;
        }
    }

    parent.stateBehavior.state = playerState;
  }
}
