import 'package:flutter/material.dart';
import 'package:awesome_dialog/awesome_dialog.dart';

class MyDialog {
  static void show(
      BuildContext context,
      String title,
      String message,
      DialogType type,
      Function() onOkPressed,
      ) {
    AwesomeDialog(
      context: context,
      animType: AnimType.scale,
      dialogType: type,
      title: title,
      desc: message,
      btnOkOnPress: onOkPressed,
    ).show();
  }
}
