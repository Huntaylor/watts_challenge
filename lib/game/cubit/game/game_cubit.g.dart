// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'game_cubit.dart';

// **************************************************************************
// AutoequalGenerator
// **************************************************************************

extension _$GameStateStateAutoequal on GameStateState {
  List<Object?> get _$props => [
        gameTimer,
        elecUsage,
      ];
}

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$GameStateStateCWProxy {
  GameStateState gameTimer(Timer gameTimer);

  GameStateState elecUsage(int elecUsage);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `GameStateState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// GameStateState(...).copyWith(id: 12, name: "My name")
  /// ````
  GameStateState call({
    Timer? gameTimer,
    int? elecUsage,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfGameStateState.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfGameStateState.copyWith.fieldName(...)`
class _$GameStateStateCWProxyImpl implements _$GameStateStateCWProxy {
  const _$GameStateStateCWProxyImpl(this._value);

  final GameStateState _value;

  @override
  GameStateState gameTimer(Timer gameTimer) => this(gameTimer: gameTimer);

  @override
  GameStateState elecUsage(int elecUsage) => this(elecUsage: elecUsage);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `GameStateState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// GameStateState(...).copyWith(id: 12, name: "My name")
  /// ````
  GameStateState call({
    Object? gameTimer = const $CopyWithPlaceholder(),
    Object? elecUsage = const $CopyWithPlaceholder(),
  }) {
    return GameStateState(
      gameTimer: gameTimer == const $CopyWithPlaceholder() || gameTimer == null
          ? _value.gameTimer
          // ignore: cast_nullable_to_non_nullable
          : gameTimer as Timer,
      elecUsage: elecUsage == const $CopyWithPlaceholder() || elecUsage == null
          ? _value.elecUsage
          // ignore: cast_nullable_to_non_nullable
          : elecUsage as int,
    );
  }
}

extension $GameStateStateCopyWith on GameStateState {
  /// Returns a callable class that can be used as follows: `instanceOfGameStateState.copyWith(...)` or like so:`instanceOfGameStateState.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$GameStateStateCWProxy get copyWith => _$GameStateStateCWProxyImpl(this);
}
