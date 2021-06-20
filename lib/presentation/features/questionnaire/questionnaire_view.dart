import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:iherb/domain/services/auth_service.dart';
import 'package:iherb/presentation/features/questionnaire/pages/woman_page.dart';
import 'package:iherb/presentation/features/questionnaire/questionnaire_view_model.dart';
import 'package:iherb/presentation/widgets/reactive_scaffold.dart';
import 'package:provider/provider.dart';
import 'package:rive/rive.dart';

import 'pages/activity_page.dart';
import 'pages/age_page.dart';
import 'pages/allergy_page.dart';
import 'pages/anal_test_page.dart';
import 'pages/bad_end.dart';
import 'pages/diagnos_page.dart';
import 'pages/diet_page.dart';
import 'pages/good_end.dart';
import 'pages/h_w_page.dart';
import 'pages/sex_pick_page.dart';
import 'pages/very_good_end.dart';
import 'pages/welcome.dart';

class QuestionnaireView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: DecoratedBox(
        decoration: BoxDecoration(color: Colors.black),
        child: ReactiveScaffold<QuestionnaireViewModel>(
          viewModelBuilder: () =>
              QuestionnaireViewModel(context.read<AuthService>()),
          body: (context, viewModel, _) {
            return IndexedStack(
              index: viewModel.page,
              children: [
                WelcomePage(),
                SexPickPage(),
                WomanPage(),
                AgePage(),
                HWPage(),
                ActivityPage(),
                DietPage(),
                AllergyPage(),
                DiagnosPage(),
                AnalTestPage(),
                GoodEndPage(),
                BadEndPage(),
                VeryGoodEndPage()
              ],
            );
          },
        ),
      ),
    );
  }
}
