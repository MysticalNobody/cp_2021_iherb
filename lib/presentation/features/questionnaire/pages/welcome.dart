import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iherb/presentation/features/questionnaire/questionnaire_view_model.dart';
import 'package:iherb/presentation/theme/app_colors.dart';
import 'package:iherb/presentation/theme/icons_and_images.dart';
import 'package:provider/provider.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final viewModel = context.read<QuestionnaireViewModel>();
    return DecoratedBox(
      decoration: BoxDecoration(
        color: Color(0xffC7E0C5),
      ),
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                SizedBox(height: MediaQuery.of(context).size.height * .1),
                Text(
                  'Меня зовут Хёрб.',
                  style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Arial'),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * .05),
                Image.asset(
                  AppImages.imagesMascot,
                  height: 106,
                ),
                SizedBox(height: MediaQuery.of(context).size.height * .05),
                Text(
                  ' И я ваш помощник\nв мире БАДов.',
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
                    'Я очень хочу посоветовать вам подходящие препараты.Но для этого мне нужно узнать о вас немного больше.\n\nНачнём знакомство?',
                    style: TextStyle(fontSize: 16, fontFamily: 'Arial'),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
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
                      'Начать',
                      style: TextStyle(
                          letterSpacing: 1,
                          fontSize: 19,
                          fontFamily: 'Arial',
                          color: AppColor.white),
                    ),
                  ],
                ),
              ),
              onPressed: () => viewModel.setPage(1),
            )
          ],
        ),
      ),
    );
  }
}
