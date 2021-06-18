import 'package:iherb/core/utils/logger.dart';
import 'package:iherb/data/data_source/auth/local/auth_local_data_source.dart';
import 'package:iherb/data/data_source/auth/remote/auth_api_data_source.dart';
import 'package:iherb/domain/repository/auth/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthApiDataSource remoteDataSource;
  final AuthLocalDataSource localDataSource;

  AuthRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
  });

  final _log = getLogger('AuthRepositoryImpl');

  @override
  Future<bool> signUp(String token) async {
    await localDataSource.setToken(token);
    return true;
  }

  @override
  Future<bool> signIn(String token) async {
    await localDataSource.setToken(token);
    return true;
  }

  @override
  signOut() {
    //todo network logic
    localDataSource.clear();
  }

  @override
  Future<String?> getToken() async {
    if (!localDataSource.inited.isCompleted) {
      await localDataSource.inited.future;
    }
    return localDataSource.getToken();
  }
}
