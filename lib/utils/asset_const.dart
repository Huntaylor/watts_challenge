class AssetConst {
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

  ///Collisions
  static String get collisions => 'Collisions';

  ///Spawnpoints
  static String get spawnpoints => 'Spawnpoints';

  ///Spawnpoints - Player
  static const String player = 'Player';

  ///Spawnpoints - Light Switches
  static const String lightSwitch = 'Switch';

  ///Ground collisions
  static String get ground => 'Ground';

  ///Platform collisions
  static String get platform => 'Platform';

  ///Snowflake collisions
  static String get snowflake => 'Snowflake';

  //?                      -Tiled Object Custom Property Names-

  ///'interactionTime'
  static String get interactionTime => 'interactionTime';
}
