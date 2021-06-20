import 'dart:async';

import 'package:iherb/data/models/article_model.dart';
import 'package:iherb/data/models/good_model.dart';
import 'package:iherb/data/models/product_model.dart';
import 'package:iherb/data/models/quiz_model.dart';

abstract class ContentRepository {
  Future<List<ArticleModel>> getArticles();
  Future<List<ProductModel>> getGoods();
  Future<List<QuizModel>> getQuizes();
}
