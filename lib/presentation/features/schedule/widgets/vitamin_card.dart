import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:iherb/core/utils/utils.dart';
import 'package:iherb/presentation/theme/app_colors.dart';

class VitaminCard extends StatefulWidget {
  const VitaminCard({
    Key? key,
    required this.vitaminAsset,
    required this.count,
    required this.when,
    required this.name,
    required this.time,
    required this.colors,
  }) : super(key: key);

  final String vitaminAsset;
  final String count;
  final String when;
  final String name;
  final TimeOfDay time;
  final List<Color> colors;

  @override
  _VitaminCardState createState() => _VitaminCardState();
}

class _VitaminCardState extends State<VitaminCard> {
  late final SlidableController controller;

  SlideActionType? slideActionType;
  double cardRotateDeg = 0;

  @override
  void initState() {
    controller = SlidableController(
      onSlideAnimationChanged: handleSlideAnimationChanged,
    );
    super.initState();
  }

  void handleSlideAnimationChanged(Animation<double>? slideAnimation) {
    slideAnimation?.addListener(() {
      if (cardRotateDeg == slideAnimation.value) return;
      cardRotateDeg = slideAnimation.value * 2 * 34.87 / 360.0;
      if (controller.activeState != null) {
        slideActionType = controller.activeState?.actionType;
      }
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        if (slideActionType == SlideActionType.primary)
          Positioned(
            left: 23,
            top: 110,
            child: RotationTransition(
              turns: AlwaysStoppedAnimation(-20 / 360),
              child: Container(
                decoration: BoxDecoration(
                  color: AppColor.primary,
                  borderRadius: BorderRadius.circular(51),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 42,
                    vertical: 36,
                  ),
                  child: Text(
                    'Принял!',
                    style: TextStyle(
                      fontSize: 32,
                      color: Colors.white,
                      fontFamily: "ArialBlack",
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ),
              ),
            ),
          ),
        if (slideActionType == SlideActionType.secondary)
          Positioned(
            right: -23 + (cardRotateDeg > 0.03 ? 0 : (50 - cardRotateDeg * 5000).clamp(0, 50)),
            top: 110,
            child: RotationTransition(
              turns: AlwaysStoppedAnimation(19.16 / 360),
              child: Container(
                decoration: BoxDecoration(
                  color: AppColor.red,
                  borderRadius: BorderRadius.circular(51),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 42,
                    vertical: 36,
                  ),
                  child: Text(
                    'Пропустил(',
                    style: TextStyle(
                      fontSize: 32,
                      color: Colors.white,
                      fontFamily: "ArialBlack",
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ),
              ),
            ),
          ),
        Slidable(
          actionPane: SlidableDrawerActionPane(),
          controller: controller,
          actionExtentRatio: 0.5,
          child: RotationTransition(
            turns: AlwaysStoppedAnimation((slideActionType == SlideActionType.primary ? 1 : -1) * cardRotateDeg),
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 24),
              width: MediaQuery.of(context).size.width,
              height: 400,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(32),
                gradient: LinearGradient(
                  colors: widget.colors,
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                ),
              ),
              child: Stack(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 24,
                      vertical: 20,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.count.toUpperCase(),
                          style: TextStyle(
                            fontSize: 24,
                            color: Colors.white,
                            fontFamily: "Arial",
                          ),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          widget.when.toUpperCase(),
                          style: TextStyle(
                            fontSize: 24,
                            color: Colors.white.withOpacity(.47),
                            fontFamily: "Arial",
                          ),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          widget.name.toUpperCase(),
                          style: TextStyle(
                            fontSize: 24,
                            color: Colors.white,
                            fontFamily: "Arial",
                          ),
                        ),
                        Text(
                          '${Utils.twoDigits(widget.time.hour)}:${Utils.twoDigits(widget.time.minute)}',
                          style: TextStyle(
                            fontSize: 64,
                            color: Colors.white,
                            fontFamily: "ArialBlack",
                            fontWeight: FontWeight.w900,
                            letterSpacing: -0.3,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Image.asset(
                    widget.vitaminAsset,
                    width: MediaQuery.of(context).size.width - 44,
                    fit: BoxFit.fitWidth,
                  ),
                ],
              ),
            ),
          ),
          actions: <Widget>[Container()],
          secondaryActions: <Widget>[Container()],
        ),
      ],
    );
  }
}
