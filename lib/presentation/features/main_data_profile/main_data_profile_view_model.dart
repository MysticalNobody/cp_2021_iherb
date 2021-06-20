import 'package:flutter/material.dart';
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
    weightController.text = user?.weight?.toString() ?? '';
    heightController.text = user?.height?.toString() ?? '';
    weightFocusNode.addListener(() {
      if (!weightFocusNode.hasFocus) {
        final res = int.tryParse(weightController.text);
        if (res != null) {
          final _user = user;
          _user?.weight = res;
          onChangeUser(_user!);
        }
      }
    });
    heightFocusNode.addListener(() {
      if (!heightFocusNode.hasFocus) {
        final res = int.tryParse(heightController.text);
        if (res != null) {
          final _user = user;
          _user?.height = res;
          onChangeUser(_user!);
        }
      }
    });
  }
  TextEditingController weightController = TextEditingController();
  FocusNode weightFocusNode = FocusNode();
  TextEditingController heightController = TextEditingController();
  FocusNode heightFocusNode = FocusNode();
  final AuthService _authService;

  UserModel? user;

  Future<void> onChangeUser(UserModel newUser) async {
    runBusyFuture(_authService.register(newUser));
  }

  int getYears(DateTime birthDate) {
    DateTime today = DateTime.now();

    int yearDiff = today.year - birthDate.year;

    return yearDiff;
  }

  @override
  List<ReactiveServiceMixin> get reactiveServices => [_authService];
}
