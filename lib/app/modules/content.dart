import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:iherb/data/data_source/content/local/content_local_data_source_impl.dart';
import 'package:iherb/data/data_source/content/remote/content_api.dart';
import 'package:iherb/data/data_source/content/remote/content_api_data_source_impl.dart';
import 'package:dio/dio.dart';
import 'package:iherb/domain/repository/content/content_repository_impl.dart';
import 'package:iherb/domain/services/content_service.dart';

import '../module.dart';

class ContentModule implements AppModule {
  @override
  List<SingleChildWidget> providers = [
    Provider(
      create: (context) => ContentApi(context.read<Dio>()),
    ),
    Provider(
      create: (context) => ContentApiDataSourceImpl(context.read<ContentApi>()),
    ),
    Provider(
      create: (context) => ContentLocalDataSourceImpl(),
    ),
    Provider(
      create: (context) => ContentRepositoryImpl(
        remoteDataSource: context.read<ContentApiDataSourceImpl>(),
        localDataSource: context.read<ContentLocalDataSourceImpl>(),
      ),
    ),
    Provider(
      create: (context) => ContentService(
        contentRepository: context.read<ContentRepositoryImpl>(),
      ),
    ),
  ];
}
