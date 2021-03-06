import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:iherb/domain/services/tab_service.dart';
import 'package:iherb/presentation/features/content/content_view.dart';
import 'package:iherb/presentation/features/drugs/drugs_view.dart';
import 'package:iherb/presentation/features/profile/profile_view.dart';
import 'package:iherb/presentation/features/schedule/schedule_view.dart';
import 'package:iherb/presentation/theme/app_colors.dart';
import 'package:provider/provider.dart';
import 'package:iherb/domain/services/auth_service.dart';
import 'package:stacked/stacked.dart';

import 'home_viewmodel.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomeViewModel>.reactive(
      viewModelBuilder: () => HomeViewModel(
        apiAuthService: context.read<AuthService>(),
        tabService: context.read<TabService>(),
      ),
      builder: (context, model, child) {
        return Scaffold(
          bottomNavigationBar: ValueListenableBuilder(
            valueListenable: model.tabService.page,
            builder: (context, int page, child) {
              return BottomNavigationBar(
                backgroundColor: AppColor.white,
                elevation: 0,
                enableFeedback: true,
                currentIndex: page,
                type: BottomNavigationBarType.fixed,
                onTap: model.changePage,
                items: List.generate(
                  model.bottomIcons.length,
                  (index) => BottomNavigationBarItem(
                    icon: SvgPicture.asset(
                      model.bottomIcons[index],
                      color: page == index
                          ? AppColor.primary
                          : AppColor.unselectedBottomTabColor,
                    ),
                    // ignore: deprecated_member_use
                    title: Padding(
                      padding: EdgeInsets.only(top: 5),
                      child: SizedBox(
                        width: 4,
                        height: 4,
                        child: DecoratedBox(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: page == index
                                ? AppColor.primary
                                : AppColor.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
          body: StreamBuilder<double>(
            stream: model.opacity.values,
            builder: (context, snapshot) => Opacity(
              opacity: model.opacity.value,
              child: PageView.builder(
                controller: model.pageController,
                physics: NeverScrollableScrollPhysics(),
                itemCount: model.pages.length,
                itemBuilder: (_, i) => model.pages[i],
              ),
            ),
          ),
        );
      },
    );
  }
}
