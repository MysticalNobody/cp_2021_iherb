import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iherb/presentation/theme/app_colors.dart';
import 'package:iherb/presentation/theme/icons_and_images.dart';
import 'package:provider/provider.dart';

import '../questionnaire_view_model.dart';

class WomanPage extends StatelessWidget {
  const WomanPage({Key? key}) : super(key: key);

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
                onPressed: () => viewModel.setPage(1),
                child: Icon(
                  Icons.arrow_back,
                  size: 34,
                  color: AppColor.primary.withOpacity(.3),
                ),
              ),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  SizedBox(height: MediaQuery.of(context).size.height * .1),
                  Image.asset(
                    AppImages.imagesMascot1,
                    height: 106,
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * .05),
                  Text(
                    'Вы мужчина\nили женщина?',
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
                ],
              ),
              Text(
                'Я женщина',
                style: TextStyle(
                  fontSize: 24,
                  fontFamily: 'Arial',
                ),
                textAlign: TextAlign.center,
              ),
              Column(
                children: [
                  CupertinoButton(
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
                            'И я беремена',
                            style: TextStyle(
                              fontSize: 19,
                              fontFamily: 'Arial',
                            ),
                          ),
                        ],
                      ),
                    ),
                    onPressed: () {
                      viewModel.user.pregnant = true;
                      viewModel.setPage(3);
                    },
                  ),
                  CupertinoButton(
                    minSize: 0,
                    padding: EdgeInsets.zero,
                    child: Container(
                      height: 74,
                      margin: EdgeInsets.only(left: 25, right: 25, bottom: 32),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: AppColor.white,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Я не беремена',
                            style: TextStyle(
                              fontSize: 19,
                              fontFamily: 'Arial',
                            ),
                          ),
                        ],
                      ),
                    ),
                    onPressed: () {
                      viewModel.user.pregnant = false;
                      viewModel.setPage(3);
                    },
                  ),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}
