import 'package:stacked/stacked.dart';
import 'package:iherb/app/app.dart';
import 'package:iherb/core/utils/logger.dart';
import 'package:iherb/domain/services/auth_service.dart';
import 'package:iherb/presentation/navigation/app_route.gr.dart';

class RootViewModel extends BaseViewModel {
  final AuthService service;

  RootViewModel({required this.service});

  final _log = getLogger('RootViewModel');

  call() {
    service.token.listen((v) {
      if (v?.isEmpty ?? true) {
        _log.v("Navigation to LoginView");
        App.router.replace(LoginViewRoute());
      } else {
        _log.v("Navigation to HomeViewRoute");
        App.router.replace(HomeViewRoute());
      }
    });
  }
}
