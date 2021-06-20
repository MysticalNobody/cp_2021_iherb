import 'package:flutter/material.dart';
import 'package:iherb/presentation/theme/app_colors.dart';

class MascotEye extends StatelessWidget {
  const MascotEye({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 75.18,
      height: 75.18,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Color(0xFFF8F8F8),
        border: Border.all(
          color: AppColor.primary,
          width: 3.76,
        ),
      ),
      child: Center(
        child: Container(
          width: 37.59,
          height: 37.59,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: AppColor.primary,
          ),
        ),
      ),
    );
  }
}
