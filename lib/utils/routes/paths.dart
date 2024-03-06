import 'package:go_router_paths/go_router_paths.dart';

class Paths {
  const Paths._();

  static Path get initial => Path('');
  static StartUpPath get startUpPath => StartUpPath();
}

class StartUpPath extends Path {
  StartUpPath() : super('start-up');

  Path get gamePath => Path('game', parent: this);
}
