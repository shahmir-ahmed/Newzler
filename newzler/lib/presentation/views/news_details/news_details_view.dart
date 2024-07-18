import 'package:flutter/material.dart';
import 'package:newzler/configs/utils.dart';
import 'package:newzler/presentation/views/news_details/widgets/widgets.dart';
import 'package:newzler/presentation/views/widgets/widgets.dart';

class NewsDetailsView extends StatelessWidget {
  const NewsDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Utils.whiteColor,
      body: _getBody(context),
    );
  }

  // return screen body
  _getBody(context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          // banner image
          // Container(
          // color: Colors.orange,
          // width: MediaQuery.of(context).size.width,
          // height: 385,
          // child: Image(
          Image(
            width: MediaQuery.of(context).size.width,
            height: 385,
            fit: BoxFit.cover,
            image: const AssetImage(
              'assets/images/news-details-banner.png',
            ),
          ),
          // ),
          // news details with bg color black
          Container(
            padding: const EdgeInsets.all(20.0),
            color: Colors.black,
            child: Column(mainAxisAlignment: MainAxisAlignment.end, children: [
              // space
              const SizedBox(
                height: 20.0,
              ),
              Row(
                children: [
                  // news channel logo
                  const CircleAvatar(
                    backgroundImage:
                        AssetImage('assets/images/news-18-logo.png'),
                  ),
                  // space
                  const SizedBox(
                    width: 10.0,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // news channel name
                      Text(
                        'News 18',
                        style: Utils.kAppPrimaryTextStyle.copyWith(
                            fontWeight: FontWeight.w800,
                            color: Utils.whiteColor),
                      ),
                      Text(
                        textAlign: TextAlign.center,
                        '10 min ago',
                        style: Utils.kAppPrimaryTextStyle.copyWith(
                            fontSize: 12.0, color: Utils.lightGreyColor3),
                      ),
                    ],
                  ),
                ],
              ),
              // space
              const SizedBox(
                height: 8.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // space
                  const SizedBox(
                    width: 15.0,
                  ),
                  // red line
                  Container(
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      color: Colors.red,
                    ),
                    height: 110.0,
                    width: 5.0,
                  ),
                  // space
                  const SizedBox(
                    width: 17.0,
                  ),
                  // news headline title
                  Expanded(
                    child: Text(
                      'Trump presidency\'s final days; in his mind, he will not have lost\'',
                      style: Utils.kAppPrimaryTextStyle
                          .copyWith(color: Utils.whiteColor, fontSize: 24.0),
                    ),
                  ),
                ],
              ),

              // space
              const SizedBox(
                height: 20.0,
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  // space
                  const SizedBox(
                    width: 40.0,
                  ),
                  Expanded(
                    child: Text(
                      'Lorem ipsum dolor sit amet consectetur. Eget vestibulum orci a vulputate in suspendisse. Lacus sollicitudin morbi leo lectus molestie quis. Ullamcorper pulvinar congue elementum neque arcu amet tempor. In risus pharetra suscipit lacus sagittis sollicitudin.',
                      style: Utils.kAppPrimaryTextStyle.copyWith(
                          color: Utils.lightGreyColor3, fontSize: 13.0),
                    ),
                  ),
                ],
              ),

              // space
              const SizedBox(
                height: 30.0,
              ),

              // interaction options
              NewsInteractionButtons(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                whiteColoredIcons: true, // white colored button
              ),

              // space
              const SizedBox(
                height: 30.0,
              ),
              // red color button read full story
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 0.0, horizontal: 10.0),
                child: SizedBox(
                    height: 60.0,
                    width: MediaQuery.of(context).size.width,
                    child: RedButton(
                      onPressed: () {},
                      buttonText: 'Read the full story',
                    )),
              )
            ]),
          ),
        ],
      ),
    );
  }
}
