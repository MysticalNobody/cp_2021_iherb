import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iherb/presentation/theme/app_colors.dart';

class SexBottomSheetPicker extends StatelessWidget {
  const SexBottomSheetPicker({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 30, horizontal: 20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            'Ваш пол',
            style: Theme.of(context).textTheme.headline6,
          ),
          const SizedBox(height: 20),
          GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: () => Navigator.of(context).pop(0),
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 12),
              child: Text(
                'Мужской',
                style: Theme.of(context).textTheme.button,
              ),
            ),
          ),
          const SizedBox(height: 10),
          GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: () => Navigator.of(context).pop(1),
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 12),
              child: Text(
                'Женский',
                style: Theme.of(context).textTheme.button,
              ),
            ),
          ),
          const Divider(color: Colors.grey),
          GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: Navigator.of(context).pop,
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 12),
              child: Text(
                'Отмена',
                style: Theme.of(context)
                    .textTheme
                    .button
                    ?.copyWith(color: AppColor.primary.withOpacity(.3)),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
