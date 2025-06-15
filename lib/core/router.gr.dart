// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i4;
import 'package:flutter/material.dart' as _i5;

import '../presentation/views/home_view.dart' as _i1;
import '../presentation/views/player_view.dart' as _i2;
import '../presentation/views/rotation_manager_view.dart' as _i3;

class AppRouter extends _i4.RootStackRouter {
  AppRouter([_i5.GlobalKey<_i5.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i4.PageFactory> pagesMap = {
    HomeView.name: (routeData) {
      return _i4.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i1.HomeView(),
      );
    },
    PlayerView.name: (routeData) {
      return _i4.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i2.PlayerView(),
      );
    },
    RotationManagerView.name: (routeData) {
      return _i4.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i3.RotationManagerView(),
      );
    },
  };

  @override
  List<_i4.RouteConfig> get routes => [
        _i4.RouteConfig(
          HomeView.name,
          path: '/',
        ),
        _i4.RouteConfig(
          PlayerView.name,
          path: '/player-view',
        ),
        _i4.RouteConfig(
          RotationManagerView.name,
          path: '/rotation-manager-view',
        ),
      ];
}

/// generated route for
/// [_i1.HomeView]
class HomeView extends _i4.PageRouteInfo<void> {
  const HomeView()
      : super(
          HomeView.name,
          path: '/',
        );

  static const String name = 'HomeView';
}

/// generated route for
/// [_i2.PlayerView]
class PlayerView extends _i4.PageRouteInfo<void> {
  const PlayerView()
      : super(
          PlayerView.name,
          path: '/player-view',
        );

  static const String name = 'PlayerView';
}

/// generated route for
/// [_i3.RotationManagerView]
class RotationManagerView extends _i4.PageRouteInfo<void> {
  const RotationManagerView()
      : super(
          RotationManagerView.name,
          path: '/rotation-manager-view',
        );

  static const String name = 'RotationManagerView';
}
