// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'player_cubit.dart';

// **************************************************************************
// AutoequalGenerator
// **************************************************************************

extension _$PlayerInteractionStateAutoequal on PlayerInteractionState {
  List<Object?> get _$props => [
        isInteracting,
        timerState,
      ];
}

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$PlayerInteractionStateCWProxy {
  PlayerInteractionState isInteracting(bool isInteracting);

  PlayerInteractionState timerState(TimerState timerState);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `PlayerInteractionState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// PlayerInteractionState(...).copyWith(id: 12, name: "My name")
  /// ````
  PlayerInteractionState call({
    bool? isInteracting,
    TimerState? timerState,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfPlayerInteractionState.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfPlayerInteractionState.copyWith.fieldName(...)`
class _$PlayerInteractionStateCWProxyImpl
    implements _$PlayerInteractionStateCWProxy {
  const _$PlayerInteractionStateCWProxyImpl(this._value);

  final PlayerInteractionState _value;

  @override
  PlayerInteractionState isInteracting(bool isInteracting) =>
      this(isInteracting: isInteracting);

  @override
  PlayerInteractionState timerState(TimerState timerState) =>
      this(timerState: timerState);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `PlayerInteractionState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// PlayerInteractionState(...).copyWith(id: 12, name: "My name")
  /// ````
  PlayerInteractionState call({
    Object? isInteracting = const $CopyWithPlaceholder(),
    Object? timerState = const $CopyWithPlaceholder(),
  }) {
    return PlayerInteractionState(
      isInteracting:
          isInteracting == const $CopyWithPlaceholder() || isInteracting == null
              ? _value.isInteracting
              // ignore: cast_nullable_to_non_nullable
              : isInteracting as bool,
      timerState:
          timerState == const $CopyWithPlaceholder() || timerState == null
              ? _value.timerState
              // ignore: cast_nullable_to_non_nullable
              : timerState as TimerState,
    );
  }
}

extension $PlayerInteractionStateCopyWith on PlayerInteractionState {
  /// Returns a callable class that can be used as follows: `instanceOfPlayerInteractionState.copyWith(...)` or like so:`instanceOfPlayerInteractionState.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$PlayerInteractionStateCWProxy get copyWith =>
      _$PlayerInteractionStateCWProxyImpl(this);
}
