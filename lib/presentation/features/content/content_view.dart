import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iherb/presentation/theme/app_colors.dart';
import 'package:iherb/presentation/widgets/reactive_scaffold.dart';
import 'content_viewmodel.dart';
import 'widgets/appbar.dart';

class ContentView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ReactiveScaffold<ContentViewModel>(
      viewModelBuilder: () => ContentViewModel(),
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
              itemCount: 100,
              padding: EdgeInsets.symmetric(
                horizontal: 24,
                vertical: 12,
              ),
              separatorBuilder: (context, index) => SizedBox(height: 15),
              itemBuilder: (context, index) {
                return Container(
                  width: double.infinity,
                  height: 100,
                  color: AppColor.blue,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
