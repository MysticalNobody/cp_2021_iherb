import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iherb/app/app.dart';
import 'package:iherb/core/utils/alert_action.dart';

class SnackBarUtils {
  SnackBarUtils._();

  static show(
      {required String message,
      String? title,
      List<AlertAction> actions = const []}) {
    List<Widget> _actions = actions
        .map((e) => TextButton(
              child: Text(e.text),
              onPressed: () {
                if (e.onTap != null) {
                  e.onTap!();
                }
                if (e.withDismiss) {
                  App.router.pop();
                }
              },
            ))
        .toList();

    Flushbar(
        title: "$title",
        message: "$message",
        duration: Duration(seconds: 3),
        margin: EdgeInsets.all(8),
        borderRadius: BorderRadius.circular(8),
        flushbarPosition: FlushbarPosition.BOTTOM,
        flushbarStyle: FlushbarStyle.FLOATING,
      mainButton: Row(
        children: _actions,
      ),
    )
      ..show(App.router.navigatorKey.currentContext!);
  }
}
