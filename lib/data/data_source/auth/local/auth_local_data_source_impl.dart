import 'dart:async';

import 'package:hive/hive.dart';
import 'package:iherb/data/data_source/auth/local/auth_local_data_source.dart';

class AuthLocalDataSourceImpl implements AuthLocalDataSource {
  AuthLocalDataSourceImpl() {
    init();
  }
  late Box box;

  @override
  Future<String?> getToken() async {
    if (!inited.isCompleted) {
      await inited.future;
    }
    return box.get(key);
  }

  @override
  Future<void> setToken(String token) {
    return box.put(key, token);
  }

  @override
  String key = 'token';

  @override
  Completer inited = Completer();

  @override
  Future<void> init() async {
    box = await Hive.openBox<String>(key);
    inited.complete();
  }

  @override
  Future<void> clear() async {
    await box.clear();
  }
}
