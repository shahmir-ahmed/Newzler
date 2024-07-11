import 'package:floating_snackbar/floating_snackbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:newzler/configs/utils.dart';
import 'package:newzler/presentation/views/my_bookmark/widgets/widgets.dart';
import 'package:newzler/presentation/views/news_details/news_details_view.dart';
import 'package:newzler/presentation/views/video/video_play_view.dart';

// whole app common widgets here

class CustomButton extends StatelessWidget {
  CustomButton(
      {required this.onPressed,
      this.buttonText,
      this.child,
      this.buttonWidth,
      this.buttonHeight,
      this.icon,
      this.primaryButton,
      this.secondaryButton,
      this.backgroundColor});

  VoidCallback onPressed;
  String? buttonText;
  Widget? child;
  double? buttonWidth;
  double? buttonHeight;
  Widget? icon;
  bool? primaryButton;
  bool? secondaryButton;
  Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: buttonWidth != null ? buttonWidth! : 88.0,
      height: buttonHeight != null ? buttonHeight! : 36.0,
      // icon button
      child: icon != null
          ? ElevatedButton.icon(
              onPressed: onPressed,
              // currently there is no req of using child widget instead of text with icon so keeping it like this
              label: Text(
                buttonText!, // text required
                style: Utils.kAppPrimaryTextStyle
                    .copyWith(fontWeight: FontWeight.bold),
              ),
              style: ButtonStyle(
                backgroundColor: WidgetStatePropertyAll(
                    // if bg color present then use that
                    backgroundColor ?? Utils.kAppPrimaryColor),
                foregroundColor: WidgetStatePropertyAll(Utils.whiteColor),
                // if bg color present then set no elevation
                elevation: backgroundColor == null
                    ? WidgetStatePropertyAll(3.0)
                    : WidgetStatePropertyAll(0.0),
                // fixedSize: buttonWidth!=null ? WidgetStatePropertyAll(ui.Size.fromWidth(buttonWidth!)) : null
              ),
              icon: icon,
            )
          // simple button
          : ElevatedButton(
              onPressed: onPressed,
              // blue bg and white text color = primary button
              style: primaryButton != null
                  ? ButtonStyle(
                      backgroundColor:
                          WidgetStatePropertyAll(Utils.kAppPrimaryColor),
                      shadowColor:
                          WidgetStatePropertyAll(Utils.kAppPrimaryColor),
                      foregroundColor: WidgetStatePropertyAll(Utils.whiteColor),
                      elevation: WidgetStatePropertyAll(3.0),
                      // fixedSize: buttonWidth!=null ? WidgetStatePropertyAll(ui.Size.fromWidth(buttonWidth!)) : null
                    )
                  // white bg and grey text color = secondary button
                  : secondaryButton != null
                      ? ButtonStyle(
                          // overlayColor:
                          //     WidgetStatePropertyAll(Utils.whiteColor),
                          backgroundColor:
                              WidgetStatePropertyAll(Utils.whiteColor),
                          foregroundColor:
                              WidgetStatePropertyAll(Utils.greyColor),
                          side: WidgetStatePropertyAll(
                            BorderSide(color: Utils.lightGreyColor2),
                          ),
                          elevation: WidgetStatePropertyAll(0.0))
                      : null,
              // if child present the use the child widget otherwise text is must
              child: child ??
                  Text(
                    buttonText!,
                    style: secondaryButton != null
                        ? Utils.kAppPrimaryTextStyle
                            .copyWith(fontWeight: FontWeight.w800)
                        : primaryButton != null
                            ? Utils.kAppPrimaryTextStyle
                            : null,
                  ),
            ),
    );
  }
}

// combined buttons login, signup
class LoginSignupCombinedButtons extends StatelessWidget {
  const LoginSignupCombinedButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return // buttons row
        Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        // login button
        CustomButton(
          primaryButton: true,
          onPressed: () {
            // push login screen
            // pushLoginScreen(context);
          },
          buttonText: 'Login',
          buttonHeight: 60,
          buttonWidth: 150.0,
        ),
        // signup button
        CustomButton(
          secondaryButton: true,
          onPressed: () {
            // pushSignupScreen(context);
          },
          buttonText: 'Sign up',
          buttonHeight: 60,
          buttonWidth: 150.0,
        ),
      ],
    );
  }
}

