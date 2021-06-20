import 'dart:async';

import 'package:hive/hive.dart';
import 'package:iherb/data/data_source/auth/local/auth_local_data_source.dart';
import 'package:iherb/data/models/user_model.dart';

class AuthLocalDataSourceImpl implements AuthLocalDataSource {
  AuthLocalDataSourceImpl() {
    init();
  }
  late Box box;

  @override
  Future<UserModel?> getUser() async {
    if (!inited.isCompleted) {
      await inited.future;
    }
    return box.get(key);
  }

  @override
  String key = 'user';

  @override
  Completer inited = Completer();

  @override
  Future<void> init() async {
    box = await Hive.openBox<UserModel>(key);
    inited.complete();
  }

  @override
  Future<void> clear() async {
    await box.clear();
  }

  @override
  Future<void> saveUser(UserModel user) async {
    await clear();
    box.put(key, user);
  }
}
