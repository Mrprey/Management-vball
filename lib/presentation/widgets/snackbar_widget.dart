import 'package:flutter/material.dart';

class SnackbarWidget {
  SnackbarWidget._(); // Private constructor to prevent instantiation

  static void show(BuildContext context, String message, Color backgroundColor,
      TextStyle? textStyle) {
    final scaffoldMessenger = ScaffoldMessenger.of(context);
    scaffoldMessenger.showSnackBar(
      SnackBar(
        backgroundColor: backgroundColor,
        content: Text(
          message,
          style: textStyle,
        ),
      ),
    );
  }
}
