// icon button widget for social login
import 'package:flutter/material.dart';
import 'package:newzler/configs/utils.dart';

// common widgets for onboarding screens here

// social login button (fb, google, twitter)
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
          elevation: const WidgetStatePropertyAll(0.0),
          shape: WidgetStatePropertyAll(RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30.0),
              side: BorderSide(color: Utils.lightGreyColor))),
          minimumSize: const WidgetStatePropertyAll(Size(100.0, 60.0)),
          overlayColor: WidgetStatePropertyAll(Utils.whiteColor)),
      child: Image(image: iconImage, width: 30, height: 30),
    );
  }
}