// combined buttons login, signup
class CombinedButtons extends StatelessWidget {
  CombinedButtons({
    required this.primaryButtonText,
    required this.onPrimaryButtonPressed,
    this.onSecondaryButtonPressed,
    this.secondaryButtonText,
    this.onlyPrimaryButton,
    this.oppositePosition,
  });

  String primaryButtonText;
  String? secondaryButtonText;
  bool? onlyPrimaryButton;
  bool? oppositePosition;
  VoidCallback onPrimaryButtonPressed;
  VoidCallback? onSecondaryButtonPressed;

  @override
  Widget build(BuildContext context) {
    return // buttons row
        onlyPrimaryButton != null
            ? CustomButton(
                primaryButton: true,
                onPressed: () => onPrimaryButtonPressed(),
                buttonText: primaryButtonText,
                buttonHeight: 60,
                buttonWidth: MediaQuery.of(context).size.width,
              )
            :
            // opposite positions i.e. secondary first then primary
            oppositePosition != null
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      // secondary button
                      CustomButton(
                        secondaryButton: true,
                        onPressed: () => onSecondaryButtonPressed!(),
                        buttonText: secondaryButtonText,
                        buttonHeight: 60,
                        buttonWidth: 150.0,
                      ),

                      // primary button
                      CustomButton(
                        primaryButton: true,
                        onPressed: () => onPrimaryButtonPressed(),
                        buttonText: primaryButtonText,
                        buttonHeight: 60,
                        buttonWidth: 150.0,
                      ),
                    ],
                  )
                : Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      // login button
                      CustomButton(
                        primaryButton: true,
                        onPressed: () => onPrimaryButtonPressed(),
                        buttonText: primaryButtonText,
                        buttonHeight: 60,
                        buttonWidth: 150.0,
                      ),
                      // secondary button
                      CustomButton(
                        secondaryButton: true,
                        onPressed: () => onSecondaryButtonPressed!(),
                        buttonText: secondaryButtonText,
                        buttonHeight: 60,
                        buttonWidth: 150.0,
                      ),
                    ],
                  );
  }
}

/*
// secondary button with white bg, grey text color
class SecondaryButton extends StatelessWidget {
  SecondaryButton({
    required this.onPressed,
    required this.buttonText,
    this.buttonWidth,
    this.buttonHeight,
  });

  VoidCallback onPressed;
  String buttonText;
  double? buttonWidth;
  double? buttonHeight;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: buttonWidth != null ? buttonWidth! : 88.0,
      height: buttonHeight != null ? buttonHeight! : 36.0,
      child: ElevatedButton(
        onPressed: onPressed,
        child: Text(
          buttonText,
          style: Utils.kAppPrimaryTextStyle
              .copyWith(fontWeight: FontWeight.w800, fontSize: 15.0),
        ),
        style: ButtonStyle(
            backgroundColor: WidgetStatePropertyAll(Utils.whiteColor),
            foregroundColor: WidgetStatePropertyAll(Utils.greyColor),
            side: WidgetStatePropertyAll(
                BorderSide(color: Utils.lightGreyColor2)),
            elevation: WidgetStatePropertyAll(0.0)

            // fixedSize: buttonWidth!=null ? WidgetStatePropertyAll(ui.Size.fromWidth(buttonWidth!)) : null
            ),
      ),
    );
  }
}
*/

