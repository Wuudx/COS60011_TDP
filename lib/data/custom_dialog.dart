import 'dart:io';

import 'package:council_reporting/data/numbers.dart';
import 'package:council_reporting/data/widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomDialog {
  static void show(context, String heading, String subHeading, String positiveButtonText,
      VoidCallback onPressedPositive,
      [String? negativeButtonText, VoidCallback? onPressedNegative]) {
    if (Platform.isIOS) {
      // iOS-specific code
      showCupertinoDialog(
        context: context,
        useRootNavigator: false,
        builder: (_) => CupertinoAlertDialog(
          title: Text(
            heading,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
          content: Text(
            subHeading,
            style: const TextStyle(
              color: Colours.kDarkGray,
            ),
          ),
          actions: <Widget>[
            FormWidgets.textButtonTB(
              negativeButtonText ?? 'Cancel',
              Colors.red,
              Colours.kDarkGray,
              onClick: () {
                Navigator.pop(context);
              },
            ),
            FormWidgets.textButtonTB(
              positiveButtonText,
              Colors.black,
              Colours.kDarkGray,
              onClick: onPressedPositive,
            ),
          ],
        ),
      );
    } else {
      showDialog(
        useRootNavigator: false,
        context: context,
        builder: (_) => AlertDialog(
          title: Text(
            heading,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
          content: Text(
            subHeading,
            style: const TextStyle(
              color: Colours.kDarkGray,
            ),
          ),
          actions: <Widget>[
            FormWidgets.textButtonTB(
              negativeButtonText ?? 'Cancel',
              Colors.red,
              Colours.kDarkGray,
              onClick: () {
                if (onPressedNegative != null) {
                  onPressedNegative();
                } else {
                  Navigator.pop(context);
                }
              },
            ),
            FormWidgets.textButtonTB(
              positiveButtonText,
              Colors.black,
              Colours.kDarkGray,
              onClick: onPressedPositive,
            ),
          ],
        ),
      );
    }
  }
}
