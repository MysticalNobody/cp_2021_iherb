import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:iherb/generated/l10n.dart';
import 'package:iherb/l10n/locale_service.dart';
import 'package:stacked_themes/stacked_themes.dart';
import '../presentation/navigation/app_route.gr.dart';
import '../presentation/theme/app_theme.dart';
import 'package:provider/provider.dart';

class App extends StatelessWidget {
  static final router = AppRoutes();

  @override
  Widget build(BuildContext context) {
    final appName = env['APP_NAME']!;
    return ThemeBuilder(
        defaultThemeMode: ThemeMode.light,
        lightTheme: AppTheme.lightTheme,
        builder: (context, regularTheme, darkTheme, themeMode) {
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
              theme: regularTheme,
              darkTheme: darkTheme,
              themeMode: themeMode,
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
            );
          }
        });
  }
}
