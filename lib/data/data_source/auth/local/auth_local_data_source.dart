import 'dart:async';

import 'package:hive/hive.dart';
import 'package:iherb/data/models/user_model.dart';

abstract class AuthLocalDataSource {
  late String key;
  late Box box;

  Completer inited = Completer();

  Future<void> init();

  Future<void> saveUser(UserModel user);

  Future<UserModel?> getUser();

  Future<void> clear();
}
