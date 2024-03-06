import 'package:environment_hackaton/game/view/game_view.dart';
import 'package:environment_hackaton/utils/routes/paths.dart';
import 'package:go_router/go_router.dart';

final goRoutes = GoRouter(
  initialLocation: Paths.initial.goRoute,
  debugLogDiagnostics: true,
  routes: [
    GoRoute(
      path: Paths.initial.goRoute,
      builder: (_, __) => const MyGame(),
    ),
  ],
);
