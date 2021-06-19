import 'package:stacked/stacked.dart';
import 'package:iherb/core/utils/utils.dart';

enum ContentFilter { all, article, goods, quiz }

class ContentViewModel extends BaseViewModel {
  ContentViewModel();

  final log = getLogger('ContentViewModel');

  ContentFilter _filter = ContentFilter.all;

  int get badgeIndex => _filter.index;

  void setFilter(int badgeIndex) {
    _filter = ContentFilter.values[badgeIndex];
    notifyListeners();
  }

  List<String> get filterTitles => [
        'Все',
        'Статьи',
        'Товары',
        'Опросы',
      ];
}
