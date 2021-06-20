import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:iherb/presentation/features/questionnaire/questionnaire_view_model.dart';
import 'package:iherb/presentation/widgets/reactive_scaffold.dart';
import 'package:rive/rive.dart';

class QuestionnaireView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(color: Colors.black),
      child: ReactiveScaffold<QuestionnaireViewModel>(
        viewModelBuilder: () => QuestionnaireViewModel(),
        body: (context, viewModel, _) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(height: 120),
            ],
          );
        },
      ),
    );
  }
}
