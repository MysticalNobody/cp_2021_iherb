import 'dart:async';

import 'package:iherb/data/models/user_model.dart';

abstract class AuthRepository {
  Future<String> register(UserModel user);
  Future<UserModel?> getUser({String id});
  Future<void> saveUser(UserModel userModel);
}
