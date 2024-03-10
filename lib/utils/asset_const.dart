class AssetConst {
  const AssetConst();
  //?                      -Player Sprite Files-

  ///'player/idle_back.png'
  static String get idleBackSprite => 'player/idle_back.png';

  ///'player/idle_forward.png'
  static String get idleForwardSprite => 'player/idle_forward.png';

  ///'player/idle_really.png'
  static String get idleReallySprite => 'player/idle_really.png';

  ///'player/idle_left.png'
  static String get idleLeftSprite => 'player/idle_left.png';

  ///'player/idle_right.png'
  static String get idleRightSprite => 'player/idle_right.png';

  ///'player/really_face_walking.png'
  static String get reallyWalkingSprite => 'player/really_face_walking.png';

  ///'player/walking_back.png'
  static String get walkingBackSprite => 'player/walking_back.png';

  ///'player/walking_forward.png'
  static String get walkingForwardSprite => 'player/walking_forward.png';

  ///'player/walking_left.png'
  static String get walkingLeftSprite => 'player/walking_left.png';

  ///'player/walking_right.png'
  static String get walkingRightSprite => 'player/walking_right.png';

  //?                       -Json Files-

  ///'images/player/json/idle_back.json'
  static String get idleBackJson => 'images/player/json/idle_back.json';

  ///'images/player/json/idle_forward.json'
  static String get idleForwardJson => 'images/player/json/idle_forward.json';

  ///'images/player/json/idle_really.json'
  static String get idleReallyJson => 'images/player/json/idle_really.json';

  ///'images/player/json/idle_left.json'
  static String get idleLeftJson => 'images/player/json/idle_left.json';

  ///'images/player/json/idle_right.json'
  static String get idleRightJson => 'images/player/json/idle_right.json';

  ///'images/player/json/walking_really_face.json'
  static String get reallyWalkingJson =>
      'images/player/json/walking_really_face.json';

  ///'images/player/json/walking_back.json'
  static String get walkingBackJson => 'images/player/json/walking_back.json';

  ///'images/player/json/walking_forward.json'
  static String get walkingForwardJson =>
      'images/player/json/walking_forward.json';

  ///'images/player/json/walking_left.json'
  static String get walkingLeftJson => 'images/player/json/walking_left.json';

  ///'images/player/json/walking_right.json'
  static String get walkingRightJson => 'images/player/json/walking_right.json';

  //?                      -HUD Files-

  ///'hud/e_button_down.png'
  static String get interactButtonDown => 'hud/e_button_down.png';

  ///'hud/e_button.png'
  static String get interactButton => 'hud/e_button.png';

  ///'hud/joystick.png'
  static String get joystick => 'hud/joystick.png';

  ///'hud/knob.png'
  static String get knob => 'hud/knob.png';

  ///'hud/sprint_button_down.png'
  static String get sprintButtonDown => 'hud/sprint_button_down.png';

  ///'hud/sprint_button.png'
  static String get sprintButton => 'hud/sprint_button.png';

  ///'hud/timer_outline.png'
  static String get timerOutline => 'hud/timer_outline.png';

  ///'hud/battery.png'
  static String get usageOutline => 'hud/battery.png';

  ///'hud/pause_button.png'
  static String get pauseButton => 'hud/pause_button.png';

  //?                      -Interactable Files-

  ///'interactables/light_switch_off.png'
  static String get lightSwitchOff => 'interactables/light_switch_off.png';

  ///'interactables/light_switch_on.png'
  static String get lightSwitchOn => 'interactables/light_switch_on.png';

  //* Shader Files

  ///'shaders/lightbulbs.glsl'
  static String get lightBulbShader => 'shaders/lightbulbs.glsl';

  //?                      -Tiled Files-

  ///'house_1.tmx'
  static String get house1 => 'house_1.tmx';

  ///'house_1_foreground.tmx'
  static String get houseForeground => 'house_1_foreground.tmx';

  //* Overlay String

  ///Game Over Overlay
  static String get gameOver => 'GameOver';

  ///Pause Menu Overlay
  static String get pauseMenu => 'PauseMenu';

  ///Main Menu Overlay
  static String get mainMenu => 'MainMenu';

  //?                      -Tiled Object Names-

  ///LevelLayout
  static String get levelLayout => 'LevelLayout';

  ///Collisions
  static String get collisions => 'Collisions';

  ///Spawnpoints
  static String get spawnpoints => 'Spawnpoints';

  ///Shaders
  static String get shaders => 'Shaders';

  ///Spawnpoints - Player
  static const String player = 'Player';

  ///Spawnpoints - Light Switches
  static const String lightSwitch = 'Switch';

  ///Shaders Class - LightShaders
  static const String lightShaders = 'LightShaders';

  ///Shaders - Hallway
  static String get hallway => 'Hallway';

  ///Platform collisions
  static String get platform => 'Platform';

  //?                      -Tiled Object Custom Property Names-

  ///'gameTimer'
  static const String gameTimer = 'gameTimer';

  ///'Hallway'
  static const String hallwayProperty = 'Hallway';

  ///'MasterBedroom'
  static const String masterBedroomProperty = 'MasterBedroom';

  ///'MasterBathroom'
  static const String masterBathroomProperty = 'MasterBathroom';

  ///'MasterCloset'
  static const String masterClosetProperty = 'MasterCloset';

  ///'Bedroom1'
  static const String bedroom1Property = 'Bedroom1';

  ///'BedroomCloset1'
  static const String bedroomCloset1Property = 'BedroomCloset1';

  ///'Bedroom2'
  static const String bedroom2Property = 'Bedroom2';

  ///'BedroomCloset2'
  static const String bedroomCloset2Property = 'BedroomCloset2';

  ///'LaundryRoom'
  static const String laundryRoomProperty = 'LaundryRoom';

  ///'Garage'
  static const String garageProperty = 'Garage';

  ///'Kitchen'
  static const String kitchenProperty = 'Kitchen';

  ///'Pantry'
  static const String pantryProperty = 'Pantry';

  //?                      -Shader Names-

  ///Darkening Shader - 'shaders/darkening_shader.glsl'
  static String get darkeningShader => 'assets/shaders/darkening_shader.glsl';

  ///Electricity Shader - 'shaders/electricity_shader.glsl'
  static String get electricityShader =>
      'assets/shaders/electricity_shader.glsl';
}
