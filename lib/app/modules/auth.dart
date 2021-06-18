import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:iherb/data/data_source/auth/local/auth_local_data_source.dart';
import 'package:iherb/data/data_source/auth/local/auth_local_data_source_impl.dart';
import 'package:iherb/data/data_source/auth/remote/auth_api.dart';
import 'package:iherb/data/data_source/auth/remote/auth_api_data_source_impl.dart';
import 'package:dio/dio.dart';
import 'package:iherb/domain/repository/auth/auth_repository_impl.dart';
import 'package:iherb/domain/services/auth_service.dart';

import '../module.dart';

class AuthModule implements AppModule {
  @override
  List<SingleChildWidget> providers = [
    Provider(
      create: (context) => AuthApi(context.read<Dio>()),
    ),
    Provider(
      create: (context) => AuthApiDataSourceImpl(context.read<AuthApi>()),
    ),
    Provider(
      create: (context) => AuthLocalDataSourceImpl(),
    ),
    Provider(
      create: (context) => AuthRepositoryImpl(
          remoteDataSource: context.read<AuthApiDataSourceImpl>(),
          localDataSource: context.read<AuthLocalDataSourceImpl>()),
    ),
    Provider(
      create: (context) =>
          AuthService(authRepository: context.read<AuthRepositoryImpl>()),
    ),
  ];
}
