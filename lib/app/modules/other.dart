import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:nested/nested.dart';
import 'package:provider/provider.dart';
import 'package:iherb/app/module.dart';
import 'package:iherb/data/data_source/interceptors/logger.dart';
import 'package:iherb/l10n/locale_service.dart';
import 'package:stacked_themes/stacked_themes.dart';
import 'package:dio/dio.dart';

class OtherModule implements AppModule {
  @override
  List<SingleChildWidget> providers = [
    ChangeNotifierProvider.value(value: LocaleProvider()),
    Provider.value(value: ThemeService()),
    Provider.value(
        value: Dio(BaseOptions(baseUrl: env['API_URL']!))
          ..interceptors.addAll([LoggerInterceptor()])),
  ];
}
