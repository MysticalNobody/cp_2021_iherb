export 'logger.dart';
export 'snackbar_util.dart';

class Utils {
  static String numToFixStr(num number, [int maxFractionDigits = 2]) {
    String str = '';
    if (number > 0 && number < 1) {
      str = number.toStringAsFixed(maxFractionDigits);
    } else {
      str = number
          .toStringAsFixed(maxFractionDigits)
          .replaceAll('0', ' ')
          .trim() //remove .X00
          .replaceAll(' ', '0')
          .replaceAll('.', ' ')
          .trim() //remove point in the end
          .replaceAll(' ', '.');
    }
    if (str.isEmpty) return '0';
    return str;
  }

  static bool isSameDate(DateTime a, DateTime b) {
    return a.day == b.day && a.month == b.month && a.year == b.year;
  }

  static String getWeekdayName(int weekday) {
    return [
      'ПН',
      'ВТ',
      'СР',
      'ЧТ',
      'ПТ',
      'СБ',
      'ВС',
    ][weekday - 1];
  }
}
