import 'dart:async';

import 'package:stacked/stacked.dart';

abstract class AuthRepository {
  Future<bool> signIn(String token);

  signOut();

  Future<bool> signUp(String token);

  Future<String?> getToken();
}
