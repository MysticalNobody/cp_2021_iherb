import 'dart:math';

import 'package:flutter/material.dart';
import 'package:iherb/domain/services/tab_service.dart';
import 'package:iherb/presentation/features/content/content_view.dart';
import 'package:iherb/presentation/features/drugs/drugs_view.dart';
import 'package:iherb/presentation/features/profile/profile_view.dart';
import 'package:iherb/presentation/features/schedule/schedule_view.dart';
import 'package:iherb/presentation/theme/icons_and_images.dart';
import 'package:stacked/stacked.dart';
import 'package:iherb/core/utils/alert_action.dart';
import 'package:iherb/core/utils/daialog_util.dart';
import 'package:iherb/core/utils/utils.dart';
import 'package:iherb/domain/services/auth_service.dart';

class HomeViewModel extends BaseViewModel {
  HomeViewModel({
    required this.apiAuthService,
    required this.tabService,
  }) {
    pageController.addListener(() {
      final newPage = tabService.page.value + 0.0;
      final firstValue = min(newPage, oldPage);
      final secondValue = max(newPage, oldPage);
      final value = pageController.page?.clamp(firstValue, secondValue);
      final x = (firstValue - (value ?? 0)).abs() / (firstValue - secondValue).abs();
      final _opacity = pow(2 * x.clamp(0.0, 1.0) - 1, 4);
      opacity.value = _opacity.toDouble();
    });
  }
  final AuthService apiAuthService;
  final TabService tabService;
  final log = getLogger('HomeViewModel');
  final PageController pageController = PageController();

  ReactiveValue<double> opacity = ReactiveValue<double>(1);
  int oldPage = 0;

  List<Widget> get pages => [
        ContentView(),
        ScheduleView(),
        DrugsView(),
        ProfileView(),
      ];

  List<String> get bottomIcons => [
        AppIcons.iconsHome,
        AppIcons.iconsCalendar,
        AppIcons.iconsDrugs,
        AppIcons.iconsProfile,
      ];

  void changePage(int index) {
    oldPage = tabService.page.value;
    tabService.changePage(index);
    pageController.animateToPage(
      index,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
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
