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
    if (service.token.value != null) {
      _log.v("Navigation to HomeViewRoute");
      App.router.replace(HomeViewRoute());
    } else {
      App.router.replace(QuestionnaireViewRoute());
    }
  }
}
