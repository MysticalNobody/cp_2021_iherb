import 'dart:async';
import 'package:iherb/data/models/article_model.dart';
import 'package:iherb/data/models/product_model.dart';
import 'package:iherb/data/models/quiz_model.dart';
import 'package:iherb/domain/repository/content/content_repository.dart';

class ContentService {
  ContentService({required this.contentRepository}) {
    init();
  }

  final ContentRepository contentRepository;

  Completer inited = Completer();

  List<ArticleModel> articles = [];
  List<ProductModel> products = [];
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
    products = await contentRepository.getGoods();
  }

  Future<void> fetchQuizes() async {
    quizes = await contentRepository.getQuizes();
  }
}
