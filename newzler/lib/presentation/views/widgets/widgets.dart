import 'package:flutter/material.dart';
import 'package:floating_snackbar/floating_snackbar.dart';
import 'package:newzler/configs/utils.dart';
import 'package:newzler/presentation/views/home/home_view.dart';
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
                    ? const WidgetStatePropertyAll(3.0)
                    : const WidgetStatePropertyAll(0.0),
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
                      elevation: const WidgetStatePropertyAll(3.0),
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
                          elevation: const WidgetStatePropertyAll(0.0))
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
      useRootNavigator:
          true, // This will display model sheet above all other content.
      context: context,
      builder: (context) {
        return Container(
          height: 255.0,
          padding: const EdgeInsets.all(30.0),
          decoration: const BoxDecoration(
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
              const SizedBox(
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
                        const Image(
                          image: AssetImage('assets/images/like-icon.png'),
                          width: 36.0,
                          height: 36.0,
                        ),

                        // space
                        const SizedBox(
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
                        const Image(
                            image: AssetImage(
                                'assets/images/smiling-face-with heart-shaped-eyes-icon.png'),
                            width: 36.0,
                            height: 36.0),

                        // space
                        const SizedBox(
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
                        const Image(
                            image: AssetImage(
                                'assets/images/smiling-face-with-open-mouth-icon.png'),
                            width: 36.0,
                            height: 36.0),

                        // space
                        const SizedBox(
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
                        const Image(
                            image: AssetImage(
                                'assets/images/star-struck-icon.png'),
                            width: 36.0,
                            height: 36.0),

                        // space
                        const SizedBox(
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
                        const Image(
                            image: AssetImage(
                                'assets/images/pensive-face-icon.png'),
                            width: 36.0,
                            height: 36.0),

                        // space
                        const SizedBox(
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
                        const Image(
                            image: AssetImage(
                                'assets/images/pouting-face-icon.png'),
                            width: 36.0,
                            height: 36.0),

                        // space
                        const SizedBox(
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
      useRootNavigator:
          true, // This will display model sheet above all other content.
      context: context,
      builder: (context) {
        return Container(
          height: 255.0,
          padding: const EdgeInsets.all(25.0),
          decoration: const BoxDecoration(
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
              const SizedBox(
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
                        const Image(
                          image: AssetImage(
                              'assets/images/logos-whatsapp-icon.png'),
                          width: 36.0,
                          height: 36.0,
                        ),

                        // space
                        const SizedBox(
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
                        const Image(
                            image:
                                AssetImage('assets/images/logos-twitter.png'),
                            width: 36.0,
                            height: 36.0),

                        // space
                        const SizedBox(
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
                        const Image(
                            image: AssetImage(
                                'assets/images/openmoji-youtube.png'),
                            width: 36.0,
                            height: 36.0),

                        // space
                        const SizedBox(
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
                        const Image(
                            image:
                                AssetImage('assets/images/logos-facebook.png'),
                            width: 36.0,
                            height: 36.0),

                        // space
                        const SizedBox(
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
                        const Image(
                            image: AssetImage('assets/images/gravity-ui.png'),
                            width: 36.0,
                            height: 36.0),

                        // space
                        const SizedBox(
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
                        const Image(
                            image:
                                AssetImage('assets/images/ph-share-light.png'),
                            width: 36.0,
                            height: 36.0),

                        // space
                        const SizedBox(
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
          padding: const EdgeInsets.all(25.0),
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
              const SizedBox(
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
              const SizedBox(
                height: 20.0,
              ),

              // buttons row
              const LoginSignupCombinedButtons()
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
              _showReactBottomSheet(context);
              // _showWhoopsBottomSheet(context);
            },
            child: whiteColoredIcons != null
                ? Icon(
                    Icons.thumb_up_outlined,
                    color: Utils.whiteColor,
                  )
                : const Icon(
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
                : const Icon(
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
                : const Icon(
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
                : const Icon(
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
                      MaterialPageRoute(
                          builder: (context) => const VideoPlayView()),
                    );
                  }
                : () {
                    // push read full story screen
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const NewsDetailsView()),
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
                                          borderRadius: const BorderRadius.all(
                                              Radius.circular(10.0))),
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 5.0, horizontal: 10.0),
                                      margin: const EdgeInsets.all(10.0),
                                      child: Text(
                                        videoTime as String,
                                        style: TextStyle(
                                            // fontFamily: 'Inter',
                                            color: Utils.whiteColor,
                                            fontWeight: FontWeight.w800),
                                      ),
                                    ),
                                  )
                                : const SizedBox()
                          ])),
          ),

          // space
          const SizedBox(
            height: 30.0,
          ),

          // news details row
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // news channel logo
              const CircleAvatar(
                backgroundImage: AssetImage('assets/images/news-18-logo.png'),
                radius: 25.0,
              ),

              // space
              const SizedBox(
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
                          const SizedBox(
                              height: 5.0,
                            )
                          : const SizedBox(),

                      showTimeNewsChannel
                          ? Text(
                              '5 hours ago | News18',
                              style: Utils.kAppPrimaryTextStyle.copyWith(
                                  color: Utils.lightGreyColor2, fontSize: 10.0),
                            )
                          : const SizedBox()
                    ],
                  ),
                ),
              ),
            ],
          ),

          showInteractionButtons
              ?
              // space
              const SizedBox(
                  height: 20.0,
                )
              : const SizedBox(),

          // news interaction buttons
          showInteractionButtons
              ? NewsInteractionButtons(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  bookmarked: bookmarked ?? true,
                )
              : const SizedBox()
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
        margin: const EdgeInsets.only(bottom: 10.0),
        // padding: EdgeInsets.all(20.0),
        // decoration: BoxDecoration(
        //     color: Utils.lightBlueColor,
        //     borderRadius: BorderRadius.all(Radius.circular(10.0))),
        child: ListTile(
            minTileHeight: 65.0,
            shape: const BeveledRectangleBorder(
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
            const SizedBox(
                height: 150.0,
              )
            // for other screens
            : const SizedBox(
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
            const SizedBox(
                height: 200.0,
              )
            // for other screens
            : const SizedBox(
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
                : const SizedBox()
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
            ? const SizedBox(
                height: 10.0,
              )
            : const SizedBox(),

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
            : const SizedBox(),
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
      margin: const EdgeInsets.only(bottom: 25.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // show checkbox if long pressed
          longPressed
              ? CustomCheckbox(
                  iconSize: 20.0,
                  checkedIconColor: Utils.whiteColor,
                  value: checkBoxValue,
                  onChanged: onCheckBoxChanged)
              : const SizedBox(),
          // space
          longPressed ? const SizedBox(width: 15.0) : const SizedBox(),
          // news image
          Image(
            image: AssetImage(imagePath),
            width: 140,
            height: 85,
          ),

          // space
          const SizedBox(
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
                  const SizedBox(
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

// my language, publisher item tile
class MyLanguageMyPublisherTile extends StatelessWidget {
  MyLanguageMyPublisherTile({
    this.imagePath,
    required this.title,
    required this.checkedValue,
    required this.onCheckChanged,
    this.myLanguageTile,
    this.myPublisherTile,
  });

  String? imagePath;
  String title;
  bool checkedValue;
  VoidCallback onCheckChanged;
  // publisher or my language tile
  bool? myLanguageTile;
  bool? myPublisherTile;

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: myLanguageTile != null
            ? const EdgeInsets.fromLTRB(15.0, 30.0, 15.0, 0)
            : null,
        margin: myPublisherTile != null
            ? const EdgeInsets.only(bottom: 40.0)
            : null,
        child: myPublisherTile != null
            ? Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // row
                  Row(
                    children: [
                      // icon image
                      title == 'All Publishers'
                          ? Container(
                              decoration: BoxDecoration(
                                borderRadius: const BorderRadius.all(
                                    Radius.circular(23.0)),
                                color: Utils.lightGreyColor5,
                              ),
                              padding: const EdgeInsets.all(13.0),
                              width: 50,
                              height: 50,
                              child: Image(
                                image: AssetImage(imagePath!),
                              ),
                            )
                          : CircleAvatar(
                              backgroundColor: Utils.lightGreyColor,
                              backgroundImage: AssetImage(imagePath!),
                              radius: 22,
                            ),
                      // space
                      const SizedBox(
                        width: 20.0,
                      ),

                      // text
                      Text(
                        title,
                        style: Utils.kAppPrimaryTextStyle.copyWith(
                            fontWeight: FontWeight.w800, fontSize: 16),
                      ),
                    ],
                  ),

                  // custom checkbox
                  Padding(
                    padding: const EdgeInsets.only(right: 18.0),
                    child: CustomCheckbox.forPublisherScreen(
                        checkedBgColor: Utils.whiteColor,
                        checkedIconColor: Utils.kAppPrimaryColor,
                        iconSize: 14,
                        width: 20,
                        height: 20,
                        borderWidth: 1.5,
                        value:
                            checkedValue, // current checked value for this publisher
                        onChanged: () {
                          onCheckChanged();
                        }),
                  )

                  //
                ],
              )
            : myLanguageTile != null
                ?
                // column
                Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          // text
                          Text(
                            title,
                            style: Utils.kAppPrimaryTextStyle.copyWith(
                                color: checkedValue
                                    ? Utils.kAppPrimaryColor
                                    : Utils.greyColor5,
                                fontSize: 16),
                          ),

                          // custom checkbox
                          CustomCheckbox.forPublisherScreen(
                              checkedBgColor: Utils.whiteColor,
                              checkedIconColor: Utils.kAppPrimaryColor,
                              iconSize: 14,
                              width: 20,
                              height: 20,
                              borderWidth: 1.5,
                              value:
                                  checkedValue, // current checked value for this publisher
                              onChanged: () {
                                onCheckChanged();
                              })
                        ],
                      ),
                      // space
                      const SizedBox(
                        height: 5.0,
                      ),
                      // divider
                      Divider(
                        height: 1.0,
                        color: Utils.lightGreyColor4,
                      ),
                    ],
                  )
                : const SizedBox());
  }
}

// custom checkbox
class CustomCheckbox extends StatefulWidget {
  CustomCheckbox(
      {Key? key,
      this.width = 28.0,
      this.height = 28.0,
      this.color,
      required this.checkedIconColor,
      required this.iconSize,
      required this.value,
      required this.onChanged,
      this.checkedBgColor,
      this.borderWidth})
      : super(key: key);

// custom checkbox for my publisher and languages screen
  CustomCheckbox.forPublisherScreen({
    this.width = 28.0,
    this.height = 28.0,
    this.color,
    required this.checkedIconColor,
    required this.iconSize,
    required this.value,
    required this.onChanged,
    this.checkedBgColor,
    this.borderWidth,
    this.publisherScreen = true,
  });

  final double width;
  final double height;
  final Color? color;
  final double? borderWidth;
  // Now you can set the checkmark size of your own
  final double iconSize;
  final Color checkedIconColor;
  final bool value;
  VoidCallback onChanged;
  Color? checkedBgColor;

  // for publisher screen checkbox
  bool? publisherScreen;

  @override
  State<CustomCheckbox> createState() => _CustomCheckboxState();
}

class _CustomCheckboxState extends State<CustomCheckbox> {
  // bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      // onTap: () {
      // setState(() => isChecked = !isChecked);
      // widget.onChanged?.call(isChecked);

      // },
      onTap: () => widget.onChanged(),
      child: Container(
        width: widget.width,
        height: widget.height,
        decoration: BoxDecoration(
          border: Border.all(
            color: widget.value
                ? Utils.kAppPrimaryColor
                : widget.color ?? Colors.grey.shade500,
            width: widget.borderWidth ?? 2.0,
          ),
          borderRadius: BorderRadius.circular(14.0),
          color: widget.value
              ? widget.checkedBgColor ?? Utils.kAppPrimaryColor
              : Utils.whiteColor,
        ),
        child: widget.value
            ? Icon(
                Icons.check,
                size: widget.iconSize,
                color: widget.checkedIconColor,
              )
            : widget.publisherScreen != null
                ? Icon(
                    Icons.check,
                    size: widget.iconSize,
                    color: Colors.grey.shade500,
                  )
                : null,
      ),
    );
  }
}

// add, edit profile image screen
class AddEditProfileImage extends StatelessWidget {
  AddEditProfileImage.addImageScreen({this.addImageScreen = true});
  AddEditProfileImage.editImageScreen({this.editImageScreen = true});

  bool? addImageScreen;
  bool? editImageScreen;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Utils.getKAppPrimaryAppBar('', false, null),
      backgroundColor: Utils.whiteColor,
      body: _getBody(context),
    );
  }

  _getBody(context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // text
          Text(
            'How you will appear?',
            style: Utils.kAppPrimaryTextStyle.copyWith(fontSize: 34),
          ),

          // space
          const SizedBox(
            height: 90.0,
          ),

          // image
          Center(
              child: SizedBox(
                  width: 130,
                  height: 130,
                  child:
                      // add profile image screen
                      addImageScreen != null
                          ? const Image(
                              image: AssetImage(
                                  'assets/images/add-profile-pic.png'),
                              width: 162,
                              height: 162,
                            )
                          // edit profile image screen
                          : Stack(children: [
                              const Image(
                                image:
                                    AssetImage('assets/images/user-image.png'),
                                width: 132,
                                height: 132,
                              ),

                              // edit icon
                              Align(
                                  alignment: Alignment.bottomRight,
                                  child: CircleAvatar(
                                      radius: 15,
                                      backgroundColor: Utils.whiteColor,
                                      foregroundImage: const AssetImage(
                                          'assets/images/tabler_edit.png')))
                            ]))),

          // space
          const SizedBox(
            height: 90.0,
          ),

          addImageScreen != null
              ? Column(
                  children: [
                    Center(
                      // primary button continue
                      child: CustomButton(
                        onPressed: () {
                          // clos screen
                          Navigator.pop(context);
                          // push home screen
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => const HomeView()));
                        },
                        primaryButton: true,
                        buttonText: 'Continue',
                        buttonHeight: 70,
                        buttonWidth: MediaQuery.of(context).size.width,
                      ),
                    ),
                    // space
                    const SizedBox(
                      height: 20.0,
                    ),

                    // secondary button skip
                    Center(
                      child: CustomButton(
                        onPressed: () {
                          // clos screen
                          Navigator.pop(context);
                          // push home screen
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => const HomeView()));
                        },
                        secondaryButton: true,
                        buttonText: 'Skip',
                        buttonHeight: 70,
                        buttonWidth: MediaQuery.of(context).size.width,
                      ),
                    )
                  ],
                )
              : Column(
                  children: [
                    Center(
                      // primary button update
                      child: CustomButton(
                        onPressed: () {},
                        primaryButton: true,
                        buttonText: 'Update',
                        buttonHeight: 70,
                        buttonWidth: MediaQuery.of(context).size.width,
                      ),
                    ),
                    // space
                    const SizedBox(
                      height: 20.0,
                    ),

                    // secondary button remove
                    Center(
                      child: CustomButton(
                        onPressed: () {},
                        secondaryButton: true,
                        buttonText: 'Remove',
                        buttonHeight: 70,
                        buttonWidth: MediaQuery.of(context).size.width,
                      ),
                    )
                  ],
                )
        ],
      ),
    );
  }
}
