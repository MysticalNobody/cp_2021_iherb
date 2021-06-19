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
              itemCount: model.items.length,
              padding: EdgeInsets.symmetric(
                horizontal: 24,
                vertical: 12,
              ),
              separatorBuilder: (context, index) => SizedBox(height: 15),
              itemBuilder: (context, index) {
                final item = model.items[index];
                if (item is ArticleModel) {
                  return Container(
                    width: double.infinity,
                    height: 100,
                    color: AppColor.blue,
                    child: Text(item.title),
                  );
                }
                if (item is GoodModel) {
                  return Container(
                    width: double.infinity,
                    height: 100,
                    color: AppColor.blue,
                    child: Text(item.title),
                  );
                }
                if (item is QuizModel) {
                  return Container(
                    width: double.infinity,
                    height: 100,
                    color: AppColor.blue,
                    child: Text(item.title),
                  );
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
