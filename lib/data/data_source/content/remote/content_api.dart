import 'package:dio/dio.dart';
import 'package:iherb/data/models/article_model.dart';
import 'package:iherb/data/models/good_model.dart';
import 'package:iherb/data/models/quiz_model.dart';
import 'package:retrofit/retrofit.dart';
import 'package:iherb/data/models/auth_model.dart';

part 'content_api.g.dart';

@RestApi(baseUrl: '')
abstract class ContentApi {
  factory ContentApi(Dio dio, {String baseUrl}) = _ContentApi;

  @GET('articles')
  Future<List<ArticleModel>> getArticles();

  @GET('goods')
  Future<List<GoodModel>> getGoods();

  @GET('quizes')
  Future<List<QuizModel>> getQuizes();
}
