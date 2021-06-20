import 'package:iherb/data/data_source/auth/remote/auth_api.dart';
import 'package:iherb/data/models/user_model.dart';

import '../../interfaces/data_source.dart';

/// Interface for Auth data source module

abstract class AuthApiDataSource implements AppDataSource {
  AuthApiDataSource(this.api);
  final AuthApi api;

  Future<String> register(UserModel user);

  Future<UserModel> getUser(String id);
}