/*
// grey colored button with icon, for 'continue with email' button in onboarding screen 2
class GreyIconButton extends StatelessWidget {
  GreyIconButton({
    required this.onPressed,
    required this.buttonText,
    required this.icon,
    this.buttonWidth,
    this.buttonHeight,
  });

  VoidCallback onPressed;
  String buttonText;
  Icon? icon;
  double? buttonWidth;
  double? buttonHeight;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: buttonWidth != null ? buttonWidth! : 88.0,
        height: buttonHeight != null ? buttonHeight! : 36.0,
        child: ElevatedButton.icon(
          onPressed: onPressed,
          label: Text(
            buttonText,
            style: Utils.kAppPrimaryTextStyle
                .copyWith(fontWeight: FontWeight.bold),
          ),
          style: ButtonStyle(
            elevation: WidgetStatePropertyAll(0.0),
            backgroundColor: WidgetStatePropertyAll(Utils.kAppSecondaryColor),
            foregroundColor: WidgetStatePropertyAll(Utils.whiteColor),
            // fixedSize: buttonWidth!=null ? WidgetStatePropertyAll(ui.Size.fromWidth(buttonWidth!)) : null
          ),
          icon: icon,
        ));
  }
}
*/

// news interaction buttons
class NewsInteractionButtons extends StatelessWidget {
  NewsInteractionButtons(
      {required this.mainAxisAlignment,
      this.bookmarked,
      this.whiteColoredIcons});

  MainAxisAlignment mainAxisAlignment;
  bool? bookmarked;
  bool? whiteColoredIcons; // for news details screen needs to be true

  _showReactBottomSheet(context) {
    return showModalBottomSheet(
      backgroundColor: Colors.white.withOpacity(0.9),
      useRootNavigator: true,
      context: context,
      builder: (context) {
        return Container(
          height: 255.0,
          padding: EdgeInsets.all(30.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20.0),
                topRight: Radius.circular(20.0)),
            // color: Utils.lightGreyColor4
            // color: Colors.white.withOpacity(0.4)
            // color: Colors.transparent
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // react heading text
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'React',
                    style: Utils.kAppPrimaryTextStyle
                        .copyWith(fontWeight: FontWeight.w800),
                  ),
                ],
              ),

              // space
              SizedBox(
                height: 40.0,
              ),

