import 'package:iherb/data/data_source/interfaces/data_source.dart';

abstract class AppNetworkDataSource implements AppDataSource {
  AppNetworkDataSource(this.api);
  Type api;
}
