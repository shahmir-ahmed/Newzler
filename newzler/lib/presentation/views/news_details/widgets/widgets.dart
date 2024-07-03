import 'package:flutter/material.dart';
import 'package:newzler/configs/utils.dart';

class RedButton extends StatelessWidget {
  RedButton({required this.onPressed, required this.buttonText});

  // on pressed
  VoidCallback onPressed;
  String buttonText;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Text(
        buttonText,
        style: Utils.kAppPrimaryTextStyle.copyWith(fontSize: 18.0),
      ),
      style: ButtonStyle(
          backgroundColor: WidgetStatePropertyAll(Colors.red),
          foregroundColor: WidgetStatePropertyAll(Utils.whiteColor),
          elevation: WidgetStatePropertyAll(15.0),
          shadowColor: WidgetStatePropertyAll(Colors.red)),
    );
  }
}
