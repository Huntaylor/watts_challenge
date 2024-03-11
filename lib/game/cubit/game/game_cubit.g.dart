// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'game_cubit.dart';

// **************************************************************************
// AutoequalGenerator
// **************************************************************************

extension _$GameStartStateAutoequal on GameStartState {
  List<Object?> get _$props => [
        totalElectricUsage,
        currentUsage,
      ];
}

extension _$GameEndStateAutoequal on GameEndState {
  List<Object?> get _$props => [
        percentage,
        endTime,
      ];
}

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$GameStartStateCWProxy {
  GameStartState totalElectricUsage(double totalElectricUsage);

  GameStartState currentUsage(double currentUsage);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `GameStartState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// GameStartState(...).copyWith(id: 12, name: "My name")
  /// ````
  GameStartState call({
    double? totalElectricUsage,
    double? currentUsage,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfGameStartState.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfGameStartState.copyWith.fieldName(...)`
class _$GameStartStateCWProxyImpl implements _$GameStartStateCWProxy {
  const _$GameStartStateCWProxyImpl(this._value);

  final GameStartState _value;

  @override
  GameStartState totalElectricUsage(double totalElectricUsage) =>
      this(totalElectricUsage: totalElectricUsage);

  @override
  GameStartState currentUsage(double currentUsage) =>
      this(currentUsage: currentUsage);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `GameStartState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// GameStartState(...).copyWith(id: 12, name: "My name")
  /// ````
  GameStartState call({
    Object? totalElectricUsage = const $CopyWithPlaceholder(),
    Object? currentUsage = const $CopyWithPlaceholder(),
  }) {
    return GameStartState(
      totalElectricUsage: totalElectricUsage == const $CopyWithPlaceholder() ||
              totalElectricUsage == null
          ? _value.totalElectricUsage
          // ignore: cast_nullable_to_non_nullable
          : totalElectricUsage as double,
      currentUsage:
          currentUsage == const $CopyWithPlaceholder() || currentUsage == null
              ? _value.currentUsage
              // ignore: cast_nullable_to_non_nullable
              : currentUsage as double,
    );
  }
}

extension $GameStartStateCopyWith on GameStartState {
  /// Returns a callable class that can be used as follows: `instanceOfGameStartState.copyWith(...)` or like so:`instanceOfGameStartState.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$GameStartStateCWProxy get copyWith => _$GameStartStateCWProxyImpl(this);
}

abstract class _$GameEndStateCWProxy {
  GameEndState percentage(String percentage);

  GameEndState endTime(String endTime);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `GameEndState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// GameEndState(...).copyWith(id: 12, name: "My name")
  /// ````
  GameEndState call({
    String? percentage,
    String? endTime,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfGameEndState.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfGameEndState.copyWith.fieldName(...)`
class _$GameEndStateCWProxyImpl implements _$GameEndStateCWProxy {
  const _$GameEndStateCWProxyImpl(this._value);

  final GameEndState _value;

  @override
  GameEndState percentage(String percentage) => this(percentage: percentage);

  @override
  GameEndState endTime(String endTime) => this(endTime: endTime);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `GameEndState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// GameEndState(...).copyWith(id: 12, name: "My name")
  /// ````
  GameEndState call({
    Object? percentage = const $CopyWithPlaceholder(),
    Object? endTime = const $CopyWithPlaceholder(),
  }) {
    return GameEndState(
      percentage:
          percentage == const $CopyWithPlaceholder() || percentage == null
              ? _value.percentage
              // ignore: cast_nullable_to_non_nullable
              : percentage as String,
      endTime: endTime == const $CopyWithPlaceholder() || endTime == null
          ? _value.endTime
          // ignore: cast_nullable_to_non_nullable
          : endTime as String,
    );
  }
}

extension $GameEndStateCopyWith on GameEndState {
  /// Returns a callable class that can be used as follows: `instanceOfGameEndState.copyWith(...)` or like so:`instanceOfGameEndState.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$GameEndStateCWProxy get copyWith => _$GameEndStateCWProxyImpl(this);
}
