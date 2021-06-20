import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iherb/presentation/theme/app_colors.dart';
import 'package:iherb/presentation/theme/icons_and_images.dart';
import 'package:provider/provider.dart';

import '../questionnaire_view_model.dart';

class ActivityPage extends StatelessWidget {
  ActivityPage({Key? key}) : super(key: key);

  List<String> types = [
    'Активный',
    'Я спортсмен',
    'Сидячий',
    'Нагрузки запрещены'
  ];
  @override
  Widget build(BuildContext context) {
    final viewModel = context.read<QuestionnaireViewModel>();
    return SafeArea(
      child: Stack(
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: Container(
              width: 36,
              height: 36,
              margin: EdgeInsets.only(
                left: 16,
                top: 10,
              ),
              child: CupertinoButton(
                minSize: 0,
                padding: EdgeInsets.zero,
                onPressed: () => viewModel.setPage(viewModel.page - 1),
                child: Icon(
                  Icons.arrow_back,
                  size: 34,
                  color: AppColor.primary.withOpacity(.3),
                ),
              ),
            ),
          ),
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(height: MediaQuery.of(context).size.height * .1),
                Image.asset(
                  AppImages.imagesMascot1,
                  height: 106,
                ),
                SizedBox(height: MediaQuery.of(context).size.height * .05),
                Text(
                  'Каков ваш образ жизни?',
                  style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w700,
                      fontFamily: 'Arial'),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: MediaQuery.of(context).size.height * .025),
                Text(
                  'Выберите нужный вариант,\nчтобы перейти дальше.',
                  style: TextStyle(
                      fontSize: 16,
                      color: AppColor.primary.withOpacity(.4),
                      fontFamily: 'Arial'),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 38),
                ...List.generate(
                  types.length,
                  (index) => CupertinoButton(
                    minSize: 0,
                    padding: EdgeInsets.zero,
                    child: Container(
                      height: 74,
                      margin: EdgeInsets.only(left: 25, right: 25, bottom: 8),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: AppColor.white,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            types[index],
                            style: TextStyle(
                              fontSize: 19,
                              fontFamily: 'Arial',
                            ),
                          ),
                        ],
                      ),
                    ),
                    onPressed: () {
                      viewModel.user.lifestyle = types[index];
                      viewModel.setPage(viewModel.page += 1);
                    },
                  ),
                ),
                SizedBox(height: 38),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
