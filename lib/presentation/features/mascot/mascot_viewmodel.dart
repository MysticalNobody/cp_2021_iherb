import 'package:flutter/material.dart';
import 'package:iherb/domain/services/content_service.dart';
import 'package:iherb/presentation/theme/icons_and_images.dart';
import 'package:stacked/stacked.dart';
import 'package:iherb/core/utils/utils.dart';

enum MascotStep { halfSmile, fullSmile, sad, info }

enum PillStatus { start, drag, target }

class MascotViewModel extends BaseViewModel {
  MascotViewModel(
    this.contentService,
    TickerProvider tickerProvider,
  ) {
    setAnimations(tickerProvider);
    call(); //??
  }
  final ContentService contentService;
  final log = getLogger('MascotViewModel');

  late AnimationController starController;
  late AnimationController sadController;
  late Animation<double> rotateAnimation;
  late Animation<double> expandAnimation;
  late Animation<Color?> colorAnimation;

  final List<PillStatus> pills = [
    PillStatus.start,
    PillStatus.start,
    PillStatus.start,
    PillStatus.start,
  ];

  MascotStep step = MascotStep.halfSmile;

  Offset? dragPos;

  String get smileAsset => [
        AppImages.imagesHalfSmile,
        AppImages.imagesFullSmile,
        AppImages.imagesSadSmile,
        AppImages.imagesSadSmile,
      ][step.index];

  void setAnimations(TickerProvider tickerProvider) {
    starController = AnimationController(
      vsync: tickerProvider,
      duration: Duration(seconds: 120),
    );
    sadController = AnimationController(
      vsync: tickerProvider,
      duration: Duration(seconds: 1),
    );
    rotateAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: starController,
        curve: Curves.linear,
      ),
    );
    starController.addStatusListener(
      (AnimationStatus status) {
        if (status == AnimationStatus.completed) {
          starController.repeat();
        }
      },
    );
    expandAnimation = Tween<double>(begin: 0.0, end: 2000.0).animate(
      CurvedAnimation(
        parent: sadController,
        curve: Curves.easeIn,
      ),
    );
    colorAnimation = ColorTween(
      begin: Color(0xFFA9DDEE),
      end: Color(0xFFF8B7C9),
    ).animate(
      CurvedAnimation(
        parent: sadController,
        curve: Curves.easeIn,
      ),
    );
    expandAnimation.addListener(notifyListeners);
    rotateAnimation.addListener(notifyListeners);
    colorAnimation.addListener(notifyListeners);
    starController.repeat();
  }

  void setPillStatus(int id, PillStatus status) {
    pills[id] = status;
    final targetCount = pills.where((s) => s == PillStatus.target).length;
    if (targetCount == 4) {
      makeSad();
    } else if (targetCount > 0) {
      makeFun();
    }
    notifyListeners();
  }

  void makeFun() {
    step = MascotStep.fullSmile;
    notifyListeners();
  }

  Future<void> makeSad() async {
    step = MascotStep.sad;
    notifyListeners();
    Future.delayed(Duration(seconds: 2)).then((value) {
      step = MascotStep.info;
      notifyListeners();
    });
    starController.stop();
    sadController.forward();
  }

  void onDrag(DragUpdateDetails details) {
    dragPos = details.globalPosition;
    notifyListeners();
  }

  call() async {}
}
