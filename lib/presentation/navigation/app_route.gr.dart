// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

import 'package:auto_route/auto_route.dart' as _i1;

import '../features/home/home_view.dart' as _i4;
import '../features/main_data_profile/main_data_profile_view.dart' as _i5;
import '../features/root/root_view.dart' as _i3;
import '../features/splash/splash_view.dart' as _i2;

class AppRoutes extends _i1.RootStackRouter {
  AppRoutes();

  @override
  final Map<String, _i1.PageFactory> pagesMap = {
    SplashViewRoute.name: (entry) {
      return _i1.AdaptivePage(
          entry: entry, child: _i2.SplashView(), fullscreenDialog: true);
    },
    RootViewRoute.name: (entry) {
      return _i1.AdaptivePage(entry: entry, child: _i3.RootView());
    },
    HomeViewRoute.name: (entry) {
      return _i1.AdaptivePage(entry: entry, child: _i4.HomeView());
    },
    MainDataProfileViewRoute.name: (entry) {
      return _i1.AdaptivePage(
          entry: entry, child: const _i5.MainDataProfileView());
    }
  };

  @override
  List<_i1.RouteConfig> get routes => [
        _i1.RouteConfig(SplashViewRoute.name, path: '/'),
        _i1.RouteConfig(RootViewRoute.name, path: '/root-view'),
        _i1.RouteConfig(HomeViewRoute.name, path: '/home-view'),
        _i1.RouteConfig(MainDataProfileViewRoute.name,
            path: '/main-data-profile-view')
      ];
}

class SplashViewRoute extends _i1.PageRouteInfo {
  const SplashViewRoute() : super(name, path: '/');

  static const String name = 'SplashViewRoute';
}

class RootViewRoute extends _i1.PageRouteInfo {
  const RootViewRoute() : super(name, path: '/root-view');

  static const String name = 'RootViewRoute';
}

class HomeViewRoute extends _i1.PageRouteInfo {
  const HomeViewRoute() : super(name, path: '/home-view');

  static const String name = 'HomeViewRoute';
}

class MainDataProfileViewRoute extends _i1.PageRouteInfo {
  const MainDataProfileViewRoute()
      : super(name, path: '/main-data-profile-view');

  static const String name = 'MainDataProfileViewRoute';
}
