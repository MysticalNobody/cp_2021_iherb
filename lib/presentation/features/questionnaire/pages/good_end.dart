import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iherb/presentation/features/questionnaire/questionnaire_view_model.dart';
import 'package:iherb/presentation/theme/app_colors.dart';
import 'package:iherb/presentation/theme/icons_and_images.dart';
import 'package:provider/provider.dart';

class GoodEndPage extends StatelessWidget {
  const GoodEndPage({Key? key}) : super(key: key);

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
                Image.asset(
                  AppImages.imagesMascot,
                  height: 106,
                ),
                SizedBox(height: MediaQuery.of(context).size.height * .05),
                Text(
                  'Вы большой молодец!',
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
                    'Тогда загрузите PDF-файл с анализом. \n\nА я вам подскажу, какие бады вам можно и нужно принимать, а какие категорически нельзя!',
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
                    margin: EdgeInsets.only(left: 25, right: 25),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: AppColor.white,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Загрузить PDF',
                          style: TextStyle(
                            fontSize: 19,
                            fontFamily: 'Arial',
                          ),
                        ),
                      ],
                    ),
                  ),
                  onPressed: () async {
                    final res = await FilePicker.platform.pickFiles(
                        type: FileType.custom, allowedExtensions: ['pdf']);
                    if (res != null) {
                      viewModel.setPage(12);
                    }
                  },
                ),
                SizedBox(height: 8),
                CupertinoButton(
                  minSize: 0,
                  padding: EdgeInsets.zero,
                  child: Container(
                    height: 74,
                    margin: EdgeInsets.only(left: 25, right: 25, bottom: 32),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Color(0xffC7E0C5),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Загрузить позже',
                          style: TextStyle(
                              fontSize: 19,
                              fontFamily: 'Arial',
                              color: Colors.black.withOpacity(.5)),
                        ),
                      ],
                    ),
                  ),
                  onPressed: () => viewModel.setPage(11),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
