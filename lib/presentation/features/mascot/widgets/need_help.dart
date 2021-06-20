import 'package:flutter/material.dart';
import 'package:iherb/presentation/theme/app_colors.dart';

class NeedHelpContent extends StatelessWidget {
  const NeedHelpContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 35),
      child: Column(
        children: [
          Text(
            'Изивини, что отвлек...',
            style: TextStyle(
              fontSize: 24,
              color: AppColor.primary,
              fontFamily: "Arial",
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 30),
          Text(
            'Но мне срочно нужна твоя помощь!\n\nНе можешь подать мне вот тот\nвитамин D и вооот тот витамин B12?',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 16,
              color: AppColor.primary,
              height: 1.2,
              fontFamily: "Arial",
            ),
          ),
          const SizedBox(height: 30),
          Text(
            'Просто перетяни их ко мне в рот.',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 16,
              color: AppColor.primary.withOpacity(0.4),
              height: 1.2,
              fontFamily: "Arial",
            ),
          ),
        ],
      ),
    );
  }
}
