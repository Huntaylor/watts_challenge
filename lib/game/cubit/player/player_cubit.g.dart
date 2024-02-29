// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'player_cubit.dart';

// **************************************************************************
// AutoequalGenerator
// **************************************************************************

extension _$PlayerStateAutoequal on PlayerState {
  List<Object?> get _$props => [sprintState];
}

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$PlayerStateCWProxy {
  PlayerState sprintState(PlayerSprint sprintState);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `PlayerState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// PlayerState(...).copyWith(id: 12, name: "My name")
  /// ````
  PlayerState call({
    PlayerSprint? sprintState,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfPlayerState.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfPlayerState.copyWith.fieldName(...)`
class _$PlayerStateCWProxyImpl implements _$PlayerStateCWProxy {
  const _$PlayerStateCWProxyImpl(this._value);

  final PlayerState _value;

  @override
  PlayerState sprintState(PlayerSprint sprintState) =>
      this(sprintState: sprintState);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `PlayerState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// PlayerState(...).copyWith(id: 12, name: "My name")
  /// ````
  PlayerState call({
    Object? sprintState = const $CopyWithPlaceholder(),
  }) {
    return PlayerState(
      sprintState:
          sprintState == const $CopyWithPlaceholder() || sprintState == null
              ? _value.sprintState
              // ignore: cast_nullable_to_non_nullable
              : sprintState as PlayerSprint,
    );
  }
}

extension $PlayerStateCopyWith on PlayerState {
  /// Returns a callable class that can be used as follows: `instanceOfPlayerState.copyWith(...)` or like so:`instanceOfPlayerState.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$PlayerStateCWProxy get copyWith => _$PlayerStateCWProxyImpl(this);
}