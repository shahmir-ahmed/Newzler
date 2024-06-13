import 'package:flutter/material.dart';
import 'package:newzler/configs/utils.dart';

class PrimaryButton extends StatelessWidget {
  PrimaryButton(
      {required this.onPressed,
      required this.buttonText,
      this.buttonWidth,
      this.buttonHeight,
      this.icon,
      this.fontColor,
      this.bgColor});

  VoidCallback onPressed;
  String buttonText;
  double? buttonWidth;
  double? buttonHeight;
  // for elevated icon button for continue with email
  Icon? icon;
  Color? fontColor;
  Color? bgColor;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: buttonWidth != null ? buttonWidth! : 88.0,
      height: buttonHeight != null ? buttonHeight! : 36.0,
      child: icon != null
          ? ElevatedButton.icon(
              onPressed: onPressed,
              label: Text(
                buttonText,
                style: Utils.kAppPrimaryTextStyle
                    .copyWith(fontWeight: FontWeight.bold),
              ),
              style: ButtonStyle(
                backgroundColor: WidgetStatePropertyAll(bgColor),
                elevation: WidgetStatePropertyAll(0.0),
                foregroundColor: WidgetStatePropertyAll(fontColor),
                // fixedSize: buttonWidth!=null ? WidgetStatePropertyAll(ui.Size.fromWidth(buttonWidth!)) : null
              ),
              icon: icon,
            )
          : ElevatedButton(
              onPressed: onPressed,
              child: Text(
                buttonText,
                style: Utils.kAppPrimaryTextStyle
                    .copyWith(fontWeight: FontWeight.bold),
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
