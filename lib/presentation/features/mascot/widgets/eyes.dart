import 'package:flutter/material.dart';

import 'eye.dart';

class MascotEyes extends StatelessWidget {
  const MascotEyes({
    Key? key,
    required this.dragPos,
  }) : super(key: key);

  final Offset? dragPos;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 146.59,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          MascotEye(),
          Positioned(
            left: 72,
            child: MascotEye(),
          ),
        ],
      ),
    );
  }
}
