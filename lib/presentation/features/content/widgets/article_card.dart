import 'package:flutter/material.dart';
import 'package:iherb/data/models/article_model.dart';

class ArticleCard extends StatelessWidget {
  const ArticleCard(this.article);

  final ArticleModel article;

  String get tags => article.tags.join(' • ');

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(26),
      child: Stack(
        children: [
          Image(
            fit: BoxFit.fitWidth,
            image: NetworkImage(article.photo),
          ),
          DecoratedBox(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.transparent,
                  Colors.black,
                ],
              ),
            ),
            child: Opacity(
              opacity: 0,
              child: Image(
                fit: BoxFit.fitWidth,
                image: NetworkImage(article.photo),
              ),
            ),
          ),
          Positioned(
            bottom: 23,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 22),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(tags),
                  Text(article.title),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
