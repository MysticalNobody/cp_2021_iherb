import 'dart:async';

import 'package:iherb/data/data_source/interfaces/data_source.dart';

abstract class AppLocalDataSource implements AppDataSource {
  Completer inited = Completer();

  late Type instance;

  Future<void> init();

  Future<Type> get();

  Future<void> set(Type value);
}
