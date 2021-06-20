import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iherb/data/models/good_model.dart';
import 'package:iherb/presentation/theme/app_colors.dart';
import 'package:url_launcher/url_launcher.dart';

class GoodCard extends StatelessWidget {
  const GoodCard(this.good);

  final GoodModel good;

  String get price => good.price;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: (MediaQuery.of(context).size.width - 63) / 2,
      child: DecoratedBox(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(26),
          color: AppColor.white,
        ),
        child: CupertinoButton(
          padding: EdgeInsets.zero,
          minSize: 0,
          onPressed: () {
            if (good.url.isNotEmpty) {
              launch(good.url);
            }
          },
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 12,
              vertical: 17,
            ),
            child: Column(
              children: [
                SizedBox(
                  width: (MediaQuery.of(context).size.width - 110) / 2,
                  child: Image(
                    fit: BoxFit.fitWidth,
                    image: NetworkImage(good.photo),
                  ),
                ),
                SizedBox(height: 17),
                Text(good.title),
                SizedBox(height: 10),
                Text(price),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
