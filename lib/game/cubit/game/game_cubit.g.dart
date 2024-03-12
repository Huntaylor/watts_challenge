// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'game_cubit.dart';

// **************************************************************************
// AutoequalGenerator
// **************************************************************************

extension _$GameMainMenuAutoequal on GameMainMenu {
  List<Object?> get _$props => [
        isSFXOn,
        isMusicOn,
      ];
}

extension _$GameStartStateAutoequal on GameStartState {
  List<Object?> get _$props => [
        isSFXOn,
        isMusicOn,
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

abstract class _$GameMainMenuCWProxy {
  GameMainMenu isSFXOn(bool isSFXOn);

  GameMainMenu isMusicOn(bool isMusicOn);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `GameMainMenu(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// GameMainMenu(...).copyWith(id: 12, name: "My name")
  /// ````
  GameMainMenu call({
    bool? isSFXOn,
    bool? isMusicOn,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfGameMainMenu.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfGameMainMenu.copyWith.fieldName(...)`
class _$GameMainMenuCWProxyImpl implements _$GameMainMenuCWProxy {
  const _$GameMainMenuCWProxyImpl(this._value);

  final GameMainMenu _value;

  @override
  GameMainMenu isSFXOn(bool isSFXOn) => this(isSFXOn: isSFXOn);

  @override
  GameMainMenu isMusicOn(bool isMusicOn) => this(isMusicOn: isMusicOn);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `GameMainMenu(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// GameMainMenu(...).copyWith(id: 12, name: "My name")
  /// ````
  GameMainMenu call({
    Object? isSFXOn = const $CopyWithPlaceholder(),
    Object? isMusicOn = const $CopyWithPlaceholder(),
  }) {
    return GameMainMenu(
      isSFXOn: isSFXOn == const $CopyWithPlaceholder() || isSFXOn == null
          ? _value.isSFXOn
          // ignore: cast_nullable_to_non_nullable
          : isSFXOn as bool,
      isMusicOn: isMusicOn == const $CopyWithPlaceholder() || isMusicOn == null
          ? _value.isMusicOn
          // ignore: cast_nullable_to_non_nullable
          : isMusicOn as bool,
    );
  }
}

extension $GameMainMenuCopyWith on GameMainMenu {
  /// Returns a callable class that can be used as follows: `instanceOfGameMainMenu.copyWith(...)` or like so:`instanceOfGameMainMenu.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$GameMainMenuCWProxy get copyWith => _$GameMainMenuCWProxyImpl(this);
}

abstract class _$GameStartStateCWProxy {
  GameStartState totalElectricUsage(double totalElectricUsage);

  GameStartState currentUsage(double currentUsage);

  GameStartState isSFXOn(bool isSFXOn);

  GameStartState isMusicOn(bool isMusicOn);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `GameStartState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// GameStartState(...).copyWith(id: 12, name: "My name")
  /// ````
  GameStartState call({
    double? totalElectricUsage,
    double? currentUsage,
    bool? isSFXOn,
    bool? isMusicOn,
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
  GameStartState isSFXOn(bool isSFXOn) => this(isSFXOn: isSFXOn);

  @override
  GameStartState isMusicOn(bool isMusicOn) => this(isMusicOn: isMusicOn);

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
    Object? isSFXOn = const $CopyWithPlaceholder(),
    Object? isMusicOn = const $CopyWithPlaceholder(),
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
      isSFXOn: isSFXOn == const $CopyWithPlaceholder() || isSFXOn == null
          ? _value.isSFXOn
          // ignore: cast_nullable_to_non_nullable
          : isSFXOn as bool,
      isMusicOn: isMusicOn == const $CopyWithPlaceholder() || isMusicOn == null
          ? _value.isMusicOn
          // ignore: cast_nullable_to_non_nullable
          : isMusicOn as bool,
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
