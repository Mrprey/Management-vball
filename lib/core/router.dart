import 'package:auto_route/auto_route.dart';
import 'package:management_vball/presentation/views/home_view.dart';
import 'package:management_vball/presentation/views/player_view.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    AutoRoute(page: HomeView, initial: true),
    AutoRoute(page: PlayerView),
  ],
)
class $AppRouter {}
