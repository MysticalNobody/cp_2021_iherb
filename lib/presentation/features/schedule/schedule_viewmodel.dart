import 'package:flutter/material.dart';
import 'package:iherb/presentation/theme/icons_and_images.dart';
import 'package:stacked/stacked.dart';
import 'package:iherb/core/utils/utils.dart';

class Vitamin {
  final String count;
  final String when;
  final String name;
  final TimeOfDay time;
  final List<Color> colors;
  final String asset;

  Vitamin({
    required this.count,
    required this.when,
    required this.name,
    required this.time,
    required this.colors,
    required this.asset,
  });
}

class ScheduleViewModel extends BaseViewModel {
  ScheduleViewModel();

  final log = getLogger('ScheduleViewModel');

  final List<Vitamin> vitamins = [
    Vitamin(
      count: '1 таблетка',
      when: 'после еды',
      name: 'Витамин D, 5 мг',
      asset: AppImages.imagesDpill,
      time: TimeOfDay(
        hour: 8,
        minute: 30,
      ),
      colors: [
        Color(0xFF30A885),
        Color(0xFF41C59E),
      ],
    ),
    Vitamin(
      count: '1 таблетка',
      when: 'до еды',
      name: 'Витамин C, 10 мг',
      asset: AppImages.imagesCpill,
      time: TimeOfDay(
        hour: 14,
        minute: 0,
      ),
      colors: [
        Color(0xFF367599),
        Color(0xFF5396BB),
      ],
    ),
    Vitamin(
      count: '1 таблетка',
      when: 'во время еды',
      name: 'Витамин B, 2 мг',
      asset: AppImages.imagesBpill,
      time: TimeOfDay(
        hour: 19,
        minute: 30,
      ),
      colors: [
        Color(0xFFAF7738),
        Color(0xFFC0823A),
      ],
    ),
  ];

  DateTime selectedDate = DateTime.now();
  int selectedTab = 1;

  void selectDate(DateTime date) {
    selectedDate = date;
    notifyListeners();
  }

  void selectTab(int index) {
    selectedTab = index;
    notifyListeners();
  }
}
