import 'package:flutter/material.dart';
import 'package:newzler/configs/utils.dart';
import 'package:newzler/presentation/views/live_cricket/more_scores.dart';
import 'package:newzler/presentation/views/widgets/widgets.dart';

class LiveCricketView extends StatelessWidget {
  const LiveCricketView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Utils.getActionAppBar(() {
        Navigator.pop(context);
      }, null, null, null, null),
      backgroundColor: Utils.whiteColor,
      body: _getBody(context),
    );
  }

  // return body
  _getBody(context) {
    return SingleChildScrollView(
      // height: MediaQuery.of(context).size.height,
      child: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // row for live text at end
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                // live icon
                const Image(
                  image: AssetImage('assets/images/live-icon.png'),
                  width: 26,
                  height: 26,
                ),

                // text
                Text(
                  'Live',
                  style: Utils.kAppPrimaryTextStyle.copyWith(
                      color: Colors.green, fontWeight: FontWeight.w800),
                )
              ],
            ),

            // space
            const SizedBox(
              height: 20.0,
            ),

            // heading text
            Text(
              'India V/S Australia 2nd Test',
              style: Utils.kAppPrimaryTextStyle
                  .copyWith(fontWeight: FontWeight.w800, fontSize: 36.0),
            ),

            // space
            const SizedBox(
              height: 20.0,
            ),

            // subtext
            Text(
              '2nd Test India Tour Of Australia Melbourne Cricket ground Australia',
              style: Utils.kAppPrimaryTextStyle
                  .copyWith(fontSize: 15.0, color: Utils.greyColor6),
            ),

            // space
            const SizedBox(
              height: 40.0,
            ),

            // row live score
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                // column team 1 score
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // flag
                    Image(
                      image: AssetImage('assets/images/india-flag.png'),
                      width: 91,
                      height: 91,
                    ),

                    // space
                    SizedBox(
                      height: 5.0,
                    ),

                    Text(
                      'India 🔴',
                      style: TextStyle(
                          fontSize: 18.0, fontWeight: FontWeight.bold),
                    ),

                    // space
                    SizedBox(
                      height: 2.0,
                    ),

                    Text(
                      '36/1 (11 ov)',
                      style: TextStyle(
                          fontSize: 18.0, fontWeight: FontWeight.bold),
                    )
                  ],
                ),

                // v/s container
                Container(
                  padding: const EdgeInsets.only(top: 20.0),
                  child: const Text(
                    'V/S',
                    style:
                        TextStyle(fontSize: 36.0, fontWeight: FontWeight.bold),
                  ),
                ),

                // second team score column

                const Column(
                  children: [
                    // flag
                    Image(
                      image: AssetImage('assets/images/aus-flag.png'),
                      width: 91,
                      height: 91,
                    ),

                    // space
                    SizedBox(
                      height: 5.0,
                    ),

                    Text(
                      'Australia',
                      style: TextStyle(
                          fontSize: 18.0, fontWeight: FontWeight.bold),
                    ),

                    // space
                    SizedBox(
                      height: 2.0,
                    ),

                    Text(
                      '195',
                      style: TextStyle(
                          fontSize: 18.0, fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ],
            ),

            // space
            const SizedBox(
              height: 30.0,
            ),

            // result row
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'India Won By 5 Wickets',
                  style: Utils.kAppPrimaryTextStyle.copyWith(
                      color: Utils.greyColor7,
                      fontSize: 20,
                      fontWeight: FontWeight.normal),
                )
              ],
            ),

            // space
            const SizedBox(
              height: 30.0,
            ),

            // player of the match
            Text(
              'PLAYER OF THE MATCH',
              style: TextStyle(
                  color: Utils.greyColor8,
                  fontSize: 13.0,
                  fontWeight: FontWeight.w800),
            ),

            // space
            const SizedBox(
              height: 10.0,
            ),

            // row
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                // image
                const Image(
                  image: AssetImage('assets/images/Ellipse 9.png'),
                  width: 62,
                  height: 62,
                ),

                // space
                const SizedBox(
                  width: 10.0,
                ),

                // column
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Ajinkya Rahane',
                      style: TextStyle(
                          color: Utils.greyColor8,
                          fontSize: 13,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'India',
                      style:
                          TextStyle(color: Utils.lightGreyColor6, fontSize: 13),
                    )
                  ],
                )
              ],
            ),

            // space
            const SizedBox(
              height: 60.0,
            ),

            // read full scoreboard primary button
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomButton(
                  onPressed: () {
                    // push more scores screen
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const MoreScores()),
                    );
                  },
                  primaryButton: true,
                  buttonText: 'Read the full scoreboard',
                  buttonHeight: 60,
                  buttonWidth: 350,
                ),
              ],
            ),

            // space
            const SizedBox(
              height: 20.0,
            ),

            // text
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Powered By',
                  style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.bold,
                      color: Utils.greyColor8),
                ),
                // space
                const SizedBox(
                  width: 4.0,
                ),
                Text(
                  'ESPNcricinfo',
                  style: TextStyle(
                      fontSize: 13,
                      color: Utils.kAppPrimaryColor,
                      fontWeight: FontWeight.bold),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
