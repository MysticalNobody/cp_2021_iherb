import 'package:dio/dio.dart';
import 'package:iherb/data/models/token_response.dart';
import 'package:iherb/data/models/user_model.dart';
import 'package:retrofit/retrofit.dart';
import 'package:iherb/data/models/auth_model.dart';

part 'auth_api.g.dart';

@RestApi(baseUrl: '')
abstract class AuthApi {
  factory AuthApi(Dio dio, {String baseUrl}) = _AuthApi;

  @POST('users/register')
  Future<TokenResponse> register(
    @Body() UserModel userModel,
  );

  @GET('users/{id}')
  Future<UserModel> getUser(
    @Path('id') String id,
  );
}
