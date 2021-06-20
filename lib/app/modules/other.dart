import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:iherb/domain/services/tab_service.dart';
import 'package:nested/nested.dart';
import 'package:provider/provider.dart';
import 'package:iherb/app/module.dart';
import 'package:iherb/data/data_source/interceptors/logger.dart';
import 'package:iherb/l10n/locale_service.dart';

import 'package:dio/dio.dart';

class OtherModule implements AppModule {
  @override
  List<SingleChildWidget> providers = [
    ChangeNotifierProvider.value(value: LocaleProvider()),
    Provider.value(
      value: Dio(BaseOptions(baseUrl: env['API_URL']!))
        ..interceptors.addAll(
          [LoggerInterceptor()],
        ),
    ),
    Provider(
      create: (context) => TabService(),
    ),
  ];
}