              // reaction options buttons
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // sized box inside column of a single icon and its text
                  // like option
                  SizedBox(
                    // height: 20.0,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        // image icon
                        Image(
                          image: AssetImage('assets/images/like-icon.png'),
                          width: 36.0,
                          height: 36.0,
                        ),

                        // space
                        SizedBox(
                          height: 5.0,
                        ),

                        // text
                        Text(
                          'Like',
                          style:
                              Utils.kAppPrimaryTextStyle.copyWith(fontSize: 11),
                        )
                      ],
                    ),
                  ),
                  // like option
                  SizedBox(
                    // height: 20.0,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        // image icon
                        Image(
                            image: AssetImage(
                                'assets/images/smiling-face-with heart-shaped-eyes-icon.png'),
                            width: 36.0,
                            height: 36.0),

                        // space
                        SizedBox(
                          height: 5.0,
                        ),

                        // text
                        Text(
                          'Love',
                          style:
                              Utils.kAppPrimaryTextStyle.copyWith(fontSize: 11),
                        )
                      ],
                    ),
                  ),
                  // like option
                  SizedBox(
                    // height: 20.0,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        // image icon
                        Image(
                            image: AssetImage(
                                'assets/images/smiling-face-with-open-mouth-icon.png'),
                            width: 36.0,
                            height: 36.0),

                        // space
                        SizedBox(
                          height: 5.0,
                        ),

                        // text
                        Text(
                          'Haha',
                          style:
                              Utils.kAppPrimaryTextStyle.copyWith(fontSize: 11),
                        )
                      ],
                    ),
                  ),
                  // like option
                  SizedBox(
                    // height: 20.0,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        // image icon
                        Image(
                            image: AssetImage(
                                'assets/images/star-struck-icon.png'),
                            width: 36.0,
                            height: 36.0),

                        // space
                        SizedBox(
                          height: 5.0,
                        ),

                        // text
                        Text(
                          'Wow',
                          style:
                              Utils.kAppPrimaryTextStyle.copyWith(fontSize: 11),
                        )
                      ],
                    ),
                  ),
                  // like option
                  SizedBox(
                    // height: 20.0,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        // image icon
                        Image(
                            image: AssetImage(
                                'assets/images/pensive-face-icon.png'),
                            width: 36.0,
                            height: 36.0),

                        // space
                        SizedBox(
                          height: 5.0,
                        ),

                        // text
                        Text(
                          'Sad',
                          style:
                              Utils.kAppPrimaryTextStyle.copyWith(fontSize: 11),
                        )
                      ],
                    ),
                  ),
                  // angry option
                  SizedBox(
                    // height: 20.0,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        // image icon
                        Image(
                            image: AssetImage(
                                'assets/images/pouting-face-icon.png'),
                            width: 36.0,
                            height: 36.0),

                        // space
                        SizedBox(
                          height: 5.0,
                        ),

                        // text
                        Text(
                          'Angry',
                          style:
                              Utils.kAppPrimaryTextStyle.copyWith(fontSize: 11),
                        )
                      ],
                    ),
                  )
                ],
              )
            ],
          ),
        );
      },
    );
  }

  // show share bottom sheet
  _showShareBottomSheet(context) {
    return showModalBottomSheet(
      backgroundColor: Colors.white.withOpacity(0.9),
      useRootNavigator: true,
      context: context,
      builder: (context) {
        return Container(
          height: 255.0,
          padding: EdgeInsets.all(25.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20.0),
                topRight: Radius.circular(20.0)),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // react heading text
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Share',
                    style: Utils.kAppPrimaryTextStyle
                        .copyWith(fontWeight: FontWeight.w800),
                  ),
                ],
              ),

              // space
              SizedBox(
                height: 40.0,
              ),

              // reaction options buttons
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // sized box inside column of a single icon and its text
                  // like option
                  SizedBox(
                    // height: 20.0,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        // image icon
                        Image(
                          image: AssetImage(
                              'assets/images/logos-whatsapp-icon.png'),
                          width: 36.0,
                          height: 36.0,
                        ),

                        // space
                        SizedBox(
                          height: 5.0,
                        ),

                        // text
                        Text(
                          'Whatsapp',
                          style:
                              Utils.kAppPrimaryTextStyle.copyWith(fontSize: 11),
                        )
                      ],
                    ),
                  ),
                  // like option
                  SizedBox(
                    // height: 20.0,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        // image icon
                        Image(
                            image:
                                AssetImage('assets/images/logos-twitter.png'),
                            width: 36.0,
                            height: 36.0),

                        // space
                        SizedBox(
                          height: 5.0,
                        ),

                        // text
                        Text(
                          'Twitter',
                          style:
                              Utils.kAppPrimaryTextStyle.copyWith(fontSize: 11),
                        )
                      ],
                    ),
                  ),
                  // like option
                  SizedBox(
                    // height: 20.0,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        // image icon
                        Image(
                            image: AssetImage(
                                'assets/images/openmoji-youtube.png'),
                            width: 36.0,
                            height: 36.0),

                        // space
                        SizedBox(
                          height: 5.0,
                        ),

                        // text
                        Text(
                          'Youtube',
                          style:
                              Utils.kAppPrimaryTextStyle.copyWith(fontSize: 11),
                        )
                      ],
                    ),
                  ),
                  // like option
                  SizedBox(
                    // height: 20.0,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        // image icon
                        Image(
                            image:
                                AssetImage('assets/images/logos-facebook.png'),
                            width: 36.0,
                            height: 36.0),

                        // space
                        SizedBox(
                          height: 5.0,
                        ),

                        // text
                        Text(
                          'Facebook',
                          style:
                              Utils.kAppPrimaryTextStyle.copyWith(fontSize: 11),
                        )
                      ],
                    ),
                  ),
                  // like option
                  SizedBox(
                    // height: 20.0,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        // image icon
                        Image(
                            image: AssetImage('assets/images/gravity-ui.png'),
                            width: 36.0,
                            height: 36.0),

                        // space
                        SizedBox(
                          height: 5.0,
                        ),

                        // text
                        Text(
                          'Copy',
                          style:
                              Utils.kAppPrimaryTextStyle.copyWith(fontSize: 11),
                        )
                      ],
                    ),
                  ),
                  // angry option
                  SizedBox(
                    // height: 20.0,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        // image icon
                        Image(
                            image:
                                AssetImage('assets/images/ph-share-light.png'),
                            width: 36.0,
                            height: 36.0),

                        // space
                        SizedBox(
                          height: 5.0,
                        ),

                        // text
                        Text(
                          'Share',
                          style:
                              Utils.kAppPrimaryTextStyle.copyWith(fontSize: 11),
                        )
                      ],
                    ),
                  )
                ],
              )
            ],
          ),
        );
      },
    );
  }

  // show share bottom sheet
  _showWhoopsBottomSheet(context) {
    return showModalBottomSheet(
      useRootNavigator: true,
      context: context,
      builder: (context) {
        return Container(
          color: Utils.whiteColor,
          height: 270.0,
          padding: EdgeInsets.all(25.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // react heading text
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Whoops!',
                    style: Utils.kAppPrimaryTextStyle
                        .copyWith(fontWeight: FontWeight.w800),
                  ),
                ],
              ),

              // space
              SizedBox(
                height: 40.0,
              ),

              // text
              Text(
                textAlign: TextAlign.center,
                'Create an account or login to Newzler to continue.',
                style: Utils.kAppPrimaryTextStyle.copyWith(
                    fontWeight: FontWeight.w800, color: Utils.lightGreyColor),
              ),

              // space
              SizedBox(
                height: 20.0,
              ),

              // buttons row
              LoginSignupCombinedButtons()
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: mainAxisAlignment,
      children: [
        // black colored icons
        // like button
        GestureDetector(
            onTap: () {
              // show bottom sheet to react to news
              // _showReactBottomSheet(context);
              _showWhoopsBottomSheet(context);
            },
            child: whiteColoredIcons != null
                ? Icon(
                    Icons.thumb_up_outlined,
                    color: Utils.whiteColor,
                  )
                : Icon(
                    Icons.thumb_up_outlined,
                    // color: Colors.black, // by default black
                  )),

        // bookmark button
        bookmarked == null
            ? whiteColoredIcons != null // if true then show white icon
                ? Icon(
                    Icons.bookmark_border,
                    color: Utils.whiteColor,
                  )
                // black colored default icon
                : Icon(
                    Icons.bookmark_border,
                    // color: Colors.black, // by default black
                  )
            :
            // bookmarked not null
            Icon(
                bookmarked! ? Icons.bookmark_outlined : Icons.bookmark_border,
                color: bookmarked! ? Utils.kAppPrimaryColor : Colors.black,
              ),

        // copy link button
        GestureDetector(
            onTap: () {
              // show floating snackbar that copied on clipboard
              floatingSnackBar(
                  message: '✅ Link copied to clipboard', context: context);
            },
            child: whiteColoredIcons != null
                ? Icon(
                    Icons.copy,
                    color: Utils.whiteColor,
                  )
                : Icon(
                    Icons.copy,
                    // color: Colors.black, // by default black
                  )),

        GestureDetector(
            onTap: () {
              // show bottom sheet to react to news
              _showShareBottomSheet(context);
            },
            child: whiteColoredIcons != null
                ? Icon(
                    Icons.share,
                    color: Utils.whiteColor,
                  )
                : Icon(
                    Icons.share,
                    // color: Colors.black, // by default black
                  ))
      ],
    );
  }
}

