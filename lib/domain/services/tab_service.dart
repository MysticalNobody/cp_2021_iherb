import 'package:flutter/material.dart';
import 'package:iherb/app/app.dart';
import 'package:iherb/presentation/navigation/app_route.gr.dart';

class TabService {
  ValueNotifier<int> page = ValueNotifier(0);

  bool showedMascot = false;

  // ignore: use_setters_to_change_properties
  void changePage(int page) {
    this.page.value = page;
    if (!showedMascot) {
      App.router.push(MascotViewRoute());
      showedMascot = true;
    }
  }
}
