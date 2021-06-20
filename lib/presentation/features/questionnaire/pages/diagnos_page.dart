import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iherb/presentation/theme/app_colors.dart';
import 'package:iherb/presentation/theme/icons_and_images.dart';
import 'package:provider/provider.dart';

import '../questionnaire_view_model.dart';

class DiagnosPage extends StatelessWidget {
  const DiagnosPage({Key? key}) : super(key: key);

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
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  SizedBox(height: MediaQuery.of(context).size.height * .1),
                  Image.asset(
                    AppImages.imagesMascot7,
                    height: 106,
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * .05),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: Text(
                      'Есть ли у вас хронические заболевания?',
                      style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w700,
                          fontFamily: 'Arial'),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * .025),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: Text(
                      'Напишите ниже, если вы страдаете каким-либо заболеванием.',
                      style: TextStyle(
                          fontSize: 16,
                          color: AppColor.primary.withOpacity(.4),
                          fontFamily: 'Arial'),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 120,
                      child: TextField(
                        onChanged: (v) => viewModel.user.chronic = v,
                        decoration: InputDecoration(
                          hintText: 'Диагноз',
                          alignLabelWithHint: true,
                          border: UnderlineInputBorder(
                            borderSide:
                                BorderSide(color: AppColor.primary, width: 3),
                          ),
                          enabledBorder: UnderlineInputBorder(
                            borderSide:
                                BorderSide(color: AppColor.primary, width: 3),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide:
                                BorderSide(color: AppColor.primary, width: 3),
                          ),
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              ),
              if (MediaQuery.of(context).viewPadding.bottom >= 0)
                Column(
                  children: [
                    CupertinoButton(
                      minSize: 0,
                      padding: EdgeInsets.zero,
                      child: Container(
                        height: 74,
                        margin: EdgeInsets.only(
                            left: 25, right: 25, bottom: 32, top: 12),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: AppColor.primary,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Продолжить',
                              style: TextStyle(
                                fontSize: 19,
                                fontFamily: 'Arial',
                                color: Colors.white,
                                letterSpacing: 1,
                              ),
                            ),
                          ],
                        ),
                      ),
                      onPressed: () {
                        FocusScope.of(context).unfocus();
                        viewModel.setPage(viewModel.page + 1);
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
