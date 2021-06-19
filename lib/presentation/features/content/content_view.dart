import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
          ),
        ],
      ),
    );
  }
}
