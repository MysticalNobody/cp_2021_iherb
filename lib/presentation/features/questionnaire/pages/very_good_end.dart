import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iherb/presentation/features/questionnaire/questionnaire_view_model.dart';
import 'package:iherb/presentation/theme/app_colors.dart';
import 'package:iherb/presentation/theme/icons_and_images.dart';
import 'package:provider/provider.dart';

class VeryGoodEndPage extends StatelessWidget {
  const VeryGoodEndPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final viewModel = context.read<QuestionnaireViewModel>();
    return DecoratedBox(
      decoration: BoxDecoration(color: Colors.white),
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                SizedBox(height: MediaQuery.of(context).size.height * .1),
                Image.asset(
                  AppImages.imagesMascot,
                  height: 106,
                ),
                SizedBox(height: MediaQuery.of(context).size.height * .05),
                Text(
                  'Я изучил результаты ваших анализов.',
                  style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Arial'),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: MediaQuery.of(context).size.height * .05),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: Text(
                    'На базе этого я подготовил очень подробные рекомендации продуктов и статей, которые должны вам помочь.\n\nНе забывайте чаще проходить обследования и сдавать анализы на витамины.\n\nИ не болейте!\nМы еще встретимся :)',
                    style: TextStyle(fontSize: 16, fontFamily: 'Arial'),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
            Column(
              children: [
                CupertinoButton(
                  minSize: 0,
                  padding: EdgeInsets.zero,
                  child: Container(
                    height: 74,
                    margin: EdgeInsets.only(left: 25, right: 25, bottom: 32),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: AppColor.primary,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Глянуть рекомендации',
                          style: TextStyle(
                              fontSize: 19,
                              fontFamily: 'Arial',
                              color: AppColor.white,
                              letterSpacing: 1),
                        ),
                      ],
                    ),
                  ),
                  onPressed: () => viewModel.signIn(),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
