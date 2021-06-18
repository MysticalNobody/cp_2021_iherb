import 'app_colors.dart';
import 'package:flutter/material.dart';


class AppTextTheme{
  static final TextTheme lightTextTheme = TextTheme(
    headline1: _headline1,
    headline2: _headline2,
    headline3: _headline3,
    headline4: _headline4,
    headline5: _headline5,
    headline6: _headline6,
    button: _button,
    subtitle1: _subtitle1,
    subtitle2: _subtitle2,
    bodyText1: _bodyText1,
    bodyText2: _bodyText2,
  );

  static final TextTheme darkTextTheme = TextTheme(
    headline1: _headline1.copyWith(color: Colors.white),
    headline2: _headline2.copyWith(color: Colors.white),
    headline3: _headline3.copyWith(color: Colors.white),
    headline4: _headline4.copyWith(color: Colors.white),
    headline5: _headline5.copyWith(color: Colors.white),
    headline6: _headline6.copyWith(color: Colors.white),
    button: _button.copyWith(color: AppColor.headlineTextColor),
    subtitle1: _subtitle1.copyWith(color: Colors.white),
    subtitle2: _subtitle2.copyWith(color: Colors.white),
    bodyText1: _bodyText1.copyWith(color: AppColor.primary),
    bodyText2: _bodyText2.copyWith(color: AppColor.secondaryBg),
  );
  static final TextStyle _headline1 = TextStyle(
    color: AppColor.headlineTextColor,
    fontFamily: "DellaRespira",
    fontSize: 48,
  );
  static final TextStyle _headline2 = TextStyle(
    fontFamily: "Lato",
    color: AppColor.headlineTextColor,
    fontSize: 32,
  );
  static final TextStyle _headline3 = TextStyle(
    color: AppColor.headlineTextColor,
    fontFamily: "Lato",
    fontSize: 24,
  );
  static final TextStyle _headline4 = TextStyle(
    color: AppColor.headlineTextColor,
    fontWeight: FontWeight.w900,
    fontFamily: "Lato",
    fontSize: 18,
  );
  static final TextStyle _headline5 = TextStyle(
    color: AppColor.headlineTextColor,
    fontWeight: FontWeight.w900,
    fontFamily: "Lato",
    fontSize: 16,
  );
  static final TextStyle _headline6 = TextStyle(
    color: AppColor.subTitleTextColor,
    fontWeight: FontWeight.w600,
    fontFamily: "Lato",
    fontSize: 16,
  );

  static final TextStyle _button = TextStyle(
    color: Colors.white,
    fontWeight: FontWeight.w900,
    fontFamily: "Lato",
    fontSize: 18,
  );

  static final TextStyle _subtitle1 = TextStyle(
    color: AppColor.headlineTextColor,
    fontWeight: FontWeight.w900,
    fontFamily: "Lato",
    fontSize: 14,
  );

  static final TextStyle _subtitle2 = TextStyle(
    color: AppColor.subTitleTextColor,
    fontWeight: FontWeight.w900,
    fontFamily: "Lato",
    fontSize: 14,
  );

  static final TextStyle _bodyText1 = TextStyle(
    color: AppColor.headlineTextColor,
    fontFamily: "Poppins",
    fontSize: 12,
    letterSpacing: 1,
  );

  static final TextStyle _bodyText2 = TextStyle(
    color: AppColor.subTitleTextColor,
    fontFamily: "Poppins",
    fontSize: 12,
    letterSpacing: 1,

  );
}