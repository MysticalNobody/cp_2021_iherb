import 'package:iherb/data/models/user_model.dart';
import 'package:iherb/domain/services/auth_service.dart';
import 'package:stacked/stacked.dart';

class MainDataProfileViewModel extends ReactiveViewModel {
  MainDataProfileViewModel(this._authService) {
    user = _authService.user.value;
    _authService.user.onChange.listen((event) {
      user = _authService.user.value;
      notifyListeners();
    });
  }
  final AuthService _authService;

  UserModel? user;

  Future<void> onChangeUser(UserModel newUser) async {
    runBusyFuture(_authService.register(newUser));
  }

  @override
  List<ReactiveServiceMixin> get reactiveServices => [_authService];
}
