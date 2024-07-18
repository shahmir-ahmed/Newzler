import 'package:flutter/material.dart';
import 'package:newzler/configs/utils.dart';
import 'package:newzler/presentation/views/widgets/widgets.dart';

class OnBoardingView1WelcomeView extends StatelessWidget {
  OnBoardingView1WelcomeView({
    required this.bannerImagePath,
    required this.smallTextHeadline,
    required this.largeTextHeadline,
    required this.buttonText,
    required this.onButtonClick,
  });

  // banner image path
  String bannerImagePath;

  // small text headline
  String smallTextHeadline;

  // large text headline
  String largeTextHeadline;

  // button text
  String buttonText;

  // on button click
  VoidCallback onButtonClick;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Utils.whiteColor,
      body: _getBody(context),
    );
  }

  // body
  _getBody(context) {
    return SafeArea(
        child: Container(
      // color: Colors.amber,
      padding: const EdgeInsets.all(30.0),
      width: MediaQuery.of(context).size.width,
      child: Column(
        children: [
          // banner image
          Padding(
            padding: const EdgeInsets.only(top: 30.0),
            child: Image(
              image:
                  AssetImage(bannerImagePath),
              width: 300.0,
              height: 300.0,
            ),
          ),

          // space
          const SizedBox(
            height: 80.0,
          ),

          // texts and button column container
          Container(
            width: MediaQuery.of(context).size.width,
            // color: Colors.amber,
            // texts and button column
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // small text headline
                Text(
                  smallTextHeadline,
                  style: Utils.kAppPrimaryTextStyle.copyWith(
                      fontSize: 15.0,
                      color: Utils.kAppPrimaryColor,
                      fontWeight: FontWeight.bold),
                ),

                // space
                const SizedBox(
                  height: 20.0,
                ),

                // large text tagline
                Text(
                  largeTextHeadline,
                  style: Utils.kAppPrimaryTextStyle
                      .copyWith(fontSize: 38.0, fontWeight: FontWeight.bold),
                ),

                // space
                const SizedBox(
                  height: 8.0,
                ),

                // button
                CustomButton(
                  primaryButton: true,
                  onPressed: onButtonClick,
                  buttonText: buttonText,
                  buttonWidth: 150.0,
                  buttonHeight: 53.0,
                )
              ],
            ),
          )
        ],
      ),
    ));
  }
}
