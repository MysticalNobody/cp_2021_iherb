import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iherb/core/utils/utils.dart';
import 'package:iherb/presentation/theme/app_colors.dart';
import 'package:iherb/presentation/widgets/reactive_scaffold.dart';
import 'package:jiffy/jiffy.dart';

import 'schedule_viewmodel.dart';
import 'widgets/appbar.dart';

class ScheduleView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ReactiveScaffold<ScheduleViewModel>(
      viewModelBuilder: () => ScheduleViewModel(),
      body: (context, model, _) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ScheduleAppBar(
            selectedDate: model.selectedDate,
            onChangeDate: model.selectDate,
            onTabTap: (_) {},
            tabIndex: 1,
          ),
        ],
      ),
    );
  }
}
