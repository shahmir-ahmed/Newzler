import 'package:flutter/material.dart';
import 'package:newzler/configs/utils.dart';

// whole app common widgets here

class PrimaryButton extends StatelessWidget {
  PrimaryButton(
      {required this.onPressed,
      required this.buttonText,
      this.buttonWidth,
      this.buttonHeight,
      this.icon});

  VoidCallback onPressed;
  String buttonText;
  double? buttonWidth;
  double? buttonHeight;
  Icon? icon;

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
                backgroundColor: WidgetStatePropertyAll(Utils.kAppPrimaryColor),
                elevation: WidgetStatePropertyAll(3.0),
                foregroundColor: WidgetStatePropertyAll(Utils.whiteColor),
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
                elevation: WidgetStatePropertyAll(3.0),
                foregroundColor: WidgetStatePropertyAll(Utils.whiteColor),
                // fixedSize: buttonWidth!=null ? WidgetStatePropertyAll(ui.Size.fromWidth(buttonWidth!)) : null
              ),
            ),
    );
  }
}

// grey icon button for 'continue with email' button
class GreyIconButton extends StatelessWidget {
  GreyIconButton({
    required this.onPressed,
    required this.buttonText,
    required this.icon,
    this.buttonWidth,
    this.buttonHeight,
  });

  VoidCallback onPressed;
  String buttonText;
  Icon? icon;
  double? buttonWidth;
  double? buttonHeight;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: buttonWidth != null ? buttonWidth! : 88.0,
        height: buttonHeight != null ? buttonHeight! : 36.0,
        child: ElevatedButton.icon(
          onPressed: onPressed,
          label: Text(
            buttonText,
            style: Utils.kAppPrimaryTextStyle
                .copyWith(fontWeight: FontWeight.bold),
          ),
          style: ButtonStyle(
            backgroundColor: WidgetStatePropertyAll(Utils.kAppSecondaryColor),
            elevation: WidgetStatePropertyAll(0.0),
            foregroundColor: WidgetStatePropertyAll(Utils.whiteColor),
            // fixedSize: buttonWidth!=null ? WidgetStatePropertyAll(ui.Size.fromWidth(buttonWidth!)) : null
          ),
          icon: icon,
        ));
  }
}

// secondary button with white bg, grey text color
class SecondaryButton extends StatelessWidget {
  SecondaryButton(
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
          style: Utils.kAppPrimaryTextStyle
              .copyWith(fontWeight: FontWeight.w800, fontSize: 15.0),
        ),
        style: ButtonStyle(
            backgroundColor: WidgetStatePropertyAll(Utils.whiteColor),
            foregroundColor: WidgetStatePropertyAll(Utils.greyColor),
            side: WidgetStatePropertyAll(
                BorderSide(color: Utils.lightGreyColor2)),
            elevation: WidgetStatePropertyAll(0.0)

            // fixedSize: buttonWidth!=null ? WidgetStatePropertyAll(ui.Size.fromWidth(buttonWidth!)) : null
            ),
      ),
    );
  }
}
