import 'package:iherb/data/data_source/auth/remote/auth_api.dart';

import '../../interfaces/data_source.dart';

/// Interface for Auth data source module

abstract class AuthApiDataSource implements AppDataSource {
  AuthApiDataSource(this.api);
  final AuthApi api;

  Future<String> signIn(String login, String password);

  Future<String> signUp(String login, String password);

  Future<void> signOut();
}
