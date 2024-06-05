import 'package:flutter/material.dart';
import 'package:newzler/configs/utils.dart';
import 'package:newzler/presentation/views/widgets/widgets.dart';

class OnBoardingView1 extends StatelessWidget {
  const OnBoardingView1({super.key});

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
      padding: EdgeInsets.all(30.0),
      width: MediaQuery.of(context).size.width,
      child: Column(
        children: [
          // banner image
          Padding(
            padding: const EdgeInsets.only(top: 30.0),
            child: Image(
              image:
                  AssetImage('assets/images/on-boarding-screen-1-banner.png'),
              width: 300.0,
              height: 300.0,
            ),
          ),

          // space
          SizedBox(
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
                  'Discover Daily News',
                  style: Utils.kAppPrimaryTextStyle.copyWith(
                      fontSize: 15.0,
                      color: Utils.kAppPrimaryColor,
                      fontWeight: FontWeight.bold),
                ),

                // space
                SizedBox(
                  height: 20.0,
                ),

                // large text tagline
                Text(
                  'We bring you closer to the news.',
                  style: Utils.kAppPrimaryTextStyle
                      .copyWith(fontSize: 38.0, fontWeight: FontWeight.bold),
                ),

                // space
                SizedBox(
                  height: 8.0,
                ),

                // get started button
                PrimaryButton(
                  onPressed: () {},
                  buttonText: 'Get Started',
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
