import 'package:iherb/domain/services/auth_service.dart';
import 'package:stacked/stacked.dart';
import 'package:iherb/core/utils/utils.dart';

class ProfileViewModel extends ReactiveViewModel {
  ProfileViewModel(this._authService);

  final AuthService _authService;

  final log = getLogger('ProfileViewModel');

  bool remind = true;

  void setRemind(bool remind) {
    this.remind = remind;
    notifyListeners();
  }

  @override
  List<ReactiveServiceMixin> get reactiveServices => [_authService];
}
