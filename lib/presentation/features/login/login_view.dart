import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:iherb/domain/services/auth_service.dart';
import 'package:iherb/generated/l10n.dart';
import 'package:iherb/presentation/widgets/reactive_scaffold.dart';

import 'login_viewmodel.dart';

class LoginView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ReactiveScaffold<LoginViewModel>(
      viewModelBuilder: () => LoginViewModel(
        authService: context.read<AuthService>(),
      ),
      body: (context, viewModel, _) => Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Text("Login View"),
          ),
          SizedBox(height: 50),
          !viewModel.isBusy
              ? ElevatedButton(
                  onPressed: () => viewModel.signIn(),
                  child: Text(S.of(context).signIn),
                )
              : Center(child: CircularProgressIndicator())
        ],
      ),
    );
  }
}
