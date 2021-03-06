import 'package:auto_route/annotations.dart';
import 'package:iherb/presentation/features/article/article_view.dart';
import 'package:iherb/presentation/features/home/home_view.dart';
import 'package:iherb/presentation/features/main_data_profile/main_data_profile_view.dart';
import 'package:iherb/presentation/features/mascot/mascot_view.dart';
import 'package:iherb/presentation/features/questionnaire/questionnaire_view.dart';
import 'package:iherb/presentation/features/root/root_view.dart';
import 'package:iherb/presentation/features/splash/splash_view.dart';

@AdaptiveAutoRouter(
  preferRelativeImports: true,
  routes: [
    AutoRoute(
      initial: true,
      fullscreenDialog: true,
      page: SplashView,
    ),
    AutoRoute(page: RootView),
    AutoRoute(page: HomeView),
    AutoRoute(page: MainDataProfileView),
    AutoRoute(page: QuestionnaireView),
    AutoRoute(
      page: MascotView,
      fullscreenDialog: true,
    ),
    AutoRoute(page: ArticleView)
  ],
)
class $AppRoutes {}
