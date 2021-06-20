import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iherb/presentation/features/schedule/widgets/vitamin_card.dart';
import 'package:iherb/presentation/widgets/reactive_scaffold.dart';

import 'schedule_viewmodel.dart';
import 'widgets/appbar.dart';

class ScheduleView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ReactiveScaffold<ScheduleViewModel>(
      viewModelBuilder: () => ScheduleViewModel(),
      body: (context, model, _) => Stack(
        children: [
          ListView.separated(
            padding: EdgeInsets.only(bottom: 30, top: 240),
            itemCount: model.vitamins.length,
            separatorBuilder: (context, index) => const SizedBox(height: 15),
            physics: BouncingScrollPhysics(),
            itemBuilder: (context, index) {
              final vitamin = model.vitamins[index];
              return VitaminCard(
                vitaminAsset: vitamin.asset,
                count: vitamin.count,
                when: vitamin.when,
                name: vitamin.name,
                time: vitamin.time,
                colors: vitamin.colors,
              );
            },
          ),
          ScheduleAppBar(
            selectedDate: model.selectedDate,
            onChangeDate: model.selectDate,
            onTabTap: model.selectTab,
            tabIndex: model.selectedTab,
          ),
        ],
      ),
    );
  }
}
