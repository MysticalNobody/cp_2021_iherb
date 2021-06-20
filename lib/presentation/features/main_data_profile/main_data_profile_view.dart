import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iherb/app/app.dart';
import 'package:iherb/domain/services/auth_service.dart';
import 'package:iherb/presentation/theme/app_colors.dart';
import 'package:iherb/presentation/widgets/appbar.dart';
import 'package:iherb/presentation/widgets/chooser.dart';
import 'package:iherb/presentation/widgets/reactive_scaffold.dart';
import 'package:provider/provider.dart';

import 'main_data_profile_view_model.dart';

class MainDataProfileView extends StatelessWidget {
  const MainDataProfileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ReactiveScaffold<MainDataProfileViewModel>(
        viewModelBuilder: () =>
            MainDataProfileViewModel(context.read<AuthService>()),
        body: (context, viewModel, __) {
          return CustomScrollView(
            physics: BouncingScrollPhysics(),
            slivers: [
              Topbar(
                title: 'ОСНОВНЫЕ ДАННЫЕ',
                bg: AppColor.bg,
                onPop: () => App.router.pop(),
              ),
              SliverPadding(
                padding:
                    EdgeInsets.only(left: 25, right: 25, bottom: 34, top: 24),
                sliver: SliverList(
                  delegate: SliverChildListDelegate(
                    [
                      CupertinoButton(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        color: Colors.white,
                        minSize: 0,
                        onPressed: () async {
                          final res = await AppChooser.sex(context);
                          if (res != null && res != viewModel.user?.sex) {
                            final _user = viewModel.user;
                            _user?.sex = res;
                            _user?.id = null;
                            viewModel.onChangeUser(_user!);
                          }
                        },
                        child: SizedBox(
                          height: 60,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Ваш пол',
                                style: TextStyle(
                                  fontSize: 17,
                                  color: Colors.black,
                                  fontFamily: "Arial",
                                ),
                              ),
                              Text(
                                viewModel.user?.sex ?? 'Не указан',
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
                      SizedBox(height: 8),
                      CupertinoButton(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        color: Colors.white,
                        minSize: 0,
                        onPressed: () {
                          AppChooser.dateOfBirth(context);
                        },
                        child: SizedBox(
                          height: 60,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Возраст',
                                style: TextStyle(
                                  fontSize: 17,
                                  color: Colors.black,
                                  fontFamily: "Arial",
                                ),
                              ),
                              Text(
                                viewModel.user?.age?.toString() ?? 'Не указан',
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
                                'Вес',
                                style: TextStyle(
                                  fontSize: 17,
                                  color: Colors.black,
                                  fontFamily: "Arial",
                                ),
                              ),
                              Text(
                                viewModel.user?.weight == null
                                    ? 'Не указан'
                                    : '${viewModel.user?.weight} кг',
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
                                'Рост',
                                style: TextStyle(
                                  fontSize: 17,
                                  color: Colors.black,
                                  fontFamily: "Arial",
                                ),
                              ),
                              Text(
                                viewModel.user?.weight == null
                                    ? 'Не указан'
                                    : '${viewModel.user?.height} см',
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
                      Text('АЛЛЕРГИЯ',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.black.withOpacity(.3),
                            fontFamily: "Arial",
                          )),
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
                                'Пищевая аллергия',
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
                                'Непереносимость глютена',
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
                                'Непереносимость глютена',
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
                                'Непереносимость глютена',
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
                                'Непереносимость глютена',
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
          );
        });
  }
}
