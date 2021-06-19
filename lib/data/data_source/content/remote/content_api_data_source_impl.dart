import 'package:iherb/data/models/article_model.dart';
import 'package:iherb/data/models/good_model.dart';
import 'package:iherb/data/models/quiz_model.dart';

import 'content_api.dart';
import 'content_api_data_source.dart';

class ContentApiDataSourceImpl implements ContentApiDataSource {
  ContentApiDataSourceImpl(this.api);
  final ContentApi api;

  @override
  Future<List<ArticleModel>> getArticles() {
    return api.getArticles();
  }

  @override
  Future<List<GoodModel>> getGoods() {
    return api.getGoods();
  }

  @override
  Future<List<QuizModel>> getQuizes() {
    return api.getQuizes();
  }
}
