import 'package:flutter/material.dart';
import 'package:newzler/configs/utils.dart';
import 'package:newzler/presentation/views/change_email_password/widgets/change_email_password_view.dart';
import 'package:newzler/presentation/views/error/no_internet/no_internet_view.dart';
// import 'package:newzler/presentation/views/error/no_internet/no_internet_view.dart';
import 'package:newzler/presentation/views/error/under_maintenance/under_maintenance_view.dart';
import 'package:newzler/presentation/views/error/update_app/update_app_view.dart';
import 'package:newzler/presentation/views/live_cricket/live_cricket_view.dart';
import 'package:newzler/presentation/views/my_bookmark/my_bookmark_view.dart';
import 'package:newzler/presentation/views/my_category/my_category_view.dart';
import 'package:newzler/presentation/views/my_publisher_my_language/widgets/my_publisher_my_language_view.dart';
import 'package:newzler/presentation/views/profile/profile_view.dart';
import 'package:newzler/presentation/views/widgets/widgets.dart';

class MoreView extends StatelessWidget {
  MoreView({super.key});

  MoreView.isNotLoggedIn({this.isNotLoggedIn = true});

  bool? isNotLoggedIn;

  final accountOptions = [
    {
      'icon': 'assets/images/live-icon.png',
      'option': 'Live Cricket',
    },
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
      'icon': 'assets/images/privacy-icon.png',
      'option': 'Change password',
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
      'option': 'Follow on Facebook',
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
    {
      'icon': 'assets/images/live-icon.png',
      'option': 'Live Cricket',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Utils.getKAppPrimaryAppBar('Account', false, null),
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
                  ? const LoginSignupCombinedButtons()
                  // logged in
                  // user details
                  : Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        // user image
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      AddEditProfileImage.editImageScreen()),
                            );
                          },
                          child: const Image(
                            image: AssetImage('assets/images/user-icon.png'),
                            width: 70,
                            height: 70,
                          ),
                        ),

                        // space
                        const SizedBox(
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
                                GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const ProfileView()),
                                    );
                                  },
                                  child: Text(
                                    'Darrell Chan',
                                    style: Utils.kAppPrimaryTextStyle.copyWith(
                                        fontSize: 18.0,
                                        fontWeight: FontWeight.w800),
                                  ),
                                ),

                                // space
                                const SizedBox(
                                  width: 10.0,
                                ),

                                // goto icon
                                GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const ProfileView()),
                                    );
                                  },
                                  child: const Image(
                                    image: AssetImage(
                                        'assets/images/goto-icon.png'),
                                    width: 20,
                                    height: 20,
                                  ),
                                )
                              ],
                            ),

                            // space
                            const SizedBox(
                              height: 4.0,
                            ),

                            // email
                            GestureDetector(
                              onTap: () {
                                // push change email screen
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) =>
                                        ChangeEmailPasswordView(
                                          heading: 'Change email address',
                                        )));
                              },
                              child: Text(
                                'abc@example.com',
                                style: Utils.kAppPrimaryTextStyle.copyWith(
                                    color: Utils.lightGreyColor,
                                    fontSize: 13.0,
                                    fontWeight: FontWeight.w800),
                              ),
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
            ? const SizedBox()
            : const Divider(
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
                          /*
                          // push not logged in screen
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => MoreView.isNotLoggedIn()),
                          );
                          */
                          if (accountOptionMap['option'] == 'My Bookmark') {
                            // push my bookmark screen
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => MyBookmarkView()),
                            );
                          }
                          // notifications screen
                          else if (accountOptionMap['option'] ==
                              'Notifications') {
                            // push
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const UnderMaintenanceView()),
                            );
                          }
                          // theme screen
                          else if (accountOptionMap['option'] == 'Theme') {
                            // push
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const UpdateAppView()),
                            );
                          }
                          // my publisher screen
                          else if (accountOptionMap['option'] ==
                              'My Publisher') {
                            // push
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      MyPublisherMyLanguageView(
                                        myPublisherScreen: true,
                                      )),
                            );
                          }
                          // my language screen
                          else if (accountOptionMap['option'] ==
                              'My Language') {
                            // push
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      MyPublisherMyLanguageView(
                                        myLanguageScreen: true,
                                      )),
                            );
                          }
                          // my category screen
                          else if (accountOptionMap['option'] ==
                              'My Category') {
                            // push
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const MyCategoryView()),
                            );
                          }
                          // live score screen
                          else if (accountOptionMap['option'] ==
                              'Live Cricket') {
                            // push
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const LiveCricketView()),
                            );
                          }
                          // change password screen
                          else if (accountOptionMap['option'] ==
                              'Change password') {
                            // push
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ChangeEmailPasswordView(
                                        heading: 'Change password',
                                      )),
                            );
                          }
                          // no internet screen
                          else if (accountOptionMap['option'] ==
                              'Follow on Facebook') {
                            // push
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const NoInternetView()),
                            );
                          }
                        },
                        child: AccountOptionTile(
                            iconImagePath: accountOptionMap['icon'] as String,
                            option: accountOptionMap['option'] as String),
                      );
                    }).toList()),
        ),
        // space for floating bottom bar
        const SizedBox(
          height: 80.0,
        ),
      ],
    ));
  }
}
