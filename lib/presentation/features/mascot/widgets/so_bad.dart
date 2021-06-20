import 'package:flutter/material.dart';
import 'package:iherb/presentation/theme/app_colors.dart';

class SoBadContent extends StatelessWidget {
  const SoBadContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Что-то мне нехорошо...',
          style: TextStyle(
            fontSize: 24,
            color: AppColor.primary,
            fontFamily: "Arial",
            fontWeight: FontWeight.w700,
          ),
        ),
        const SizedBox(height: 30),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 35),
          child: Text(
            'Так и знал! Надо было сдать анализы.\n\nПохоже я съел несовместимые витамины. Не хочешь почитать об этом чуть подробнее чтобы не столкнуться\nс такой же проблемой?',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 16,
              color: AppColor.primary,
              height: 1.2,
              fontFamily: "Arial",
            ),
          ),
        ),
      ],
    );
  }
}
