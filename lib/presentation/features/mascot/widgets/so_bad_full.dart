import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iherb/app/app.dart';
import 'package:iherb/data/models/article_model.dart';
import 'package:iherb/presentation/features/content/widgets/article_card.dart';
import 'package:iherb/presentation/theme/app_colors.dart';

class SoBadFullContent extends StatelessWidget {
  const SoBadFullContent({Key? key, required this.article}) : super(key: key);

  final ArticleModel article;

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
        const SizedBox(height: 30),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 24),
          child: ArticleCard(article),
        ),
        const SizedBox(height: 13),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 24),
          child: CupertinoButton(
            onPressed: App.router.pop,
            minSize: 0,
            padding: EdgeInsets.zero,
            child: Container(
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: AppColor.primary,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 28),
                child: Center(
                  child: Text(
                    'Давай немного позже',
                    style: TextStyle(
                      fontSize: 19,
                      color: AppColor.white,
                      fontFamily: "Arial",
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
