import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SexCupertinoActionSheet extends StatelessWidget {
  const SexCupertinoActionSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final sexes = [0, 1];
    return CupertinoActionSheet(
      title: const Text(
        'Пол',
      ),
      actions: List.generate(
        sexes.length,
        (index) => CupertinoActionSheetAction(
          onPressed: () => Navigator.of(context).pop(sexes[index]),
          child: Text(
            sexes[index] == 0 ? 'Мужской' : 'Женский',
          ),
        ),
      ),
      cancelButton: CupertinoActionSheetAction(
        isDefaultAction: true,
        onPressed: Navigator.of(context).pop,
        child: const Text(
          'Отмена',
        ),
      ),
    );
  }
}
