import 'package:stacked/stacked.dart';
import 'package:iherb/core/utils/utils.dart';

class ProfileViewModel extends BaseViewModel {
  ProfileViewModel();

  final log = getLogger('ProfileViewModel');

  bool remind = true;

  void setRemind(bool remind) {
    this.remind = remind;
    notifyListeners();
  }
}
