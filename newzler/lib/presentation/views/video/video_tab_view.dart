import 'package:flutter/material.dart';
import 'package:newzler/configs/utils.dart';
import 'package:newzler/presentation/views/recommended/recommended_view.dart';
import 'package:newzler/presentation/views/widgets/widgets.dart';

class VideoTabView extends StatelessWidget {
  VideoTabView({super.key});

  final dynamic newsChannels = [
    {'logoImagePath': 'assets/images/Ellipse 15.png', 'name': 'News Nation'},
    {'logoImagePath': 'assets/images/Ellipse 16.png', 'name': 'Times of India'},
    {'logoImagePath': 'assets/images/Ellipse 17.png', 'name': 'Nation Now'},
    {'logoImagePath': 'assets/images/Ellipse 18.png', 'name': 'Gadgets Now'},
    {'logoImagePath': 'assets/images/Ellipse 19.png', 'name': 'India Today'},
  ];

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
              // live news text
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'Live News',
                    style: Utils.kAppPrimaryTextStyle
                        .copyWith(fontWeight: FontWeight.w800),
                  ),
                ],
              ),

              // space
              const SizedBox(
                height: 20.0,
              ),

              // live news channels
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [0, 1, 2, 3, 4].map((i) {
                    return Container(
                      margin: const EdgeInsets.symmetric(
                          vertical: 0.0, horizontal: 5.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          // channel logo
                          Image(
                            image: AssetImage(newsChannels[i]['logoImagePath']),
                            width: 50,
                            height: 50,
                          ),
                          // space
                          const SizedBox(
                            height: 3.0,
                          ),
                          // channel name
                          Text(
                            newsChannels[i]['name'],
                            style: Utils.kAppPrimaryTextStyle.copyWith(
                                fontSize: 11.0, fontWeight: FontWeight.w800),
                          ),
                        ],
                      ),
                    );
                  }).toList(),
                ),
              ),

              // space
              const SizedBox(
                height: 30.0,
              ),

              // text
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  GestureDetector(
                    /*
                    onTap: () {
                      // show recommmended view
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => RecommendedView()),
                      );
                    },
                    */
                    child: Text(
                      'Recommended',
                      style: Utils.kAppPrimaryTextStyle.copyWith(
                          fontSize: 18.0, fontWeight: FontWeight.w800),
                    ),
                  ),
                ],
              ),

              // space
              const SizedBox(
                height: 20.0,
              ),

              // Video News Card
              Column(
                children: [1, 2, 3].map((i) {
                  return NewsCard(
                      newsImagePath: 'assets/images/video-news-$i.png',
                      // onVideoImageClick: () {
                      //   // push full coverage screen
                      //   Navigator.push(
                      //     context,
                      //     MaterialPageRoute(
                      //         builder: (context) => VideoPlayView()),
                      //   );
                      // },
                      videoNews: true);
                }).toList(),
              ),

              // space
              const SizedBox(
                height: 10.0,
              ),

              // view more button
              CustomButton(
                primaryButton: true,
                onPressed: () {
                  // push full coverage screen
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const RecommendedView()),
                  );
                },
                buttonText: 'View all',
                buttonWidth: MediaQuery.of(context).size.width - 20,
                buttonHeight: 50.0,
              ),

              // space for floating bottom bar
              const SizedBox(
                height: 90.0,
              ),
            ])));
  }
}
