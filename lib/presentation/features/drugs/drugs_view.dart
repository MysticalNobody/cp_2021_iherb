import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iherb/presentation/features/drugs/drugs_view_model.dart';
import 'package:iherb/presentation/features/drugs/widgets/drug_card.dart';
import 'package:iherb/presentation/theme/app_colors.dart';
import 'package:iherb/presentation/theme/icons_and_images.dart';
import 'package:iherb/presentation/widgets/appbar.dart';
import 'package:iherb/presentation/widgets/reactive_scaffold.dart';

class DrugsView extends StatelessWidget {
  const DrugsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ReactiveScaffold<DrugsViewModel>(
      viewModelBuilder: () => DrugsViewModel(),
      body: (context, viewModel, __) {
        return Stack(
          children: [
            CustomScrollView(
              physics: BouncingScrollPhysics(),
              slivers: [
                Topbar(
                  title: 'ВАШИ ПРЕПАРАТЫ',
                  bg: AppColor.bg,
                  // action: Container(
                  //   width: 36,
                  //   height: 36,
                  //   margin: EdgeInsets.only(
                  //     left: 16,
                  //     right: 16,
                  //     top: 10,
                  //   ),
                  //   child: CupertinoButton(
                  //     minSize: 0,
                  //     padding: EdgeInsets.zero,
                  //     onPressed: () {},
                  //     child: Icon(
                  //       Icons.add,
                  //       size: 34,
                  //       color: AppColor.primary.withOpacity(.3),
                  //     ),
                  //   ),
                  // ),
                ),
                SliverPadding(
                  padding: EdgeInsets.only(
                    left: 25,
                    right: 25,
                    bottom: 34,
                  ),
                  sliver: SliverList(
                    delegate: SliverChildListDelegate(
                      [
                        ...List.generate(
                          viewModel.drugs.length,
                          (index) => DrugCard(
                            model: viewModel.drugs[index],
                          ),
                        ),
                        SizedBox(height: 18),
                        Row(
                          children: [
                            SizedBox(width: 20),
                            CupertinoButton(
                              minSize: 0,
                              padding: EdgeInsets.zero,
                              child: Text(
                                'Добавить ещё препараты',
                                style: TextStyle(
                                  fontSize: 17,
                                  color: AppColor.green,
                                ),
                              ),
                              onPressed: () {},
                            ),
                          ],
                        ),
                        SizedBox(height: 200),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    stops: [0, 0.2],
                    colors: [
                      AppColor.bg.withOpacity(0),
                      AppColor.bg,
                    ],
                  ),
                ),
                padding: const EdgeInsets.only(
                  left: 25,
                  right: 25,
                  bottom: 32,
                  top: 12,
                ),
                child: Image.asset(AppImages.imagesAnal),
              ),
            )
          ],
        );
      },
    );
  }
}
