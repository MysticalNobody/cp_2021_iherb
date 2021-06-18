import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'app_colors.dart';
import 'app_text_theme.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: AppColor.bg,
    backgroundColor: AppColor.bg,
    brightness: Brightness.light,
    primaryColor: AppColor.headlineTextColor,
    textTheme: AppTextTheme.lightTextTheme,
    visualDensity: VisualDensity.adaptivePlatformDensity,
  );
}
