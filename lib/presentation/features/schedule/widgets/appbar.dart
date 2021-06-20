import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iherb/core/utils/utils.dart';
import 'package:iherb/presentation/theme/app_colors.dart';
import 'package:jiffy/jiffy.dart';

class ScheduleAppBar extends StatelessWidget {
  const ScheduleAppBar({
    Key? key,
    required this.selectedDate,
    required this.onChangeDate,
    required this.tabIndex,
    required this.onTabTap,
  }) : super(key: key);

  final DateTime selectedDate;
  final void Function(DateTime date) onChangeDate;
  final int tabIndex;
  final void Function(int index) onTabTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          color: AppColor.bg,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SafeArea(
                bottom: false,
                child: SizedBox(),
              ),
              const SizedBox(height: 22),
              SizedBox(
                height: 67,
                child: ListView.separated(
                  physics: BouncingScrollPhysics(),
                  itemCount: 1000,
                  reverse: true,
                  padding: EdgeInsets.symmetric(horizontal: 12),
                  scrollDirection: Axis.horizontal,
                  separatorBuilder: (context, index) => SizedBox(width: 12),
                  itemBuilder: (context, index) {
                    DateTime day;
                    if (index < 3) {
                      day = DateTime.now().add(Duration(days: 3 - index));
                    } else {
                      day = DateTime.now().subtract(Duration(days: index - 3));
                    }
                    bool selected = Utils.isSameDate(selectedDate, day);
                    return CupertinoButton(
                      onPressed: () => onChangeDate(day),
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
              const SizedBox(height: 24),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 24),
                child: Text(
                  '${Utils.isSameDate(DateTime.now(), selectedDate) ? 'СЕГОДНЯ' : Utils.getWeekdayFullName(selectedDate.weekday)}, ${Jiffy(selectedDate).format('dd MMMM').toUpperCase()}',
                  style: TextStyle(
                    fontSize: 24,
                    color: AppColor.primary,
                    fontFamily: "Arial",
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              const SizedBox(height: 9),
            ],
          ),
        ),
        const SizedBox(height: 9),
        SizedBox(
          height: 40,
          child: ListView.separated(
            physics: BouncingScrollPhysics(),
            itemCount: 3,
            padding: EdgeInsets.symmetric(horizontal: 24),
            scrollDirection: Axis.horizontal,
            separatorBuilder: (context, index) => SizedBox(width: 9),
            itemBuilder: (context, index) {
              return CupertinoButton(
                onPressed: () => onTabTap(index),
                minSize: 0,
                padding: EdgeInsets.zero,
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(18.5),
                    color: tabIndex == index ? AppColor.primary : AppColor.white,
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 13,
                      vertical: 9,
                    ),
                    child: Text(
                      ['Пропущено', 'План', 'Принято'][index],
                      style: TextStyle(
                        fontSize: 16,
                        color: tabIndex == index ? Colors.white : Colors.black.withOpacity(0.7),
                        fontFamily: "Arial",
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
