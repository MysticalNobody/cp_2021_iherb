import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:iherb/core/utils/utils.dart';

@immutable
class LoggerInterceptor implements Interceptor {
  final logger = getLogger('SplashViewModel');

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    throw err;
  }

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    try {
      final String headers =
          options.headers.entries.map((e) => '${e.key}: ${e.value}').join('\n');
      logger.i('REQUEST -> ${options.method} ${options.uri}\n$headers');
      logger.i(options.data ?? '');
      logger.i('REQUEST END');
    } catch (e) {
      logger.e(e);
    }
    handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    final base = response.requestOptions;
    final headers =
        base.headers.entries.map((e) => '${e.key}: ${e.value}').join('\n');
    Level level = Level.info;
    if ((response.statusCode ?? 0) >= 400) {
      level = Level.error;
    }
    logger.log(level,
        'RESPONSE <- ${response.statusCode} ${base.method} ${base.uri}\n$headers');
    logger.log(level, response.data ?? '');
    logger.log(level, 'RESPONSE END');
    handler.next(response);
  }
}
