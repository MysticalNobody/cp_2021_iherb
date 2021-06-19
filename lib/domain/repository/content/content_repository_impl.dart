import 'package:iherb/core/utils/logger.dart';
import 'package:iherb/data/data_source/auth/local/auth_local_data_source.dart';
import 'package:iherb/data/data_source/auth/remote/auth_api_data_source.dart';
import 'package:iherb/data/data_source/content/local/content_local_data_source.dart';
import 'package:iherb/data/data_source/content/remote/content_api_data_source.dart';
import 'package:iherb/data/models/article_model.dart';
import 'package:iherb/data/models/good_model.dart';
import 'package:iherb/data/models/quiz_model.dart';
import 'package:iherb/domain/repository/auth/auth_repository.dart';

import 'content_repository.dart';

class ContentRepositoryImpl implements ContentRepository {
  final ContentApiDataSource remoteDataSource;
  final ContentLocalDataSource localDataSource;

  ContentRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
  });

  final _log = getLogger('ContentRepositoryImpl');

  @override
  Future<List<ArticleModel>> getArticles() {
    return localDataSource.getArticles();
  }

  @override
  Future<List<GoodModel>> getGoods() {
    return localDataSource.getGoods();
  }

  @override
  Future<List<QuizModel>> getQuizes() {
    return localDataSource.getQuizes();
  }
}