// news card
class NewsCard extends StatelessWidget {
  NewsCard(
      {required this.newsImagePath,
      // this.onVideoImageClick,
      this.videoNews,
      this.videoTime,
      this.showTimeNewsChannel = true,
      this.showInteractionButtons = true,
      this.bookmarked});

  String newsImagePath;
  bool? videoNews; // video news or not i.e. null
  // VoidCallback? onVideoImageClick;
  String? videoTime;
  bool showInteractionButtons;
  bool showTimeNewsChannel;
  bool? bookmarked; // interaction button bookmarked or not

  @override
  Widget build(BuildContext context) {
    // card in column
    return Container(
      // color: Colors.pink,
      height: showInteractionButtons ? 400.0 : 340.0,
      child: Column(
        // mainAxisSize: MainAxisSize.min,
        children: [
          // news image
          GestureDetector(
            // if video news then push video play view screen otherwise push read fullstory screen for simple news
            onTap: videoNews != null
                ? () {
                    // push full coverage screen
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => VideoPlayView()),
                    );
                  }
                : () {
                    // push read full story screen
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => NewsDetailsView()),
                    );
                  }, // if null then nothing will happen if present then the the operation passed will run
            child: Container(
                width: MediaQuery.of(context).size.width,
                height: 200.0,
                // if null means false so show news image only
                child: videoNews == null
                    ? Image(
                        fit: BoxFit.cover,
                        image: AssetImage(newsImagePath),
                      )
                    // video news
                    // if true then show play button over news image
                    : Stack(
                        fit: StackFit.expand,
                        alignment: Alignment.center,
                        children: [
                            // image
                            Image(
                              fit: BoxFit.cover,
                              image: AssetImage(newsImagePath),
                            ),

                            // play icon
                            Icon(
                              Icons.play_arrow_rounded,
                              size: 80.0,
                              color: Utils.whiteColor,
                            ),

                            // if video time is present then show video time otherwii=se if null then show empty box
                            videoTime != null
                                ? Align(
                                    alignment: AlignmentDirectional.bottomEnd,
                                    child: Container(
                                      decoration: BoxDecoration(
                                          color: Utils.greyColor2,
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(10.0))),
                                      padding: EdgeInsets.symmetric(
                                          vertical: 5.0, horizontal: 10.0),
                                      margin: EdgeInsets.all(10.0),
                                      child: Text(
                                        videoTime as String,
                                        style: TextStyle(
                                            // fontFamily: 'Inter',
                                            color: Utils.whiteColor,
                                            fontWeight: FontWeight.w800),
                                      ),
                                    ),
                                  )
                                : SizedBox()
                          ])),
          ),

          // space
          SizedBox(
            height: 30.0,
          ),

          // news details row
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // news channel logo
              CircleAvatar(
                backgroundImage: AssetImage('assets/images/news-18-logo.png'),
                radius: 25.0,
              ),

              // space
              SizedBox(
                width: 10.0,
              ),

              // column for title, time, channel name
              Expanded(
                child: Container(
                  // height: 80.0,
                  child: Column(
                    // mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // title
                      Text(
                        'A protester carries the Confederate flag after breaching US Capital security',
                        style: Utils.kAppPrimaryTextStyle.copyWith(
                            fontSize: 15.0,
                            fontWeight: FontWeight.w800,
                            color: Utils.greyColor3),
                      ),

                      showTimeNewsChannel
                          ?
                          // space
                          SizedBox(
                              height: 5.0,
                            )
                          : SizedBox(),

                      showTimeNewsChannel
                          ? Text(
                              '5 hours ago | News18',
                              style: Utils.kAppPrimaryTextStyle.copyWith(
                                  color: Utils.lightGreyColor2, fontSize: 10.0),
                            )
                          : SizedBox()
                    ],
                  ),
                ),
              ),
            ],
          ),

          showInteractionButtons
              ?
              // space
              SizedBox(
                  height: 20.0,
                )
              : SizedBox(),

          // news interaction buttons
          showInteractionButtons
              ? NewsInteractionButtons(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  bookmarked: bookmarked ?? true,
                )
              : SizedBox()
        ],
      ),
    );
  }
}

