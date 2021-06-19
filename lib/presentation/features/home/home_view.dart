import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:iherb/domain/services/auth_service.dart';
import 'package:iherb/presentation/widgets/reactive_scaffold.dart';

import 'home_viewmodel.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ReactiveScaffold<HomeViewModel>(
      viewModelBuilder: () => HomeViewModel(
        apiAuthService: context.read<AuthService>(),
      ),
      body: (context, viewModel, _) => Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(height: 8),
          ],
        ),
      ),
    );
  }
}
