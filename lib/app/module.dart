import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

abstract class AppModule {
  AppModule(this.providers);

  final List<SingleChildWidget> providers;
}
