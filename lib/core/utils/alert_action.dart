

import 'package:flutter/material.dart';

class AlertAction {
  AlertAction(this.text, {this.withDismiss = true, this.onTap});

  final VoidCallback? onTap;
  final String text;
  final bool withDismiss;
}
