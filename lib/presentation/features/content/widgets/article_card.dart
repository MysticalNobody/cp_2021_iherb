import 'package:flutter/material.dart';
import 'package:iherb/data/models/article_model.dart';
import 'package:iherb/presentation/widgets/paralax_image.dart';

class ArticleCard extends StatelessWidget {
  ArticleCard(this.article);

  final ArticleModel article;

  String get tags => article.tags.join(' • ').toUpperCase();

  final GlobalKey _backgroundImageKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(26),
      child: SizedBox(
        child: Stack(
          children: [
            _buildParallaxBackground(context, _backgroundImageKey),
            DecoratedBox(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.transparent,
                    Colors.black.withOpacity(0.7),
                  ],
                ),
              ),
              child: Opacity(
                opacity: 0,
                child: _buildParallaxBackground(context, GlobalKey()),
              ),
            ),
            Positioned(
              bottom: 23,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 22),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width - 96,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        tags,
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.white.withOpacity(.8),
                          fontFamily: "Arial",
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        article.title,
                        style: TextStyle(
                          fontSize: 24,
                          color: Colors.white,
                          fontFamily: "ArialBlack",
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildParallaxBackground(BuildContext context, GlobalKey key) {
    if (Scrollable.of(context) == null) {
      return Image.network(
        article.photo,
        key: key,
        fit: BoxFit.contain,
      );
    }
    return AspectRatio(
      aspectRatio: 14 / 9,
      child: Flow(
        delegate: ParallaxFlowDelegate(
          scrollable: Scrollable.of(context)!,
          listItemContext: context,
          backgroundImageKey: key,
        ),
        children: [
          Image.network(
            article.photo,
            key: key,
            fit: BoxFit.contain,
          ),
        ],
      ),
    );
  }
}
