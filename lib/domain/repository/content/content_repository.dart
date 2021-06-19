import 'dart:async';

import 'package:iherb/data/models/article_model.dart';
import 'package:iherb/data/models/good_model.dart';
import 'package:iherb/data/models/quiz_model.dart';

abstract class ContentRepository {
  Future<List<ArticleModel>> getArticles();
  Future<List<GoodModel>> getGoods();
  Future<List<QuizModel>> getQuizes();
}
