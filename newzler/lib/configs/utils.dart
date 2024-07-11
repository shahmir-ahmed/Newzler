import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Utils {
  // colors
  static Color whiteColor = Colors.white;
  static Color kAppPrimaryColor = Color(0xff209CEE);
  static Color kAppSecondaryColor = Color(0xff27272E);
  // static Color lightGreyColor = Color.fromARGB(255, 114, 114, 114);
  static Color lightGreyColor = Color(0xff747474);
  static Color lightGreyColor2 = Color(0xffCA8A8A8);
  static Color lightGreyColor3 = Color(0xffCCCCCC);
  static Color lightGreyColor4 = Color(0xffF2F2F2);
  static Color lightBlueColor = Color(0xffF7F8FA);
  static Color greyColor = Color(0xff4A4A4A);
  static Color greyColor2 = Color(0xff707176);
  static Color greyColor3 = Color(0xff2C2C2C);
  static Color greyColor4 = Color(0xff808080);
  static Color transparentColor = Colors.white.withOpacity(0.0);

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
  // get screen app bar for login, signup screens
  static getActionAppBar(onBackPressed, onCrossPressed, backgroundColor,
      backButtonColor, backButtonSize) {
    return AppBar(
      scrolledUnderElevation: 0.0,
      // if on back pressed is null the not show back button (when choose language screen is skipped)
      leading: onBackPressed == null
          ? null
          : GestureDetector(
              onTap: onBackPressed,
              child: Icon(
                Icons.keyboard_arrow_left_rounded,
                size: backButtonSize ?? 30.0,
                color: backButtonColor ?? Colors.black,
              )),
      // show the bg color otherwise if background color is null then show white color
      backgroundColor: backgroundColor ?? Utils.whiteColor,
      elevation: 0.0,
      // if on back pressed is null then not show back button
      actions: onCrossPressed == null
          ? null
          : [
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

  // action app bar with title method
  // get screen app bar for my bookmark screen
  static getMyBookmarkActionAppBar(onCrossPressed, onDeletePressed) {
    return AppBar(
      scrolledUnderElevation: 0.0,
      title: Text(
        'My Bookmark',
        style: Utils.kAppPrimaryTextStyle.copyWith(fontSize: 20.0),
      ),
      centerTitle: true,
      // cross icon
      leading: GestureDetector(
          onTap: onCrossPressed,
          child: Icon(
            Icons.cancel,
            size: 30.0,
            color: Utils.kAppPrimaryColor,
          )),

      backgroundColor: Utils.whiteColor,
      elevation: 0.0,
      // if on back pressed is null then not show back button
      actions: [
        // delete icon
        Padding(
          padding: const EdgeInsets.only(right: 20.0),
          child: GestureDetector(
              onTap: onDeletePressed,
              child: Icon(
                Icons.delete,
                size: 30.0,
                color: Colors.red,
              )),
        )
      ],
    );
  }

// get primary app bar with title only in center
  static getKAppPrimaryAppBar(String title, bool centerTitle) {
    return AppBar(
      title: Text(
        title,
        style: Utils.kAppPrimaryTextStyle.copyWith(fontSize: 20.0),
      ),
      centerTitle: centerTitle,
      backgroundColor: Utils.whiteColor,
      elevation: 0.0,
      scrolledUnderElevation: 0.0,
    );
  }

// get search app bar for search screen
  static getKAppSearchAppBar(onSubmitted) {
    return AppBar(
      toolbarHeight: 90.0,
      backgroundColor: Utils.whiteColor,
      elevation: 0.0,
      scrolledUnderElevation: 0.0,
      title: Container(
        height: 70,
        // color: Colors.amber,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              height: 55.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
                color: Utils.lightGreyColor4,
              ),
              child: Center(
                child: TextField(
                  // controller: _searchController,
                  style: Utils.kAppPrimaryTextStyle,
                  // cursorColor: Colors.white,
                  decoration: InputDecoration(
                      hintText: 'Search',
                      hintStyle: Utils.kAppPrimaryTextStyle
                          .copyWith(color: Utils.lightGreyColor),
                      border: InputBorder.none,
                      fillColor: Utils.greyColor,
                      prefixIcon: Icon(
                        Icons.search,
                        size: 35.0,
                      )),
                  onSubmitted: (value) {
                    onSubmitted();
                  },
                  onChanged: (value) {
                    // Perform search functionality here
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