// account option for more screen
class AccountOptionTile extends StatelessWidget {
  AccountOptionTile({required this.iconImagePath, required this.option});

  String iconImagePath;
  String option;

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(bottom: 10.0),
        // padding: EdgeInsets.all(20.0),
        // decoration: BoxDecoration(
        //     color: Utils.lightBlueColor,
        //     borderRadius: BorderRadius.all(Radius.circular(10.0))),
        child: ListTile(
            minTileHeight: 65.0,
            shape: BeveledRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(6.0))),
            tileColor: Utils.lightBlueColor,
            leading:
                // icon
                Image(
              image: AssetImage(iconImagePath),
              width: 24,
              height: 24.0,
            ),

            // space
            // SizedBox(
            //   width: 20.0,
            // ),

            // option
            title: Text(
              option,
              style: Utils.kAppPrimaryTextStyle,
            )));
  }
}

// banner image, heading text, text widgets combined
class BannerImageText extends StatelessWidget {
  BannerImageText(
      {required this.bannerImagePath,
      this.subText,
      this.text,
      this.textColor,
      this.headingText,
      this.smallWidthSubText});

  String bannerImagePath;
  String? subText;
  String? text;
  Color? textColor;
  String? headingText; // if heading text given then text will not be used
  bool? smallWidthSubText;

