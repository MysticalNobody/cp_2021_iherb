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

class MainDataProfileView extends StatefulWidget {
  const MainDataProfileView({Key? key}) : super(key: key);

  @override
  _MainDataProfileViewState createState() => _MainDataProfileViewState();
}

class _MainDataProfileViewState extends State<MainDataProfileView> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: ReactiveScaffold<MainDataProfileViewModel>(
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
                          onPressed: () async {
                            final res = await AppChooser.dateOfBirth(context);
                            if (res != null) {
                              final y = viewModel.getYears(res);
                              final _user = viewModel.user;
                              _user?.age = y;
                              viewModel.onChangeUser(_user!);
                            }
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
                                  viewModel.user?.age?.toString() ??
                                      'Не указан',
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
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(14),
                          ),
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
                                Row(
                                  children: [
                                    SizedBox(
                                      width: 120,
                                      child: TextField(
                                        onSubmitted: (val) {
                                          final res = int.tryParse(val);
                                          if (res != null) {
                                            final _user = viewModel.user;
                                            _user?.weight = res;
                                            viewModel.onChangeUser(_user!);
                                          }
                                        },
                                        focusNode: viewModel.weightFocusNode,
                                        controller: viewModel.weightController,
                                        decoration: InputDecoration(
                                            hintText: 'Введите вес'),
                                        keyboardType: TextInputType.number,
                                        style: TextStyle(
                                          fontSize: 17,
                                          color: Colors.black.withOpacity(.3),
                                          fontFamily: "Arial",
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 24,
                                      child: Text(
                                        'кг',
                                        textAlign: TextAlign.end,
                                        style: TextStyle(
                                          fontSize: 17,
                                          color: Colors.black.withOpacity(.3),
                                          fontFamily: "Arial",
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: 8),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(14),
                          ),
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
                                Row(
                                  children: [
                                    SizedBox(
                                      width: 120,
                                      child: TextField(
                                        focusNode: viewModel.heightFocusNode,
                                        controller: viewModel.heightController,
                                        decoration: InputDecoration(
                                            hintText: 'Введите рост'),
                                        keyboardType: TextInputType.number,
                                        style: TextStyle(
                                          fontSize: 17,
                                          color: Colors.black.withOpacity(.3),
                                          fontFamily: "Arial",
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 24,
                                      child: Text(
                                        'см',
                                        textAlign: TextAlign.end,
                                        style: TextStyle(
                                          fontSize: 17,
                                          color: Colors.black.withOpacity(.3),
                                          fontFamily: "Arial",
                                        ),
                                      ),
                                    )
                                  ],
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
          }),
    );
  }
}
