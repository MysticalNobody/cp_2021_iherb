import 'package:stacked/stacked.dart';
import 'package:iherb/app/app.dart';
import 'package:iherb/core/utils/utils.dart';
import 'package:iherb/domain/services/auth_service.dart';
import 'package:iherb/presentation/navigation/app_route.gr.dart';

class SplashViewModel extends BaseViewModel {
  final AuthService authService;

  final _log = getLogger('SplashViewModel');

  SplashViewModel({required this.authService});

  Future<void> runStartupLogic() async {
    _log.v('Running startup logic ...');
    await authService.inited.future;
    App.router.replace(RootViewRoute());
  }
}