  @override
  Widget build(BuildContext context) {
    return Column(
      // mainAxisAlignment:
      //     MainAxisAlignment.spaceAround,
      children: [
        // for no news found in search results screen
        text == 'No news has been found'
            ?
            // space
            SizedBox(
                height: 150.0,
              )
            // for other screens
            : SizedBox(
                height: 50.0,
              ),

        // banner
        Container(
            child: Image(
          image: AssetImage(bannerImagePath),
          fit: BoxFit.contain,
        )),

        // for no news found in search results screen
        text == 'No news has been found'
            ?
            // space
            SizedBox(
                height: 200.0,
              )
            // for other screens
            : SizedBox(
                height: 60.0,
              ),

        // text
        headingText == null
            ? text != null
                ? Text(
                    textAlign: TextAlign.center,
                    text!,
                    style: Utils.kAppPrimaryTextStyle.copyWith(
                        fontSize: 18.0,
                        fontWeight: FontWeight.w800,
                        color: textColor ?? Colors.black),
                  )
                : SizedBox()
            : Text(
                textAlign: TextAlign.center,
                headingText!,
                style: Utils.kAppPrimaryTextStyle.copyWith(
                    fontSize: 24.0,
                    fontWeight: FontWeight.w800,
                    color: Colors.black),
              ),

        // space
        subText != null
            ? SizedBox(
                height: 10.0,
              )
            : SizedBox(),

        // sub text
        subText != null
            ? smallWidthSubText != null
                ? SizedBox(
                    width: MediaQuery.of(context).size.width - 150,
                    child: Text(
                      subText!,
                      style: Utils.kAppPrimaryTextStyle
                          .copyWith(fontSize: 13, color: Utils.greyColor4),
                      textAlign: TextAlign.center,
                    ),
                  )
                : Text(
                    subText!,
                    style: Utils.kAppPrimaryTextStyle
                        .copyWith(fontSize: 13, color: Utils.greyColor4),
                    textAlign: TextAlign.center,
                  )
            : SizedBox(),
      ],
    );
  }
}

// my bookmark news tile
class MyBookmarkNewsTile extends StatelessWidget {
  MyBookmarkNewsTile(
      {required this.imagePath,
      required this.title,
      required this.timeAgo,
      required this.location,
      required this.checkBoxValue,
      required this.onCheckBoxChanged,
      required this.longPressed});

  String imagePath;
  String title;
  String timeAgo;
  String location;
  bool checkBoxValue;
  VoidCallback onCheckBoxChanged;
  bool longPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.amber,
      margin: EdgeInsets.only(bottom: 25.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // show checkbox if long pressed
          longPressed
              ? CustomCheckbox(
                  iconSize: 20.0,
                  checkColor: Utils.whiteColor,
                  value: checkBoxValue,
                  onChanged: onCheckBoxChanged)
              : SizedBox(),
          // space
          longPressed ? SizedBox(width: 15.0) : SizedBox(),
          // news image
          Image(
            image: AssetImage(imagePath),
            width: 140,
            height: 85,
          ),

          // space
          SizedBox(
            width: 10.0,
          ),

          // expanded column
          Expanded(
            child: Container(
              // height: 83,
              // color: Colors.amber,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // title
                  Text(
                    title.length > 60 ? '${title.substring(0, 60)}...' : title,
                    style: Utils.kAppPrimaryTextStyle.copyWith(fontSize: 12.0),
                  ),

                  // space
                  SizedBox(
                    height: 10.0,
                  ),

                  // time ago, location
                  Text(
                    '$timeAgo | $location',
                    style: Utils.kAppPrimaryTextStyle
                        .copyWith(fontSize: 9.0, color: Utils.greyColor2),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
