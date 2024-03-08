/// Mixin for interactable objects. The Time variables are for
/// the amount of seconds it will take to fill up the bar.
/// The Power usage is for how much power the object will use up.
/// Variables available:
///- [largeItemTime]
///- [mediumItemTime]
///- [smallItemTime]
///- [lightSwitchTime]
///- [largePowerUsage]
///- [mediumPowerUsage]
///- [smallPowerUsage]
///- [lightSwitchPowerUsage]
mixin SetObjectTypeMixin {
  //?           - Timer -
  /// Use for Large objects.
  ///* 6 seconds for the loading bar to fill.
  static const double largeItemTime = 6;

  /// Use for light switches.
  ///* 4 seconds for the loading bar to fill.
  static const double mediumItemTime = 4;

  /// Use for light switches.
  ///* 2 seconds for the loading bar to fill.
  static const double smallItemTime = 2;

  /// Use for light switches.
  ///* Half a second for the loading bar to fill.
  static const double lightSwitchTime = 0.5;

  //?           - Power Usage -
  /// Use for Large objects.
  ///* 6 seconds for the loading bar to fill.
  static const double largePowerUsage = 10;

  /// Use for light switches.
  ///* 4 seconds for the loading bar to fill.
  static const double mediumPowerUsage = 8;

  /// Use for light switches.
  ///* 2 seconds for the loading bar to fill.
  static const double smallPowerUsage = 6;

  /// Use for light switches.
  ///* Half a second for the loading bar to fill.
  static const double lightSwitchPowerUsage = 2;
}
