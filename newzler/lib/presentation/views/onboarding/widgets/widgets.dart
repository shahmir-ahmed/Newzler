// icon button widget for social login
import 'package:flutter/material.dart';
import 'package:newzler/configs/utils.dart';

class SocialLoginButton extends StatelessWidget {
  SocialLoginButton({required this.onPressed, required this.iconImage});

  VoidCallback onPressed;
  AssetImage iconImage;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ButtonStyle(
          backgroundColor: WidgetStatePropertyAll(Utils.whiteColor),
          elevation: WidgetStatePropertyAll(0.0),
          shape: WidgetStatePropertyAll(RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30.0),
              side: BorderSide(color: Utils.lightGreyColor))),
          minimumSize: WidgetStatePropertyAll(Size(100.0, 65.0)),
          overlayColor: WidgetStatePropertyAll(Utils.whiteColor)),
      child: Image(image: iconImage, width: 30, height: 30),
    );
  }
}
