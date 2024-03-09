// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'game_cubit.dart';

// **************************************************************************
// AutoequalGenerator
// **************************************************************************

extension _$GameStartStateAutoequal on GameStartState {
  List<Object?> get _$props => [
        gameTimer,
        electricUsage,
      ];
}

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$GameStartStateCWProxy {
  GameStartState gameTimer(int gameTimer);

  GameStartState electricUsage(double electricUsage);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `GameStartState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// GameStartState(...).copyWith(id: 12, name: "My name")
  /// ````
  GameStartState call({
    int? gameTimer,
    double? electricUsage,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfGameStartState.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfGameStartState.copyWith.fieldName(...)`
class _$GameStartStateCWProxyImpl implements _$GameStartStateCWProxy {
  const _$GameStartStateCWProxyImpl(this._value);

  final GameStartState _value;

  @override
  GameStartState gameTimer(int gameTimer) => this(gameTimer: gameTimer);

  @override
  GameStartState electricUsage(double electricUsage) =>
      this(electricUsage: electricUsage);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `GameStartState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// GameStartState(...).copyWith(id: 12, name: "My name")
  /// ````
  GameStartState call({
    Object? gameTimer = const $CopyWithPlaceholder(),
    Object? electricUsage = const $CopyWithPlaceholder(),
  }) {
    return GameStartState(
      gameTimer: gameTimer == const $CopyWithPlaceholder() || gameTimer == null
          ? _value.gameTimer
          // ignore: cast_nullable_to_non_nullable
          : gameTimer as int,
      electricUsage:
          electricUsage == const $CopyWithPlaceholder() || electricUsage == null
              ? _value.electricUsage
              // ignore: cast_nullable_to_non_nullable
              : electricUsage as double,
    );
  }
}

extension $GameStartStateCopyWith on GameStartState {
  /// Returns a callable class that can be used as follows: `instanceOfGameStartState.copyWith(...)` or like so:`instanceOfGameStartState.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$GameStartStateCWProxy get copyWith => _$GameStartStateCWProxyImpl(this);
}
