import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Utils {
  // colors
  static Color whiteColor = Colors.white;
  static Color kAppPrimaryColor = Color(0xff209CEE);
  static Color kAppSecondaryColor = Color(0xff27272E);
  static Color lightGreyColor = Color.fromARGB(255, 114, 114, 114);
  static Color lightGreyColor2 = Color(0xffCA8A8A8);
  static Color lightGreyColor3 = Color(0xffCCCCCC);
  static Color lightGreyColor4 = Color(0xffF2F2F2);
  static Color greyColor = Color(0xff4A4A4A);

  // text style
  static TextStyle kAppPrimaryTextStyle =
      GoogleFonts.raleway(fontSize: 17.0, fontWeight: FontWeight.w600);

  /*
  // font sizes
  static double headingTextFontSize = 41.0;
  static double bodyText1FontSize = 24.0;
  static double bodyText2FontSize = 17.0;
  static double thirdTextFontSize = 10.0;
  */

  // action app bar method
  // get screen app bar
  static getActionAppBar(onBackPressed, onCrossPressed) {
    // if on back pressed is null the not show back button (when choose language screen is skipped)
    return onBackPressed != null
        ? AppBar(
            scrolledUnderElevation: 0.0,
            leading: GestureDetector(
                onTap: onBackPressed,
                child: Icon(
                  Icons.keyboard_arrow_left_rounded,
                  size: 30.0,
                )),
            backgroundColor: Utils.whiteColor,
            elevation: 0.0,
            actions: [
              // cross icon
              Padding(
                padding: const EdgeInsets.only(right: 20.0),
                child: GestureDetector(
                    onTap: onCrossPressed,
                    child: Icon(
                      Icons.cancel_outlined,
                      size: 25.0,
                    )),
              )
            ],
          )
        : AppBar(
            scrolledUnderElevation: 0.0,
            backgroundColor: Utils.whiteColor,
            elevation: 0.0,
            actions: [
              // cross icon
              Padding(
                padding: const EdgeInsets.only(right: 20.0),
                child: GestureDetector(
                    onTap: onCrossPressed,
                    child: Icon(
                      Icons.cancel_outlined,
                      size: 25.0,
                    )),
              )
            ],
          );
  }

// get primary app bar with title only in center
static getKAppPrimaryAppBar(String title){
  return AppBar(
        title: Text(
          title,
          style: Utils.kAppPrimaryTextStyle.copyWith(fontSize: 20.0),
        ),
        centerTitle: true,
        backgroundColor: Utils.whiteColor,
        elevation: 0.0,
        scrolledUnderElevation: 0.0,
      );
}
}

