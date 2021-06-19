import 'package:stacked/stacked.dart';
import 'package:iherb/core/utils/utils.dart';

class ScheduleViewModel extends BaseViewModel {
  ScheduleViewModel();

  final log = getLogger('ScheduleViewModel');

  DateTime selectedDate = DateTime.now();

  void selectDate(DateTime date) {
    selectedDate = date;
    notifyListeners();
  }
}
