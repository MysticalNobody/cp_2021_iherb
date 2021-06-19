import 'dart:async';
import 'package:iherb/data/models/article_model.dart';
import 'package:iherb/data/models/good_model.dart';
import 'package:iherb/data/models/quiz_model.dart';
import 'package:iherb/domain/repository/content/content_repository.dart';

class ContentService {
  ContentService({required this.contentRepository}) {
    init();
  }

  final ContentRepository contentRepository;

  Completer inited = Completer();

  List<ArticleModel> articles = [];
  List<GoodModel> goods = [];
  List<QuizModel> quizes = [];

  Future<void> init() async {
    await Future.wait([
      fetchArticles(),
      fetchGoods(),
      fetchQuizes(),
    ]);
    inited.complete();
  }

  Future<void> fetchArticles() async {
    articles = await contentRepository.getArticles();
  }

  Future<void> fetchGoods() async {
    goods = await contentRepository.getGoods();
  }

  Future<void> fetchQuizes() async {
    quizes = await contentRepository.getQuizes();
  }
}
