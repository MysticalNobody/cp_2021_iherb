import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iherb/presentation/theme/app_colors.dart';

class ContentAppbar extends StatelessWidget {
  const ContentAppbar({
    Key? key,
    required this.page,
    required this.titles,
    required this.onTap,
    this.hasQuizes = false,
  }) : super(key: key);

  final int page;
  final List<String> titles;
  final void Function(int index) onTap;
  final bool hasQuizes;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SafeArea(
          bottom: false,
          child: SizedBox(),
        ),
        Padding(
          padding: EdgeInsets.all(24),
          child: Text('СЕГОДНЯ ДЛЯ ВАС'),
        ),
        SizedBox(
          height: 40,
          child: ListView.separated(
            itemCount: titles.length,
            padding: EdgeInsets.symmetric(horizontal: 24),
            scrollDirection: Axis.horizontal,
            separatorBuilder: (context, index) => SizedBox(width: 9),
            itemBuilder: (context, index) {
              final withRedCircle = hasQuizes && index == 3;
              return CupertinoButton(
                onPressed: () => onTap(index),
                minSize: 0,
                padding: EdgeInsets.zero,
                child: Stack(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 1),
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(18.5),
                          color: page == index ? AppColor.primary : AppColor.white,
                        ),
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: 13,
                            vertical: 9,
                          ),
                          child: Text(titles[index]),
                        ),
                      ),
                    ),
                    Positioned(
                      right: 0,
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                          color: withRedCircle ? AppColor.red : Colors.transparent,
                          shape: BoxShape.circle,
                        ),
                        child: SizedBox(
                          height: 12,
                          width: 12,
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
