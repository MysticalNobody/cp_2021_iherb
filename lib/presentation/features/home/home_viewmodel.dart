import 'package:flutter/material.dart';
import 'package:iherb/presentation/theme/icons_and_images.dart';
import 'package:stacked/stacked.dart';
import 'package:iherb/core/utils/alert_action.dart';
import 'package:iherb/core/utils/daialog_util.dart';
import 'package:iherb/core/utils/utils.dart';
import 'package:iherb/domain/services/auth_service.dart';

class HomeViewModel extends BaseViewModel {
  HomeViewModel({required this.apiAuthService});
  final AuthService apiAuthService;
  final log = getLogger('HomeViewModel');
  final PageController pageController = PageController();

  int _page = 0;

  int get page => _page;
  set page(int value) {
    _page = value;
    pageController.animateToPage(
      value,
      duration: Duration(milliseconds: 300),
      curve: Curves.easeIn,
    );
    notifyListeners();
  }

  List<String> get bottomIcons => [
        AppIcons.iconsHome,
        AppIcons.iconsCalendar,
        AppIcons.iconsDrugs,
        AppIcons.iconsProfile,
      ];

  void setPage(int value) {
    page = value;
  }

  void logOut() async {
    log.v('Logging out ...');
    await runBusyFuture(apiAuthService.singOut());
  }

  void showSnack() {
    SnackBarUtils.show(
      message: 'Snack message',
      title: 'Snack title',
      actions: [AlertAction("Cancel"), AlertAction("Continue")],
    );
  }

  void showDialog() {
    DialogUtils.show(
      message: 'Dialog message',
      title: 'Title',
      actions: [AlertAction("Cancel"), AlertAction("Continue")],
    );
  }
}
