import 'package:flutter/material.dart';

class TabService {
  ValueNotifier<int> page = ValueNotifier(0);

  // ignore: use_setters_to_change_properties
  void changePage(int page) {
    this.page.value = page;
  }
}
