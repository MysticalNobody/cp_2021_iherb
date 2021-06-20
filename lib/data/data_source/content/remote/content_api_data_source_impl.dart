import 'package:iherb/data/models/article_model.dart';
import 'package:iherb/data/models/good_model.dart';
import 'package:iherb/data/models/product_model.dart';
import 'package:iherb/data/models/quiz_model.dart';

import 'content_api.dart';
import 'content_api_data_source.dart';

class ContentApiDataSourceImpl implements ContentApiDataSource {
  ContentApiDataSourceImpl(this.api);
  final ContentApi api;

  @override
  Future<List<ArticleModel>> getArticles() async {
    final res = await api.getArticles();
    return res.feed;
  }

  @override
  Future<List<ProductModel>> getGoods() async {
    final res = await api.getGoods();
    return res.result;
  }

  @override
  Future<List<QuizModel>> getQuizes() {
    return api.getQuizes();
  }
}
