import 'package:iherb/data/data_source/auth/remote/auth_api.dart';
import 'package:iherb/data/data_source/auth/remote/auth_api_data_source.dart';

class AuthApiDataSourceImpl implements AuthApiDataSource {
  AuthApiDataSourceImpl(this.api);
  final AuthApi api;

  @override
  Future<String> signIn(String login, String password) {
    return Future.value('token');
  }

  @override
  Future<void> signOut() async {
    await Future.delayed(Duration(seconds: 2));
  }

  @override
  Future<String> signUp(String login, String password) {
    return Future.value('token');
  }
}
