import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';
import 'package:iherb/app/modules/auth.dart';
import 'package:iherb/app/modules/other.dart';

import 'app/app.dart';
import 'app/dependency.dart';
import 'data/models/auth_model.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await load();
  Provider.debugCheckInvalidValueType = null;
  await Hive.initFlutter();
  Hive.registerAdapter(AuthModelAdapter());
  runApp(
    AppDependencies(
      app: App(),
      modules: [
        OtherModule(),
        AuthModule(),
      ],
    ),
  );
}
