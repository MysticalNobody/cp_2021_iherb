import 'dart:async';
import 'dart:ui';

import 'package:iherb/data/models/article_model.dart';
import 'package:iherb/data/models/good_model.dart';
import 'package:iherb/data/models/quiz_model.dart';

import 'content_local_data_source.dart';

class ContentLocalDataSourceImpl implements ContentLocalDataSource {
  ContentLocalDataSourceImpl();

  @override
  Future<List<ArticleModel>> getArticles() async {
    return [
      ArticleModel(
        photo:
            'https://i.insider.com/59934310b0e0b595758b45f2?width=1067&format=jpeg',
        tags: ['витамины', 'мнение'],
        text:
            'По биохимическим свойствам все витамины делятся на две группы: жирорастворимые и водорастворимые. Жирорастворимые витамины (A, D, E, K) способны всасываться в кишечнике только при наличии липидов и желчных кислот. Водорастворимые витамины (C, B1, B5, B6) не накапливаются в тканях, и их избыток удаляется из организма с мочой.',
        title: 'Все о витаминах: рекомендации экспертов',
      ),
    ];
  }

  @override
  Future<List<GoodModel>> getGoods() async {
    return [
      GoodModel(
        photo: 'https://s3.images-iherb.com/now/now00367/w/10.jpg',
        price: '218.46',
        title: 'Now Foods, высокоактивный витамин D-3',
        url: '',
      ),
    ];
  }

  @override
  Future<List<QuizModel>> getQuizes() async {
    return [
      QuizModel(
        photo: 'https://s3.images-iherb.com/now/now00367/w/10.jpg',
        tags: ['опросы', 'люди'],
        title: 'Насколько вы знаете себя? Готовы проверить?',
        color: Color(0xFF367599),
      ),
    ];
  }
}
