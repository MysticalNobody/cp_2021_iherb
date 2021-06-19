import 'package:iherb/data/data_source/auth/remote/auth_api.dart';
import 'package:iherb/data/models/article_model.dart';
import 'package:iherb/data/models/good_model.dart';
import 'package:iherb/data/models/quiz_model.dart';

import '../../interfaces/data_source.dart';
import 'content_api.dart';

/// Interface for Content data source module

abstract class ContentApiDataSource implements AppDataSource {
  ContentApiDataSource(this.api);
  final ContentApi api;

  Future<List<ArticleModel>> getArticles();
  Future<List<GoodModel>> getGoods();
  Future<List<QuizModel>> getQuizes();
}
