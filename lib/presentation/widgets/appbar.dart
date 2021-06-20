import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iherb/presentation/theme/app_colors.dart';
import 'package:iherb/presentation/theme/app_text_theme.dart';

class Topbar extends StatelessWidget {
  const Topbar({
    Key? key,
    this.onPop,
    required this.title,
    required this.bg,
    this.implyLeading = true,
    this.leadingRight = false,
    this.action,
  }) : super(key: key);
  final String title;
  final Function? onPop;
  final bool implyLeading;
  final bool leadingRight;
  final Widget? action;
  final Color bg;

  @override
  Widget build(BuildContext context) {
    final hasLeading =
        implyLeading && Navigator.canPop(context) || onPop != null;
    final toolbarHeight = kToolbarHeight * 1.5;
    return SliverAppBar(
      expandedHeight: toolbarHeight,
      pinned: true,
      elevation: 4,
      automaticallyImplyLeading: false,
      backgroundColor: bg,
      flexibleSpace: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          final FlexibleSpaceBarSettings? settings = context
              .dependOnInheritedWidgetOfExactType<FlexibleSpaceBarSettings>();

          final double deltaExtent =
              (settings?.maxExtent ?? 0) - (settings?.minExtent ?? 0);

          // 0.0 -> Expanded
          // 1.0 -> Collapsed to toolbar
          final double t = (1.0 -
                  ((settings?.currentExtent ?? 0) -
                          (settings?.minExtent ?? 0)) /
                      deltaExtent)
              .clamp(0.0, 1.0);

          final double paddingValue =
              Tween<double>(begin: 42 + (hasLeading ? 12 : 0), end: 0)
                  .transform(t);
          final double textSizeValue =
              Tween<double>(begin: 24, end: 16).transform(t);
          final double scaleValue =
              Tween<double>(begin: 1.5, end: 1.0).transform(t);
          final double leadingTitlePadding =
              Tween<double>(begin: 16, end: 68).transform(t);
          final Matrix4 scaleTransform = Matrix4.identity()
            ..translate(scaleValue);
          final Alignment titleAlignment =
              AlignmentTween(begin: Alignment.topLeft, end: Alignment.center)
                  .transform(t);

          return SafeArea(
            child: Stack(
              children: [
                if (hasLeading && onPop != null)
                  Align(
                    alignment:
                        leadingRight ? Alignment.topRight : Alignment.topLeft,
                    child: Container(
                      width: 36,
                      height: 36,
                      margin: EdgeInsets.only(
                        left: leadingRight ? 0 : 16,
                        right: leadingRight ? 16 : 0,
                        top: 10,
                      ),
                      child: CupertinoButton(
                        minSize: 0,
                        padding: EdgeInsets.zero,
                        onPressed: () => onPop!(),
                        child: Icon(
                          leadingRight ? Icons.close : Icons.arrow_back,
                          size: 34,
                          color: AppColor.primary.withOpacity(.3),
                        ),
                      ),
                    ),
                  ),
                Padding(
                  padding: EdgeInsets.only(
                    top: paddingValue,
                    left: 24,
                    right: 24,
                  ),
                  child: Transform(
                    alignment: titleAlignment,
                    transform: scaleTransform,
                    child: Container(
                      alignment: titleAlignment,
                      width: constraints.maxWidth / scaleValue,
                      child: AutoSizeText(
                        title,
                        maxLines: 1,
                        style: TextStyle(
                          fontFamily: 'Arial',
                          fontWeight: FontWeight.bold,
                        ).copyWith(fontSize: textSizeValue),
                      ),
                    ),
                  ),
                ),
                if (action != null)
                  Align(
                    alignment: Alignment.topRight,
                    child: Padding(
                      padding: EdgeInsets.only(
                        top: paddingValue / 1.6,
                      ),
                      child: action,
                    ),
                  )
              ],
            ),
          );
        },
      ),
    );
  }
}
