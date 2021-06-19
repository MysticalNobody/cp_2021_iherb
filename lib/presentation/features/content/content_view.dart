import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iherb/presentation/theme/app_colors.dart';
import 'package:iherb/presentation/widgets/reactive_scaffold.dart';

import 'content_viewmodel.dart';

class ContentView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ReactiveScaffold<ContentViewModel>(
      viewModelBuilder: () => ContentViewModel(),
      body: (context, viewModel, _) => Container(
        color: AppColor.red,
      ),
    );
  }
}
