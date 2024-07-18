import 'package:flutter/material.dart';
import 'package:newzler/configs/utils.dart';
import 'package:newzler/presentation/views/widgets/widgets.dart';

class RecommendedView extends StatelessWidget {
  const RecommendedView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Utils.getKAppPrimaryAppBar('Video', true, null),
      backgroundColor: Utils.whiteColor,
      body: _getBody(context),
    );
  }

  _getBody(context) {
    return SingleChildScrollView(
        child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(children: [
              // recommended text
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'Recommended',
                    style: Utils.kAppPrimaryTextStyle
                        .copyWith(fontWeight: FontWeight.w800),
                  ),
                ],
              ),

              // space
              const SizedBox(
                height: 20.0,
              ),

              // video news cards with timer and no interaction buttons
              Column(
                children: [1, 2, 3, 4].map((i) {
                  return NewsCard(
                      newsImagePath: 'assets/images/video-news-$i.png',
                      // onImageClick: () {
                      //   // push full coverage screen
                      //   Navigator.push(
                      //     context,
                      //     MaterialPageRoute(
                      //         builder: (context) => VideoPlayView()),
                      //   );
                      // },
                      videoNews: true,
                      videoTime: '$i:00',
                      showInteractionButtons: false,
                      showTimeNewsChannel: false);
                }).toList(),
              ),
            ])));
  }
}
