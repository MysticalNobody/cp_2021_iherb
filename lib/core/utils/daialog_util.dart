import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iherb/app/app.dart';

import 'alert_action.dart';

class DialogUtils {
  DialogUtils._();

  static show({
    required String message,
    required String title,
    List<AlertAction> actions = const []
  }) {
    showDialog(
        context: App.router.navigatorKey.currentContext!,
        builder: (BuildContext context) {

          List<Widget> _actions = actions.map((e) => TextButton(
            child: Text(e.text),
            onPressed: () {
              if (e.onTap != null) {
                e.onTap!();
              }
              if (e.withDismiss) {
                App.router.pop();
              }
            },
          )).toList();

          if (Platform.isIOS)
            return CupertinoAlertDialog(
              title: Text(title),
              content: Text(message),
              actions: _actions,
            );
          else
            return AlertDialog(
              title: Text(title),
              content: Text(message),
              actions: _actions,
            );
        }
    );
  }
}

