import 'package:iherb/data/data_source/auth/remote/auth_api.dart';
import 'package:iherb/data/data_source/auth/remote/auth_api_data_source.dart';
import 'package:iherb/data/models/user_model.dart';

class AuthApiDataSourceImpl implements AuthApiDataSource {
  AuthApiDataSourceImpl(this.api);
  final AuthApi api;

  @override
  Future<String> register(UserModel user) async {
    final res = await api.register(user);
    return res.id;
  }

  @override
  Future<UserModel> getUser(String id) {
    return api.getUser(id);
  }
}
