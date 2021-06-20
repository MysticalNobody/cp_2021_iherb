import 'package:iherb/core/utils/logger.dart';
import 'package:iherb/data/data_source/auth/local/auth_local_data_source.dart';
import 'package:iherb/data/data_source/auth/remote/auth_api_data_source.dart';
import 'package:iherb/data/models/user_model.dart';
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
  Future<UserModel?> getUser({String? id}) async {
    final localUser = await localDataSource.getUser();
    if (localUser != null) return localUser;
    if (id != null) return remoteDataSource.getUser(id);
  }

  @override
  Future<String> register(UserModel user) {
    return remoteDataSource.register(user);
  }

  @override
  Future<void> saveUser(UserModel userModel) async {
    await localDataSource.saveUser(userModel);
  }
}
