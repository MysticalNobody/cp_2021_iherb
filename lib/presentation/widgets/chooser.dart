import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iherb/presentation/features/pickers/date/date_ios.dart';
import 'package:iherb/presentation/features/pickers/sex/sex_android.dart';
import 'package:iherb/presentation/features/pickers/sex/sex_ios.dart';

abstract class AppChooser {
  static Future<int?> sex(BuildContext context) async {
    if (Platform.isIOS)
      return showCupertinoModalPopup<int?>(
        context: context,
        builder: (context) => const SexCupertinoActionSheet(),
      );
    else
      return showModalBottomSheet<int?>(
        context: context,
        builder: (context) => const SexBottomSheetPicker(),
      );
  }

  static Future<DateTime?> dateOfBirth(BuildContext context) async {
    if (Platform.isIOS)
      return showModalBottomSheet<DateTime?>(
        context: context,
        builder: (context) => IosDatePicker(
          currentDate: DateTime.now(),
        ),
      );
    else
      return showDatePicker(
        context: context,
        firstDate: DateTime(1920),
        initialDate: DateTime(1990),
        lastDate: DateTime.now(),
        cancelText: 'Отмена',
        confirmText: 'Сохранить',
        currentDate: DateTime.now(),
        initialDatePickerMode: DatePickerMode.year,
      );
  }

  static Future<DateTime?> date(BuildContext context,
      {DateTime? initial, DateTime? lastDay}) async {
    if (Platform.isIOS)
      return showModalBottomSheet<DateTime?>(
        context: context,
        builder: (context) => IosDatePicker(
          currentDate: initial ?? DateTime.now(),
        ),
      );
    else
      return showDatePicker(
        context: context,
        firstDate: DateTime(1920),
        initialDate: initial ?? DateTime.now(),
        lastDate: lastDay ?? DateTime.now().add(Duration(days: 7)),
        cancelText: 'Отмена',
        confirmText: 'Сохранить',
      );
  }

  static Future<TimeOfDay?> time(BuildContext context,
      {required TimeOfDay initial}) async {
    //TODO: добавить iOS picker
    return showTimePicker(context: context, initialTime: initial);
  }
}
