import 'dart:async';
import 'dart:ui';

import 'package:environment_hackaton/game/behaviors/interactables/interactable_collision_behavior.dart';
import 'package:environment_hackaton/game/behaviors/interactables/interactable_state_behavior.dart';
import 'package:environment_hackaton/game/components/base_object.dart';
import 'package:environment_hackaton/game/game.dart';
import 'package:environment_hackaton/utils/app_library.dart';
import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame_behaviors/flame_behaviors.dart';
import 'package:flutter/material.dart' as color;

class InteractableObjects extends SpriteGroupComponent<InteractableState>
    with EntityMixin, HasGameRef<WattsChallenge> {
  InteractableObjects({
    required this.objectType,
    required this.lightSwitchState,
    required this.onSprite,
    required this.offSprite,
    super.priority,
    super.position,
    super.size,
    super.sprites,
    super.current,
  });
  final ObjectType objectType;
  final LightSwitchState lightSwitchState;

  final Image onSprite;
  final Image offSprite;

  late InteractableState deviceState;
  late BaseObject baseObject;
  late RectangleHitbox hitbox;
  late bool isOn;

  bool isMax = false;
  double interactionTime = .35;
  double _progress = 0;
  double elapsedTime = 0;
  double maxProgress = 2;
  double minProgress = 0;
  double strength = 4;

  late bool isPlayerColliding;

  late final InteractableBehaviorState interactableBehaviorState =
      findBehavior<InteractableBehaviorState>();

  late final PropagatingCollisionBehavior propagatingCollisionBehavior =
      findBehavior<PropagatingCollisionBehavior>();

  late final InteractableCollisionBehavior interactableCollisionBehavior =
      findBehavior<InteractableCollisionBehavior>();

  @override
  void update(double dt) {
    priority = isPlayerColliding
        ? gameRef.interactablePriority
        : gameRef.foregroundLevelPriority + 1;
    if (isMax) {
      elapsedTime -= dt;
      final targetProgress = elapsedTime / interactionTime;
      if (targetProgress > minProgress) {
        _progress = targetProgress;
      } else {
        reset();
      }
    } else {
      elapsedTime += dt;
      final targetProgress = elapsedTime / interactionTime;
      if (targetProgress < maxProgress) {
        _progress = targetProgress;
      } else {
        reset();
      }
    }
    super.update(dt);
  }

  @override
  FutureOr<void> onLoad() async {
    _progress = 0.0;
    baseObject = BaseObject(objectType: objectType);
    isPlayerColliding = false;
    isOn = true;
    hitbox = RectangleHitbox.relative(
      Vector2.all(1),
      parentSize: size,
      anchor: Anchor.center,
    );

    add(hitbox);

    priority = isPlayerColliding
        ? gameRef.interactablePriority
        : gameRef.interactablePriority + 3;
    deviceState = InteractableState.on;

    await addAll([
      baseObject,
      InteractableBehaviorState(),
      InteractableCollisionBehavior(),
      PropagatingCollisionBehavior(hitbox),
    ]);

    return super.onLoad();
  }

  @override
  void render(Canvas canvas) {
    color.Color glowColor;
    if (isOn) {
      glowColor = color.Colors.yellow.shade900;
    } else {
      glowColor = color.Colors.blue.shade900;
    }
    canvas
      ..save()
      ..drawRect(
        Rect.fromLTWH(0, 0, width, height),
        Paint()
          ..color = glowColor
          ..maskFilter = MaskFilter.blur(BlurStyle.outer, strength * _progress),
      )
      ..restore();
    super.render(canvas);
  }

  void reset() {
    isMax = !isMax;
  }
}
