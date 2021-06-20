import 'package:flutter/material.dart';
import 'package:iherb/data/models/drug_model.dart';

class DrugCard extends StatelessWidget {
  const DrugCard({Key? key, required this.model}) : super(key: key);
  final DrugModel model;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 91,
      margin: EdgeInsets.only(top: 8),
      padding: EdgeInsets.symmetric(vertical: 18, horizontal: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(14),
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: model.type.colors,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Text(
                'Витамин ${model.type.name}, ${model.mg} мг',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
          Row(
            children: [
              Text(
                'Количество: ${model.count}',
                style: TextStyle(
                  color: Colors.white.withOpacity(.4),
                  fontSize: 17,
                  fontWeight: FontWeight.w400,
                ),
              ),
              SizedBox(width: 21),
              Text(
                model.when,
                style: TextStyle(
                  color: Colors.white.withOpacity(.4),
                  fontSize: 17,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
