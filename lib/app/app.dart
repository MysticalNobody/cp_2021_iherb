import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:iherb/generated/l10n.dart';
import 'package:iherb/l10n/locale_service.dart';
import 'package:iherb/presentation/theme/app_colors.dart';
import '../presentation/navigation/app_route.gr.dart';
import 'package:provider/provider.dart';

class App extends StatelessWidget {
  static final router = AppRoutes();

  @override
  Widget build(BuildContext context) {
    final appName = env['APP_NAME']!;
    if (Platform.isAndroid) {
      return MaterialApp.router(
        title: appName,
        debugShowCheckedModeBanner: false,

        //navigation
        routerDelegate: router.delegate(),
        routeInformationParser: router.defaultRouteParser(),

        //internalization
        locale: context.watch<LocaleProvider>().locale,
        supportedLocales: S.delegate.supportedLocales,
        localizationsDelegates: [
          S.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate
        ],

        //theming
        color: AppColor.primary,
        theme: ThemeData.from(
          colorScheme: ColorScheme(
            primary: AppColor.primary,
            primaryVariant: AppColor.primary,
            secondary: AppColor.subTitleTextColor,
            secondaryVariant: AppColor.subTitleTextColor,
            surface: AppColor.white,
            background: AppColor.bg,
            error: AppColor.red,
            onPrimary: AppColor.white,
            onSecondary: AppColor.white,
            onSurface: AppColor.primary,
            onBackground: AppColor.primary,
            onError: AppColor.white,
            brightness: Brightness.light,
          ),
        ),
      );
    } else {
      return CupertinoApp.router(
        title: appName,
        debugShowCheckedModeBanner: false,
        //internalization
        locale: context.watch<LocaleProvider>().locale,
        supportedLocales: S.delegate.supportedLocales,
        localizationsDelegates: [
          S.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate
        ],
        //navigation
        routerDelegate: router.delegate(),
        routeInformationParser: router.defaultRouteParser(),

        //theming
        color: AppColor.primary,
        theme: CupertinoThemeData(
          barBackgroundColor: AppColor.white,
          brightness: Brightness.light,
          primaryColor: AppColor.primary,
        ),
      );
    }
  }
}
