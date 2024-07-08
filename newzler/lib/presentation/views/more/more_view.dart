import 'package:flutter/material.dart';
import 'package:newzler/configs/utils.dart';
import 'package:newzler/presentation/views/widgets/widgets.dart';

class MoreView extends StatelessWidget {
  MoreView({super.key});

  MoreView.isNotLoggedIn({this.isNotLoggedIn = true});

  bool? isNotLoggedIn;

  final accountOptions = [
    {
      'icon': 'assets/images/notifications-icon.png',
      'option': 'Notifications',
    },
    {
      'icon': 'assets/images/theme-icon.png',
      'option': 'Theme',
    },
    {
      'icon': 'assets/images/bookmark-icon.png',
      'option': 'My Bookmark',
    },
    {
      'icon': 'assets/images/my-publisher-icon.png',
      'option': 'My Publisher',
    },
    {
      'icon': 'assets/images/my-language-icon.png',
      'option': 'My Language',
    },
    {
      'icon': 'assets/images/my-category-icon.png',
      'option': 'My Category',
    },
    {
      'icon': 'assets/images/about-icon.png',
      'option': 'About',
    },
    {
      'icon': 'assets/images/privacy-icon.png',
      'option': 'Privacy',
    },
    {
      'icon': 'assets/images/terms-icon.png',
      'option': 'Terms',
    },
    {
      'icon': 'assets/images/share-icon.png',
      'option': 'Share this app',
    },
    {
      'icon': 'assets/images/star-icon.png',
      'option': 'Rate the app',
    },
    {
      'icon': 'assets/images/iconoir_facebook.png',
      'option': 'Follow in Facebook',
    },
    {
      'icon': 'assets/images/mdi_twitter.png',
      'option': 'Follow on Twitter',
    },
    {
      'icon': 'assets/images/mdi_instagram.png',
      'option': 'Follow on Instagram',
    },
  ];

  final accountOptionsNotLoggedIn = [
    {
      'icon': 'assets/images/notifications-icon.png',
      'option': 'Notifications',
    },
    {
      'icon': 'assets/images/theme-icon.png',
      'option': 'Theme',
    },
    {
      'icon': 'assets/images/bookmark-icon.png',
      'option': 'My Bookmark',
    },
    {
      'icon': 'assets/images/my-publisher-icon.png',
      'option': 'My Publisher',
    },
    {
      'icon': 'assets/images/my-language-icon.png',
      'option': 'My Language',
    },
    {
      'icon': 'assets/images/my-category-icon.png',
      'option': 'My Category',
    },
    {
      'icon': 'assets/images/about-icon.png',
      'option': 'About',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Utils.getKAppPrimaryAppBar('Account', false),
      backgroundColor: Utils.whiteColor,
      body: _getBody(context),
    );
  }

  // return screen body
  _getBody(context) {
    return SingleChildScrollView(
        child: Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(15.0),
          // header details column
          child: Column(
            children: [
              //  not logged in
              isNotLoggedIn != null
                  // combined button
                  ? LoginSignupCombinedButtons()
                  // logged in
                  // user details
                  : Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        // user image
                        Image(
                          image: AssetImage('assets/images/user-icon.png'),
                          width: 70,
                          height: 70,
                        ),

                        // space
                        SizedBox(
                          width: 20.0,
                        ),

                        // name, email column
                        Expanded(
                            child: Column(
                          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                // name
                                Text(
                                  'Darrell Chan',
                                  style: Utils.kAppPrimaryTextStyle.copyWith(
                                      fontSize: 18.0,
                                      fontWeight: FontWeight.w800),
                                ),

                                // space
                                SizedBox(
                                  width: 10.0,
                                ),

                                // goto icon
                                Image(
                                  image:
                                      AssetImage('assets/images/goto-icon.png'),
                                  width: 20,
                                  height: 20,
                                )
                              ],
                            ),

                            // space
                            SizedBox(
                              height: 4.0,
                            ),

                            // email
                            Text(
                              'abc@example.com',
                              style: Utils.kAppPrimaryTextStyle.copyWith(
                                  color: Utils.lightGreyColor,
                                  fontSize: 13.0,
                                  fontWeight: FontWeight.w800),
                            )
                          ],
                        ))
                      ],
                    )
            ],
          ),
        ),

        // divider

        // if not logged in then not show divider
        isNotLoggedIn != null
            ? SizedBox()
            : Divider(
                height: 2.0,
              ),

        // account options
        Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
              // account options for not logged in
              children: isNotLoggedIn != null
                  ? accountOptionsNotLoggedIn.map((accountOptionMap) {
                      return AccountOptionTile(
                          iconImagePath: accountOptionMap['icon'] as String,
                          option: accountOptionMap['option'] as String);
                    }).toList()

                  // logged in options
                  : accountOptions.map((accountOptionMap) {
                      return GestureDetector(
                        onTap: () {
                          // push not logged in screen
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => MoreView.isNotLoggedIn()),
                          );
                        },
                        child: AccountOptionTile(
                            iconImagePath: accountOptionMap['icon'] as String,
                            option: accountOptionMap['option'] as String),
                      );
                    }).toList()),
        )
      ],
    ));
  }
}
