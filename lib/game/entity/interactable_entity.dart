import 'dart:async';

import 'package:environment_hackaton/game/behaviors/interactable_behavior.dart';
import 'package:flame/components.dart';
import 'package:flame_behaviors/flame_behaviors.dart';

class InteractableEntity extends PositionedEntity {
  InteractableEntity({
    required this.spriteComponent,
    super.priority,
  }) : super(
          behaviors: [InteractableBehavior()],
          size: spriteComponent.size,
          position: spriteComponent.position,
        );
  final SpriteComponent spriteComponent;

  @override
  FutureOr<void> onLoad() {
    add(spriteComponent);
    return super.onLoad();
  }
}
