import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iherb/presentation/theme/app_colors.dart';
import 'package:iherb/presentation/widgets/reactive_scaffold.dart';

import 'profile_viewmodel.dart';

class ProfileView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ReactiveScaffold<ProfileViewModel>(
      viewModelBuilder: () => ProfileViewModel(),
      body: (context, viewModel, _) => Container(
        color: AppColor.green,
      ),
    );
  }
}
