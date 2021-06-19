import 'package:flutter/cupertino.dart';
import 'package:stacked/stacked.dart';
import 'package:iherb/domain/services/auth_service.dart';
import 'package:iherb/presentation/features/root/root_viewmodel.dart';
import 'package:provider/provider.dart';

class RootView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<RootViewModel>.reactive(
      onModelReady: (model) => model(),
      builder: (context, model, child) {
        return Container();
      },
      viewModelBuilder: () => RootViewModel(
        service: context.read<AuthService>(),
      ),
    );
  }
}
