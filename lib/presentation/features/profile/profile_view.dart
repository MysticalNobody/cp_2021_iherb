import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iherb/app/app.dart';
import 'package:iherb/presentation/navigation/app_route.gr.dart';
import 'package:iherb/presentation/theme/app_colors.dart';
import 'package:iherb/presentation/widgets/appbar.dart';
import 'package:iherb/presentation/widgets/reactive_scaffold.dart';

import 'profile_viewmodel.dart';

class ProfileView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(color: AppColor.bg),
      child: ReactiveScaffold<ProfileViewModel>(
        viewModelBuilder: () => ProfileViewModel(),
        body: (context, viewModel, _) => CustomScrollView(
          physics: BouncingScrollPhysics(),
          slivers: [
            Topbar(
              title: 'ВАШ ПРОФИЛЬ',
              bg: AppColor.bg,
            ),
            SliverPadding(
              padding: EdgeInsets.only(left: 25, right: 25, top: 24, bottom: 34),
              sliver: SliverToBoxAdapter(
                child: CupertinoButton(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 18),
                    color: Colors.white,
                    minSize: 0,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text(
                          'Основные данные',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                            fontFamily: "Arial",
                          ),
                        ),
                        SizedBox(height: 2),
                        Text(
                          'Пол, рост, вес, заболевания и т.д.',
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.black.withOpacity(.3),
                            fontFamily: "Arial",
                          ),
                        )
                      ],
                    ),
                    onPressed: () {
                      App.router.push(MainDataProfileViewRoute());
                    }),
              ),
            ),
            SliverPadding(
              padding: EdgeInsets.only(left: 25, right: 25, bottom: 34),
              sliver: SliverList(
                delegate: SliverChildListDelegate(
                  [
                    Text('УВЕДОМЛЕНИЯ',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.black.withOpacity(.3),
                          fontFamily: "Arial",
                        )),
                    SizedBox(height: 13),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      color: Colors.white,
                      child: SizedBox(
                        height: 60,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Напоминать о приеме',
                              style: TextStyle(
                                fontSize: 17,
                                color: Colors.black,
                                fontFamily: "Arial",
                              ),
                            ),
                            CupertinoSwitch(
                              value: viewModel.remind,
                              onChanged: viewModel.setRemind,
                              activeColor: AppColor.green,
                            )
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 8),
                    CupertinoButton(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      color: Colors.white,
                      minSize: 0,
                      onPressed: () {},
                      child: SizedBox(
                        height: 60,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Время',
                              style: TextStyle(
                                fontSize: 17,
                                color: Colors.black,
                                fontFamily: "Arial",
                              ),
                            ),
                            Text(
                              'За 5 мин',
                              style: TextStyle(
                                fontSize: 17,
                                color: Colors.black.withOpacity(.3),
                                fontFamily: "Arial",
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SliverPadding(
              padding: EdgeInsets.only(left: 25, right: 25, bottom: 34),
              sliver: SliverList(
                delegate: SliverChildListDelegate(
                  [
                    Text(
                      'УПОТРЕБЛЯЕМЫЕ ЛЕКАРСТВА',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.black.withOpacity(.3),
                      ),
                    ),
                    SizedBox(height: 13),
                    CupertinoButton(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      color: Colors.white,
                      minSize: 0,
                      onPressed: () {},
                      child: SizedBox(
                        height: 60,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Витамин D, 5 мг',
                              style: TextStyle(
                                fontSize: 17,
                                color: Colors.black,
                                fontFamily: "Arial",
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 8),
                    CupertinoButton(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      color: Colors.white,
                      minSize: 0,
                      onPressed: () {},
                      child: SizedBox(
                        height: 60,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Витамин C, 10 мг',
                              style: TextStyle(
                                fontSize: 17,
                                color: Colors.black,
                                fontFamily: "Arial",
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 8),
                    CupertinoButton(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      color: Colors.white,
                      minSize: 0,
                      onPressed: () {},
                      child: SizedBox(
                        height: 60,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Витамин B, 2 мг',
                              style: TextStyle(
                                fontSize: 17,
                                color: Colors.black,
                                fontFamily: "Arial",
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
