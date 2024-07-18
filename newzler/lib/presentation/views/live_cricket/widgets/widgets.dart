import 'package:flutter/material.dart';
import 'package:newzler/configs/utils.dart';

class LiveScoreCard extends StatelessWidget {
  const LiveScoreCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
      decoration: BoxDecoration(
          color: Utils.whiteColor,
          borderRadius: const BorderRadius.all(Radius.circular(5))),
      width: MediaQuery.of(context).size.width - 100,
      height: 220,
      padding: const EdgeInsets.all(10),
      child: Column(
        children: [
          // row for live text at end
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // text
              Text(
                '2nd Test',
                style: TextStyle(color: Utils.greyColor6),
              ),
              Row(
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
                        color: Colors.green,
                        fontWeight: FontWeight.w800,
                        fontSize: 14),
                  ),
                ],
              ),
            ],
          ),
          // space
          const SizedBox(
            height: 20,
          ),

          // row live score
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // column team 1 score
              const Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // flag
                  Image(
                    image: AssetImage('assets/images/india-flag.png'),
                    width: 50,
                    height: 50,
                  ),

                  // space
                  SizedBox(
                    height: 5.0,
                  ),

                  Text(
                    'India 🔴',
                    style:
                        TextStyle(fontSize: 13.0, fontWeight: FontWeight.bold),
                  ),

                  // space
                  SizedBox(
                    height: 2.0,
                  ),

                  Text(
                    '36/1 (11 ov)',
                    style:
                        TextStyle(fontSize: 12.0, fontWeight: FontWeight.bold),
                  )
                ],
              ),

              // v/s container
              Container(
                padding: const EdgeInsets.only(top: 20.0),
                child: const Text(
                  'V/S',
                  style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                ),
              ),

              // second team score column
              const Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // flag
                  Image(
                    image: AssetImage('assets/images/aus-flag.png'),
                    width: 50,
                    height: 50,
                  ),

                  // space
                  SizedBox(
                    height: 5.0,
                  ),

                  Text(
                    'Australia',
                    style:
                        TextStyle(fontSize: 13.0, fontWeight: FontWeight.bold),
                  ),

                  // space
                  SizedBox(
                    height: 2.0,
                  ),

                  Text(
                    '195',
                    style:
                        TextStyle(fontSize: 12.0, fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ],
          ),
          // space
          const SizedBox(
            height: 20.0,
          ),
          // result row
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                'India Won By 5 Wickets',
                style: Utils.kAppPrimaryTextStyle.copyWith(
                    color: Utils.greyColor7,
                    fontSize: 12,
                    fontWeight: FontWeight.normal),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
