import 'package:dio/dio.dart';
import 'package:iherb/data/models/article_response.dart';
import 'package:iherb/data/models/products_response.dart';
import 'package:iherb/data/models/quiz_model.dart';
import 'package:retrofit/retrofit.dart';

part 'content_api.g.dart';

@RestApi(baseUrl: '')
abstract class ContentApi {
  factory ContentApi(Dio dio, {String baseUrl}) = _ContentApi;

  @GET('feed')
  Future<ArticleResponse> getArticles();

  @GET('products')
  Future<ProductsResponse> getGoods();

  @GET('quizes')
  Future<List<QuizModel>> getQuizes();
}
