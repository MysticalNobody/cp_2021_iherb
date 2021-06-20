import 'package:iherb/data/models/article_model.dart';
import 'package:iherb/data/models/good_model.dart';
import 'package:iherb/data/models/quiz_model.dart';
import 'package:iherb/domain/services/content_service.dart';
import 'package:stacked/stacked.dart';
import 'package:iherb/core/utils/utils.dart';

enum ContentFilter { all, article, goods, quiz }

class ContentViewModel extends BaseViewModel {
  ContentViewModel(this.contentService) {
    call(); //??
  }
  final ContentService contentService;
  final log = getLogger('ContentViewModel');

  ContentFilter _filter = ContentFilter.all;
  List _items = [];

  int get badgeIndex => _filter.index;

  List<String> get filterTitles => [
        'Все',
        'Статьи',
        'Товары',
        'Опросы',
      ];

  List get items => _items.where(
        (item) {
          switch (_filter) {
            case ContentFilter.all:
              return true;
            case ContentFilter.article:
              return item is ArticleModel;
            case ContentFilter.goods:
              return item is GoodModel;
            case ContentFilter.quiz:
              return item is QuizModel;
          }
        },
      ).toList();

  void setFilter(int badgeIndex) {
    _filter = ContentFilter.values[badgeIndex];
    notifyListeners();
  }

  call() async {
    await runBusyFuture(contentService.inited.future);
    onUpdateItems();
  }

  void onUpdateItems() {
    _items
      ..clear()
      ..addAll(contentService.articles)
      ..addAll(contentService.products.map<GoodModel>((e) => e.good))
      ..addAll(contentService.quizes)
      ..shuffle();
    notifyListeners();
  }
}
