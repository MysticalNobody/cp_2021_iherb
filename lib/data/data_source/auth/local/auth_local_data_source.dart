import 'dart:async';

import 'package:hive/hive.dart';

abstract class AuthLocalDataSource {
  late String key;
  late Box box;

  Completer inited = Completer();

  Future<void> init();

  Future<String?> getToken();

  Future<void> clear();

  Future<void> setToken(String token);
}
