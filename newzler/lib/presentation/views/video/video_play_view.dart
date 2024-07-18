import 'package:flutter/material.dart';
import 'package:newzler/configs/utils.dart';

class VideoPlayView extends StatelessWidget {
  const VideoPlayView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Utils.whiteColor,
      body: _getBody(context),
    );
  }

  _getBody(context) {
    return SingleChildScrollView(
        child: SafeArea(
      child: Column(children: [
        // video play screen
        Container(
          // color: Colors.amber,
          width: MediaQuery.of(context).size.width,
          height: 250,
          // padding: EdgeInsets.all(20.0),
          child: Stack(
            fit: StackFit.expand,
            alignment: AlignmentDirectional.center,
            children: [
              // image
              const Image(
                image: AssetImage('assets/images/video-playing-banner.png'),
                fit: BoxFit.cover,
              ),

              // play icon
              Icon(
                Icons.play_arrow_rounded,
                size: 50.0,
                color: Utils.whiteColor,
              ),

              // video buffer details
              // inside column to move at the end
              Padding(
                padding: const EdgeInsets.fromLTRB(8.0, 0.0, 8.0, 8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // Text
                        Text(
                          '1:17',
                          style: Utils.kAppPrimaryTextStyle.copyWith(
                            color: Utils.whiteColor,
                          ),
                        ),

                        // slider
                        SizedBox(
                          width: MediaQuery.of(context).size.width - 130,
                          // height: 10.0,
                          child: Slider(
                            value: 50,
                            onChanged: (newValue) {},
                            min: 1,
                            max: 100,
                            thumbColor: Utils.whiteColor,
                            activeColor: Utils.kAppPrimaryColor,
                          ),
                        ),

                        // text
                        Text(
                          '03:22',
                          style: Utils.kAppPrimaryTextStyle.copyWith(
                            color: Utils.whiteColor,
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),

              // app bar in stack to make content go behind it
              Align(
                alignment: AlignmentDirectional.topStart,
                child: SizedBox(
                    height: 50.0,
                    child: Utils.getActionAppBar(() {
                      Navigator.pop(context);
                    }, null, Colors.white.withOpacity(0.0), Utils.whiteColor,
                        40.0)),
              ),
            ],
          ),
        ),
        // below video body
        Padding(
          padding: const EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // news details text
              // text 1
              Text(
                'A protester carries the Confederate flag after breaching US Captial security',
                style: Utils.kAppPrimaryTextStyle
                    .copyWith(fontWeight: FontWeight.w800),
              ),

              // space
              const SizedBox(
                height: 5.0,
              ),

              // text 2
              Text(
                '1h | US Canada',
                style: Utils.kAppPrimaryTextStyle.copyWith(
                    color: Utils.lightGreyColor,
                    fontSize: 11,
                    fontWeight: FontWeight.w800),
              ),
            ],
          ),
        ),

        // divider
        Divider(
          height: 1.0,
          color: Utils.lightGreyColor4,
        ),

        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
          child: Row(
            children: [
              // logo
              const CircleAvatar(
                  backgroundImage:
                      AssetImage('assets/images/news-18-logo.png')),

              // space
              const SizedBox(
                width: 13.0,
              ),

              // text
              Text(
                'News 18',
                style: Utils.kAppPrimaryTextStyle
                    .copyWith(fontWeight: FontWeight.w800),
              )
            ],
          ),
        ),

        // divider
        Divider(
          height: 1.0,
          color: Utils.lightGreyColor4,
        ),

        // more videos suggestions
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [1, 2, 3, 4, 5].map((i) {
              // single card
              return Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 10.0, horizontal: 0.0),
                child: Row(
                  children: [
                    // image
                    Container(
                      width: 140,
                      height: 81,
                      decoration: const BoxDecoration(
                          borderRadius:
                              BorderRadius.all(Radius.circular(10.0))),
                      child: const Image(
                        image: AssetImage('assets/images/more-video-image.png'),
                        fit: BoxFit.cover,
                      ),
                    ),

                    // space
                    const SizedBox(
                      width: 15.0,
                    ),

                    // Text in column
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          // text 1
                          Text(
                            'Meet the woman behind India\'s best bar',
                            style: Utils.kAppPrimaryTextStyle.copyWith(
                                fontSize: 12.0, fontWeight: FontWeight.w800),
                          ),

                          // space
                          const SizedBox(
                            height: 20.0,
                          ),

                          // text 2
                          Text(
                            '5 Hours ago | News 18',
                            style: Utils.kAppPrimaryTextStyle.copyWith(
                                fontSize: 10.0,
                                fontWeight: FontWeight.w800,
                                color: Utils.lightGreyColor2),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              );
            }).toList(),
          ),
        )
      ]),
    ));
  }
}
