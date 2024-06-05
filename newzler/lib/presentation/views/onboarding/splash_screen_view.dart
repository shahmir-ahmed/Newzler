import 'package:flutter/material.dart';
import 'package:newzler/configs/utils.dart';
import 'package:newzler/presentation/views/onboarding/on_boarding_view_1.dart';

class SplashScreenView extends StatelessWidget {
  const SplashScreenView({super.key});

  // pop splash screen and push onboarding screen 1 in future
  _futurePopAndPush(context) {
    // after 4 seconds pop this splash screen and push on boarding screen 1
    Future.delayed(Duration(seconds: 4), () {
      // pop
      Navigator.pop(context);
      // push
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => OnBoardingView1()));
    });
  }

  @override
  Widget build(BuildContext context) {
    // call method
    _futurePopAndPush(context);
    // widget tree
    return Scaffold(
      backgroundColor: Utils.whiteColor,
      body: _getBody(context),
    );
  }

  // body
  _getBody(context) {
    return SafeArea(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            // margin: EdgeInsets.only(bottom: 10.0),
            // color: Colors.amber,
            padding: EdgeInsets.symmetric(vertical: 40.0),
            height: MediaQuery.of(context).size.height - 260,
            width: MediaQuery.of(context).size.width,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // n letter image
                Container(
                    child: Image(
                  image: AssetImage('assets/images/letter-n.png'),
                  width: 170.0,
                  height: 170.0,
                )),

                // Newzler text
                Container(
                  margin: EdgeInsets.only(bottom: 55.0),
                  child: Text('Newzler',
                      style: Utils.kAppPrimaryTextStyle.copyWith(
                          fontWeight: FontWeight.w600, fontSize: 36.0)),
                ),

                // loader
                Container(
                  padding: EdgeInsets.only(bottom: 30.0),
                  child: CircularProgressIndicator(
                    color: Utils.kAppPrimaryColor,
                    strokeWidth: 3.5,
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
