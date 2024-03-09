import 'package:environment_hackaton/game/behaviors/behaviors.dart';
import 'package:environment_hackaton/game/components/base_object.dart';
import 'package:environment_hackaton/game/entity/entity.dart';
import 'package:environment_hackaton/utils/app_library.dart';

class CachedInteractableObjectProvider {
  factory CachedInteractableObjectProvider(ObjectParams params) {
    return CachedInteractableObjectProvider._internal(
      InteractableObjects(
        objectType: params.objectTypeParam,
        lightSwitchState: params.lightSwitchStateParam,
        onSprite: params.onSpriteParam,
        offSprite: params.offSpriteParam,
        position: params.positionParam,
        size: params.sizeParam,
      ),
    );
  }

  CachedInteractableObjectProvider._internal(this.cachedComponent);
  final InteractableObjects cachedComponent;
}

class ObjectParams {
  ObjectParams({
    required this.objectTypeParam,
    required this.onSpriteParam,
    required this.offSpriteParam,
    this.lightSwitchStateParam,
    this.positionParam,
    this.sizeParam,
  });
  final ObjectType objectTypeParam;
  final LightSwitchState? lightSwitchStateParam;
  final Image onSpriteParam;
  final Image offSpriteParam;
  final Vector2? positionParam;
  final Vector2? sizeParam;
}
