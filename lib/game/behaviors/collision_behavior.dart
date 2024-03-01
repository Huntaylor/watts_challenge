import 'package:flame/collisions.dart';
import 'package:flame_behaviors/flame_behaviors.dart';

class CollisionBehavior extends Behavior<PositionedEntity>
    with CollisionCallbacks {
  CollisionBehavior();
}
