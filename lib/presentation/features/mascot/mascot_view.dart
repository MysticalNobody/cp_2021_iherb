import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iherb/domain/services/content_service.dart';
import 'package:iherb/presentation/features/mascot/widgets/drag_item.dart';
import 'package:iherb/presentation/features/mascot/widgets/so_bad.dart';
import 'package:iherb/presentation/features/mascot/widgets/so_bad_full.dart';
import 'package:iherb/presentation/theme/app_colors.dart';
import 'package:iherb/presentation/theme/icons_and_images.dart';
import 'package:iherb/presentation/widgets/reactive_scaffold.dart';
import 'package:provider/provider.dart';
import 'mascot_viewmodel.dart';
import 'widgets/eyes.dart';
import 'widgets/need_help.dart';

class MascotView extends StatefulWidget {
  MascotView({Key? key}) : super(key: key);

  @override
  _MascotViewState createState() => _MascotViewState();
}

class _MascotViewState extends State<MascotView> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return ReactiveScaffold<MascotViewModel>(
      viewModelBuilder: () => MascotViewModel(
        context.read<ContentService>(),
        this,
      ),
      body: (context, model, _) => Stack(
        children: [
          Positioned(
            left: -15 - model.expandAnimation.value / 2,
            top: 75 - model.expandAnimation.value / 2,
            child: RotationTransition(
              turns: AlwaysStoppedAnimation(model.rotateAnimation.value + 0.0),
              child: Image.asset(
                AppImages.imagesStar,
                width: (MediaQuery.of(context).size.width + 30) + model.expandAnimation.value,
                fit: BoxFit.fitWidth,
                color: model.colorAnimation.value,
              ),
            ),
          ),
          Positioned(
            left: (MediaQuery.of(context).size.width - 146.59) / 2,
            top: 240,
            child: Column(
              children: [
                MascotEyes(),
                const SizedBox(height: 10),
                DragTarget(
                  builder: (
                    context,
                    candidateData,
                    rejectedData,
                  ) =>
                      Image.asset(model.smileAsset),
                  onWillAccept: (data) => true,
                ),
              ],
            ),
          ),
          Positioned(
            left: 50,
            top: 400,
            child: DragItem(
              id: 0,
              degRotation: 13,
              imageAsset: AppImages.imagesB12,
              onChanged: model.setPillStatus,
              status: model.pills[0],
            ),
          ),
          Positioned(
            right: 10,
            top: 389,
            child: DragItem(
              id: 1,
              degRotation: -42,
              imageAsset: AppImages.imagesB12,
              onChanged: model.setPillStatus,
              status: model.pills[1],
            ),
          ),
          Positioned(
            left: 50,
            top: 60,
            child: DragItem(
              id: 2,
              degRotation: 60,
              imageAsset: AppImages.imagesD1,
              onChanged: model.setPillStatus,
              status: model.pills[2],
            ),
          ),
          Positioned(
            right: 20,
            top: 150,
            child: DragItem(
              id: 3,
              degRotation: -30,
              imageAsset: AppImages.imagesD1,
              onChanged: model.setPillStatus,
              status: model.pills[3],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: AnimatedContainer(
              duration: Duration(milliseconds: 300),
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: AppColor.white,
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(39),
                ),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const SizedBox(height: 40),
                  if (model.step == MascotStep.halfSmile || model.step == MascotStep.fullSmile)
                    const NeedHelpContent()
                  else if (model.step == MascotStep.sad)
                    SoBadContent()
                  else
                    SoBadFullContent(
                      article: model.contentService.articles[1],
                    ),
                  const SizedBox(height: 30),
                  SafeArea(
                    child: SizedBox(),
                    top: false,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
