import 'package:iherb/app/app.dart';
import 'package:iherb/data/models/user_model.dart';
import 'package:iherb/domain/services/auth_service.dart';
import 'package:iherb/presentation/navigation/app_route.gr.dart';
import 'package:stacked/stacked.dart';

class QuestionnaireViewModel extends BaseViewModel {
  QuestionnaireViewModel(this._authService);
  final AuthService _authService;
  UserModel user = UserModel();
  int page = 0;

  void setPage(int page) {
    this.page = page;
    notifyListeners();
  }

  signIn() async {
    await runBusyFuture(_authService.register(user));
    App.router.replace(RootViewRoute());
  }
}
