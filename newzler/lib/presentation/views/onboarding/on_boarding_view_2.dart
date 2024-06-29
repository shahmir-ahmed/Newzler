import 'package:flutter/material.dart';
import 'package:newzler/configs/utils.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:newzler/presentation/views/onboarding/widgets/on_boarding_view_1_welcome_view.dart';
import 'package:newzler/presentation/views/onboarding/widgets/widgets.dart';
import 'package:newzler/presentation/views/widgets/widgets.dart';

// on boarding screen 2 with slider and login options
class OnBoardingView2 extends StatefulWidget {
  const OnBoardingView2({super.key});

  @override
  State<OnBoardingView2> createState() => _OnBoardingView2State();
}

class _OnBoardingView2State extends State<OnBoardingView2> {
  int _current = 0;
  final CarouselController _controller = CarouselController();

  final imgList = [
    "assets/images/carousel-image-1.png",
    "assets/images/carousel-image-2.png",
    "assets/images/carousel-image-3.png",
    "assets/images/carousel-image-4.png",
  ];

  final carouselTextList = [
    "Trending News",
    "React, Save & Share News",
    "Video & live News from Youtube",
    "Browse News From Variety of Categories",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Utils.whiteColor,
      body: _getBody(context),
    );
  }

  // pop screen and push welcome screen
  popAndPushWelcomeScreen() {
    // pop
    Navigator.pop(context);
    // push
    Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => OnBoardingView1WelcomeView(
              bannerImagePath: 'assets/images/welcome-screen-banner.png',
              smallTextHeadline: 'Welcome, Shahmir',
              largeTextHeadline: 'Enjoy our best news engine experience ever',
              buttonText: 'Let\'s Start',
              onButtonClick: () {
                // pop screen and push choose news language screen
              },
            )));
  }

  // body
  _getBody(context) {
    return SafeArea(
        child: Container(
            // color: Colors.amber,
            padding: EdgeInsets.all(30.0),
            width: MediaQuery.of(context).size.width,
            child: Column(children: [
              // skip text
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  // text
                  GestureDetector(
                    onTap: () {
                      // show on boarding screen 3
                    },
                    child: GestureDetector(
                      onTap: () {
                        // pop screen and push choose news language screen
                      },
                      child: Text(
                        'Skip',
                        style: Utils.kAppPrimaryTextStyle.copyWith(
                            fontWeight: FontWeight.w800,
                            fontSize: 14.0,
                            color: Utils.lightGreyColor),
                      ),
                    ),
                  )
                ],
              ),

              // space
              SizedBox(
                height: 20.0,
              ),

              // carousel
              CarouselSlider(
                carouselController: _controller,
                options: CarouselOptions(
                    viewportFraction: 1.0,
                    autoPlay: true,
                    height: 430.0,
                    onPageChanged: (index, reason) {
                      setState(() {
                        _current = index;
                      });
                    }),
                items: [0, 1, 2, 3].map((i) {
                  return Builder(
                    builder: (BuildContext context) {
                      return Container(
                          width: MediaQuery.of(context).size.width,
                          margin: EdgeInsets.symmetric(horizontal: 5.0),
                          // decoration: BoxDecoration(color: Colors.amber),
                          child: Column(
                            children: [
                              // image
                              SizedBox(
                                  height: 300.0,
                                  // width: 300.0,
                                  child: Image(image: AssetImage(imgList[i]))),
                              // space
                              SizedBox(
                                height: 50.0,
                              ),
                              // text
                              Text(
                                textAlign: TextAlign.center,
                                carouselTextList[i],
                                style: Utils.kAppPrimaryTextStyle.copyWith(
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.w800,
                                ),
                              ),
                            ],
                          ));
                    },
                  );
                }).toList(),
              ),

              // space
              SizedBox(
                height: 10.0,
              ),

              // indiactor row
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: imgList.asMap().entries.map((entry) {
                  return GestureDetector(
                    onTap: () => _controller.animateToPage(entry.key),
                    child: Container(
                        // width: _current == entry.key ? 20.0 : 7.0,
                        width: 7.0,
                        height: 7.0,
                        margin: EdgeInsets.symmetric(
                            vertical: 8.0, horizontal: 4.0),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: _current == entry.key
                              ? Utils.kAppPrimaryColor
                              : Utils.lightGreyColor,
                        )),
                  );
                }).toList(),
              ),

              // space
              SizedBox(
                height: 50.0,
              ),

              // login buttons
              // primary button with icon for email login
              PrimaryButton(
                onPressed: () {
                  // pop screen and push welcome screen
                  popAndPushWelcomeScreen();
                },
                buttonText: 'Continue with Email',
                icon: Icon(Icons.mail),
                fontColor: Utils.whiteColor,
                bgColor: Utils.kAppSecondaryColor,
                buttonWidth: MediaQuery.of(context).size.width - 40,
                buttonHeight: 60.0,
              ),

              // space
              SizedBox(
                height: 45.0,
              ),

              // social login buttons in row
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  // icon buttons
                  // fb login button
                  SocialLoginButton(
                      onPressed: () {
                        // pop screen and push welcome screen
                        popAndPushWelcomeScreen();
                      },
                      iconImage: AssetImage('assets/images/fb-logo.png')),
                  SocialLoginButton(
                      onPressed: () {
                        // pop screen and push welcome screen
                        popAndPushWelcomeScreen();
                      },
                      iconImage: AssetImage('assets/images/google-logo.png')),
                  SocialLoginButton(
                      onPressed: () {
                        // pop screen and push welcome screen
                        popAndPushWelcomeScreen();
                      },
                      iconImage: AssetImage('assets/images/twitter-logo.png')),
                ],
              )
            ])));
  }
}
