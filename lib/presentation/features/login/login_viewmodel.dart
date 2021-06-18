import 'dart:async';

import 'package:stacked/stacked.dart';
import 'package:iherb/app/app.dart';
import 'package:iherb/core/utils/utils.dart';
import 'package:iherb/domain/services/auth_service.dart';
import 'package:iherb/presentation/navigation/app_route.gr.dart';
import 'package:iherb/presentation/widgets/reactive_scaffold.dart';

class LoginViewModel extends BaseViewModel {
  final AuthService authService;

  LoginViewModel({
    required this.authService,
  });

  final log = getLogger('Login ViewModel');

  void signIn() async {
    log.v('Authenticating ...');
    setBusy(true);
    await authService.signIn();
    App.router.replace(HomeViewRoute());
    setBusy(false);
  }
}
