import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:iherb/data/models/auth_model.dart';

part 'auth_api.g.dart';

@RestApi(baseUrl: '')
abstract class AuthApi {
  factory AuthApi(Dio dio, {String baseUrl}) = _AuthApi;

  @GET('auth')
  Future<List<AuthModel>> signIn();
}
