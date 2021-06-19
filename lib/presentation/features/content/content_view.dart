import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iherb/data/models/article_model.dart';
import 'package:iherb/data/models/good_model.dart';
import 'package:iherb/data/models/quiz_model.dart';
import 'package:iherb/domain/services/content_service.dart';
import 'package:iherb/presentation/theme/app_colors.dart';
import 'package:iherb/presentation/widgets/reactive_scaffold.dart';
import 'package:provider/provider.dart';
import 'content_viewmodel.dart';
import 'widgets/appbar.dart';
import 'widgets/article_card.dart';
import 'widgets/good_card.dart';

class ContentView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ReactiveScaffold<ContentViewModel>(
      viewModelBuilder: () => ContentViewModel(context.read<ContentService>()),
      body: (context, model, _) => Column(
        children: [
          ContentAppbar(
            page: model.badgeIndex,
            titles: model.filterTitles,
            onTap: model.setFilter,
            hasQuizes: true,
          ),
          SizedBox(height: 12),
          Expanded(
            child: ListView.separated(
              itemCount: model.items.length + 1,
              padding: EdgeInsets.symmetric(
                horizontal: 24,
                vertical: 12,
              ),
              separatorBuilder: (context, index) => SizedBox(height: 15),
              itemBuilder: (context, index) {
                if (index == 0) {
                  return Image.asset(
                    'assets/images/anal.png',
                    width: double.infinity,
                  );
                }
                final item = model.items[index - 1];
                if (item is ArticleModel) {
                  return ArticleCard(item);
                }
                if (item is GoodModel) {
                  return GoodCard(item);
                }
                if (item is QuizModel) {
                  return Container();
                }
                return Container();
              },
            ),
          ),
        ],
      ),
    );
  }
}
