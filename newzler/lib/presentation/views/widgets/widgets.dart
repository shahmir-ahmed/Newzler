import 'package:flutter/material.dart';
import 'package:newzler/configs/utils.dart';

// whole app common widgets here

class PrimaryButton extends StatelessWidget {
  PrimaryButton(
      {required this.onPressed,
      required this.buttonText,
      this.buttonWidth,
      this.buttonHeight,
      this.icon});

  VoidCallback onPressed;
  String buttonText;
  double? buttonWidth;
  double? buttonHeight;
  Icon? icon;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: buttonWidth != null ? buttonWidth! : 88.0,
      height: buttonHeight != null ? buttonHeight! : 36.0,
      child: icon != null
          ? ElevatedButton.icon(
              onPressed: onPressed,
              label: Text(
                buttonText,
                style: Utils.kAppPrimaryTextStyle
                    .copyWith(fontWeight: FontWeight.bold),
              ),
              style: ButtonStyle(
                backgroundColor: WidgetStatePropertyAll(Utils.kAppPrimaryColor),
                elevation: WidgetStatePropertyAll(3.0),
                foregroundColor: WidgetStatePropertyAll(Utils.whiteColor),
                // fixedSize: buttonWidth!=null ? WidgetStatePropertyAll(ui.Size.fromWidth(buttonWidth!)) : null
              ),
              icon: icon,
            )
          : ElevatedButton(
              onPressed: onPressed,
              child: Text(
                buttonText,
                style: Utils.kAppPrimaryTextStyle
                    .copyWith(fontWeight: FontWeight.bold),
              ),
              style: ButtonStyle(
                backgroundColor: WidgetStatePropertyAll(Utils.kAppPrimaryColor),
                shadowColor: WidgetStatePropertyAll(Utils.kAppPrimaryColor),
                elevation: WidgetStatePropertyAll(3.0),
                foregroundColor: WidgetStatePropertyAll(Utils.whiteColor),
                // fixedSize: buttonWidth!=null ? WidgetStatePropertyAll(ui.Size.fromWidth(buttonWidth!)) : null
              ),
            ),
    );
  }
}

// grey icon button for 'continue with email' button
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
            backgroundColor: WidgetStatePropertyAll(Utils.kAppSecondaryColor),
            elevation: WidgetStatePropertyAll(0.0),
            foregroundColor: WidgetStatePropertyAll(Utils.whiteColor),
            // fixedSize: buttonWidth!=null ? WidgetStatePropertyAll(ui.Size.fromWidth(buttonWidth!)) : null
          ),
          icon: icon,
        ));
  }
}

// secondary button with white bg, grey text color
class SecondaryButton extends StatelessWidget {
  SecondaryButton(
      {required this.onPressed,
      required this.buttonText,
      this.buttonWidth,
      this.buttonHeight});

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

// news interaction buttons
class NewsInteractionButtons extends StatelessWidget {
  NewsInteractionButtons(
      {required this.mainAxisAlignment,
      this.bookmarked,
      this.blackColoredIcons});

  MainAxisAlignment mainAxisAlignment;
  bool? bookmarked;
  bool? blackColoredIcons;

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
              color: Utils.lightGreyColor4),
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
          },
          child: SizedBox(
            child: blackColoredIcons == null
                ? Icon(
                    Icons.thumb_up_outlined,
                    color: Utils.whiteColor,
                  )
                : Icon(
                    Icons.thumb_up_outlined,
                    color: Colors.black,
                  ),
          ),
        ),

        // bookmark button
        bookmarked == null
            ? blackColoredIcons == null
                ? Icon(
                    Icons.bookmark_border,
                    color: Utils.whiteColor,
                  )
                : Icon(
                    Icons.bookmark_border,
                    color: Colors.black,
                  )
            : Icon(
                Icons.bookmark_outlined,
                color: Utils.kAppPrimaryColor,
              ),

        // copy link button
        blackColoredIcons == null
            ? Icon(
                Icons.copy,
                color: Utils.whiteColor,
              )
            : Icon(
                Icons.copy,
                color: Colors.black,
              ),

        GestureDetector(
            onTap: () {
              // show bottom sheet to react to news
              _showShareBottomSheet(context);
            },
            child: SizedBox(
                child: blackColoredIcons == null
                    ?
                    // share button
                    Icon(
                        Icons.share,
                        color: Utils.whiteColor,
                      )
                    : Icon(
                        Icons.share,
                        color: Colors.black,
                      )))
      ],
    );
  }
}

// news card
class NewsCard extends StatelessWidget {
  NewsCard({required this.newsImagePath});

  String newsImagePath;

  @override
  Widget build(BuildContext context) {
    // card in column
    return Container(
      // color: Colors.pink,
      height: 400.0,
      child: Column(
        // mainAxisSize: MainAxisSize.min,
        children: [
          // news image
          Container(
            width: MediaQuery.of(context).size.width,
            height: 200.0,
            child: Image(
              fit: BoxFit.cover,
              image: AssetImage(newsImagePath),
            ),
          ),

          // space
          SizedBox(
            height: 30.0,
          ),

          // news details row
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
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
                        'A protester carries the Confederate flag after breaching US Captical security',
                        style:
                            Utils.kAppPrimaryTextStyle.copyWith(fontSize: 15.0),
                      ),

                      // space
                      SizedBox(
                        height: 5.0,
                      ),

                      Text(
                        '5 hours ago | News18',
                        style: Utils.kAppPrimaryTextStyle.copyWith(
                            color: Utils.lightGreyColor2, fontSize: 10.0),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),

          // space
          SizedBox(
            height: 20.0,
          ),

          // news interaction buttons
          NewsInteractionButtons(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            bookmarked: true,
            blackColoredIcons: true,
          )
        ],
      ),
    );
  }
}
