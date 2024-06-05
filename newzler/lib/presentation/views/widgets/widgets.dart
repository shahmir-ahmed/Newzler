import 'dart:ffi';
import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:newzler/configs/utils.dart';

class PrimaryButton extends StatelessWidget {
  PrimaryButton(
      {required this.onPressed,
      required this.buttonText,
      this.buttonWidth,
      this.buttonHeight});

  VoidCallback onPressed;
  String buttonText;
  double? buttonWidth;
  double? buttonHeight;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: buttonWidth != null ? buttonWidth! : 88.0,
      height: buttonHeight != null ? buttonHeight! : 36.0,
      child: ElevatedButton(
        onPressed: onPressed,
        child: Text(
          buttonText,
          style:
              Utils.kAppPrimaryTextStyle.copyWith(fontWeight: FontWeight.bold),
        ),
        style: ButtonStyle(
          backgroundColor: WidgetStatePropertyAll(Utils.kAppPrimaryColor),
          shadowColor: WidgetStatePropertyAll(Utils.kAppPrimaryColor),
          elevation: WidgetStatePropertyAll(5.0),
          foregroundColor: WidgetStatePropertyAll(Utils.whiteColor),
          // fixedSize: buttonWidth!=null ? WidgetStatePropertyAll(ui.Size.fromWidth(buttonWidth!)) : null
        ),
      ),
    );
  }
}
