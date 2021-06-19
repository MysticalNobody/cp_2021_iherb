import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iherb/core/utils/utils.dart';
import 'package:iherb/presentation/theme/app_colors.dart';
import 'package:iherb/presentation/widgets/reactive_scaffold.dart';

import 'schedule_viewmodel.dart';

class ScheduleView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ReactiveScaffold<ScheduleViewModel>(
      viewModelBuilder: () => ScheduleViewModel(),
      body: (context, model, _) => Column(
        children: [
          SafeArea(
            bottom: false,
            child: SizedBox(),
          ),
          SizedBox(height: 22),
          SizedBox(
            height: 65,
            child: ListView.separated(
              itemCount: 1000,
              reverse: true,
              scrollDirection: Axis.horizontal,
              separatorBuilder: (context, index) => SizedBox(width: 12),
              itemBuilder: (context, index) {
                DateTime day;
                if (index < 7) {
                  day = DateTime.now().add(Duration(days: 7 - index));
                } else {
                  day = DateTime.now().subtract(Duration(days: index - 7));
                }
                bool selected = Utils.isSameDate(model.selectedDate, day);
                return CupertinoButton(
                  onPressed: () => model.selectDate(day),
                  minSize: 0,
                  padding: EdgeInsets.zero,
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(13),
                      color: selected ? AppColor.primary : AppColor.bg,
                    ),
                    child: Padding(
                      padding: EdgeInsets.only(
                        left: 11,
                        right: 11,
                        top: 11,
                        bottom: 13,
                      ),
                      child: Column(
                        children: [
                          Text(
                            Utils.getWeekdayName(day.weekday),
                            style: TextStyle(
                              fontSize: 12,
                              color: selected ? Colors.white : Color(0xFFB6C4D8),
                              fontFamily: "Arial",
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            day.day.toString(),
                            style: TextStyle(
                              fontSize: 18,
                              color: selected ? AppColor.white : AppColor.primary,
                              fontFamily: "Arial",
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          SizedBox(height: 22),
        ],
      ),
    );
  }
}
