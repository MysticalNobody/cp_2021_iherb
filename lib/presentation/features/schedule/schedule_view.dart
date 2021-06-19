import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iherb/presentation/theme/app_colors.dart';
import 'package:iherb/presentation/widgets/reactive_scaffold.dart';

import 'schedule_viewmodel.dart';

class ScheduleView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ReactiveScaffold<ScheduleViewModel>(
      viewModelBuilder: () => ScheduleViewModel(),
      body: (context, viewModel, _) => Container(
        color: AppColor.yellow,
      ),
    );
  }
}
