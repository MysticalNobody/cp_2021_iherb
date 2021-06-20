import 'package:flutter/material.dart';

import '../mascot_viewmodel.dart';

class DragItem extends StatelessWidget {
  const DragItem({
    Key? key,
    required this.onChanged,
    required this.degRotation,
    required this.status,
    required this.id,
    required this.imageAsset,
    required this.onDrag,
  }) : super(key: key);

  final void Function(int index, PillStatus status) onChanged;
  final void Function(DragUpdateDetails) onDrag;
  final double degRotation;
  final PillStatus status;
  final String imageAsset;
  final int id;

  @override
  Widget build(BuildContext context) {
    return RotationTransition(
      turns: AlwaysStoppedAnimation(degRotation / 360),
      child: Draggable(
        data: id,
        child: Visibility(
          visible: status == PillStatus.start,
          child: Image.asset(imageAsset),
        ),
        feedback: Image.asset(imageAsset),
        onDragUpdate: onDrag,
        onDragCompleted: () => onChanged(id, PillStatus.target),
        onDragStarted: () => onChanged(id, PillStatus.drag),
        onDragEnd: (details) => onChanged(id, PillStatus.start),
      ),
    );
  }
}
