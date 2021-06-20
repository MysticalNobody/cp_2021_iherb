import 'package:flutter/cupertino.dart';
import 'package:stacked/stacked.dart';

import 'date_ios_model.dart';

class IosDatePicker extends StatelessWidget {
  const IosDatePicker({Key? key, this.currentDate}) : super(key: key);

  final DateTime? currentDate;

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<IosDatePickerModel>.nonReactive(
      viewModelBuilder: () => IosDatePickerModel(),
      builder: (context, model, child) {
        return Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CupertinoButton(
                    padding: EdgeInsets.zero,
                    minSize: 0,
                    onPressed: Navigator.of(context).pop,
                    child: Text(
                      'Отменить',
                    ),
                  ),
                  CupertinoButton(
                    padding: EdgeInsets.zero,
                    minSize: 0,
                    onPressed: () =>
                        Navigator.of(context).pop(model.selectedDate),
                    child: Text(
                      'Сохранить',
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              SizedBox(
                height: 200,
                child: CupertinoDatePicker(
                  initialDateTime: currentDate,
                  onDateTimeChanged: model.onDateChanged,
                  minimumYear: 1920,
                  maximumYear: DateTime.now().year,
                  mode: CupertinoDatePickerMode.date,
                ),
              ),
              const SafeArea(child: SizedBox()),
            ],
          ),
        );
      },
    );
  }
}
