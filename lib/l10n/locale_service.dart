import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:iherb/generated/l10n.dart';



class LocaleProvider extends ChangeNotifier {
  Locale? _locale;

  Locale? get locale => _locale;

  void setLocale(Locale locale) {
    if (!S.delegate.supportedLocales.contains(locale)) return;
    _locale = locale;
    notifyListeners();
  }

  void clearLocale() {
    _locale = null;
    notifyListeners();
  }

   String getFlag(String code) {
    switch (code) {
      case 'ru':
        return '🇷🇺';
      case 'en':
      default:
        return '🇺🇸';
    }
  }
}
