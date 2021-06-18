import 'package:auto_route/annotations.dart';
import 'package:iherb/presentation/features/home/home_view.dart';
import 'package:iherb/presentation/features/login/login_view.dart';
import 'package:iherb/presentation/features/root/root_view.dart';
import 'package:iherb/presentation/features/splash/splash_view.dart';

@AdaptiveAutoRouter(preferRelativeImports: true, routes: [
  AutoRoute(initial: true, fullscreenDialog: true, page: SplashView),
  AutoRoute(page: RootView),
  AutoRoute(page: LoginView),
  AutoRoute(page: HomeView),
])
class $AppRoutes {}
