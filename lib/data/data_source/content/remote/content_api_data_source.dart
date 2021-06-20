import 'package:iherb/data/models/article_model.dart';
import 'package:iherb/data/models/product_model.dart';
import 'package:iherb/data/models/quiz_model.dart';

import '../../interfaces/data_source.dart';
import 'content_api.dart';

/// Interface for Content data source module

abstract class ContentApiDataSource implements AppDataSource {
  ContentApiDataSource(this.api);
  final ContentApi api;

  Future<List<ArticleModel>> getArticles();
  Future<List<ProductModel>> getGoods();
  Future<List<QuizModel>> getQuizes();
}
