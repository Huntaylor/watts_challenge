import 'package:flame_behaviors/flame_behaviors.dart';

class InteractableEntity extends PositionedEntity {
  InteractableEntity({
    super.position,
    super.size,
    super.priority,
  }) : super(behaviors: []);
}
