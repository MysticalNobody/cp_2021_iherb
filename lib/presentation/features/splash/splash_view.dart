import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stacked/stacked.dart';
import 'package:iherb/domain/services/auth_service.dart';

import 'splash_viewmodel.dart';

class SplashView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SplashViewModel>.reactive(
      onModelReady: (model) => model.runStartupLogic(),
      builder: (context, model, child) => Scaffold(
        body: Center(child: CircularProgressIndicator()),
      ),
      viewModelBuilder: () =>
          SplashViewModel(authService: context.read<AuthService>()),
    );
  }
}
