import 'package:flutter/material.dart';
import 'package:iherb/data/models/article_model.dart';
import 'package:iherb/presentation/theme/app_colors.dart';

class ArticleView extends StatelessWidget {
  const ArticleView({Key? key, required this.model}) : super(key: key);
  final ArticleModel model;
  String get tags => model.tags.join(' • ').toUpperCase();

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(color: AppColor.bg),
      child: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return [
            SliverAppBar(
              backgroundColor: AppColor.primary,
              expandedHeight: 400,
              collapsedHeight: kToolbarHeight,
              flexibleSpace: FlexibleSpaceBar(
                background: Stack(
                  children: [
                    Positioned.fill(
                      child: Image.network(
                        model.photo,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Positioned(
                      left: 25,
                      right: 25,
                      bottom: 25,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
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
                            model.title,
                            style: TextStyle(
                              fontSize: 24,
                              color: Colors.white,
                              fontFamily: "ArialBlack",
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            )
          ];
        },
        body: SingleChildScrollView(
            padding: EdgeInsets.all(24),
            child: Text(
              model.text,
              style: TextStyle(
                fontSize: 16,
                color: Colors.black.withOpacity(.8),
                fontFamily: "Arial",
              ),
            )),
      ),
    );
  }
}
