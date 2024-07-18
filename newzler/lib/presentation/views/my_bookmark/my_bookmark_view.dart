import 'package:floating_snackbar/floating_snackbar.dart';
import 'package:flutter/material.dart';
import 'package:newzler/configs/utils.dart';
import 'package:newzler/presentation/views/widgets/widgets.dart';

class MyBookmarkView extends StatefulWidget {
  MyBookmarkView({super.key});

  MyBookmarkView.isNotLoggedIn({this.isNotLoggedIn = true});
  MyBookmarkView.isEmpty({this.isEmpty = true});

  bool? isNotLoggedIn; // user is not logged in

  bool? isEmpty; // bookmarks are empty

  @override
  State<MyBookmarkView> createState() => _MyBookmarkViewState();
}

class _MyBookmarkViewState extends State<MyBookmarkView> {
  var bookmarkedNews = [
    {
      'image': 'assets/images/bookmarked-news-1.png',
      'title':
          'Covid: Dr Scott Atlas - Trump\'s controversial coronavirus adviser resigns',
      'time_ago': '4 minutes ago',
      'location': 'US & Canada',
      'checked': false,
      'deleted': false,
    },
    {
      'image': 'assets/images/bookmarked-news-2.png',
      'title': 'UNS 1st  December 1945 - Singer Better Midler',
      'time_ago': '4 minutes ago',
      'location': 'US & Canada',
      'checked': false,
      'deleted': false,
    },
    {
      'image': 'assets/images/bookmarked-news-1.png',
      'title':
          'Covid: Dr Scott Atlas - Trump\'s controversial coronavirus adviser resigns',
      'time_ago': '4 minutes ago',
      'location': 'US & Canada',
      'checked': false,
      'deleted': false,
    },
    {
      'image': 'assets/images/bookmarked-news-2.png',
      'title': 'UNS 1st  December 1945 - Singer Better Midler',
      'time_ago': '4 minutes ago',
      'location': 'US & Canada',
      'checked': false,
      'deleted': false,
    },
    {
      'image': 'assets/images/bookmarked-news-1.png',
      'title':
          'Covid: Dr Scott Atlas - Trump\'s controversial coronavirus adviser resigns',
      'time_ago': '4 minutes ago',
      'location': 'US & Canada',
      'checked': false,
      'deleted': false,
    },
  ];

  bool _isLoading = true;

  bool _longPressed = false;

  showAlertDialog(BuildContext context) {
    // set up the buttons
    Widget cancelButton = TextButton(
      child: Text(
        "Delete",
        style: Utils.kAppPrimaryTextStyle.copyWith(color: Colors.red),
      ),
      onPressed: () {
        // set the checked news in list value of delete as true
        setState(() {
          bookmarkedNews.forEach((map) {
            if (map['checked'] == true) {
              map['deleted'] = true;
            }
          });

          _longPressed = false;
        });
        // close alert
        Navigator.pop(context);
      },
    );
    Widget continueButton = TextButton(
      child: Text(
        "Cancel",
        style: Utils.kAppPrimaryTextStyle.copyWith(color: Utils.greyColor4),
      ),
      onPressed: () {
        // close alert dialog
        Navigator.pop(context);
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      contentPadding: const EdgeInsets.symmetric(horizontal: 26.0, vertical: 35.0),
      backgroundColor: Utils.whiteColor,
      actionsAlignment: MainAxisAlignment.spaceBetween,
      // title: Text("AlertDialog"),
      content: Text(
        textAlign: TextAlign.center,
        "Are you sure you want to delete from your bookmarks?",
        style: Utils.kAppPrimaryTextStyle.copyWith(fontSize: 18),
      ),
      actions: [
        cancelButton,
        continueButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    // after 2 secs set is loading as false
    Future.delayed(const Duration(seconds: 2), () {
      setState(() {
        _isLoading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _longPressed
          ? Utils.getMyBookmarkActionAppBar(() {
              setState(() {
                // set to false
                _longPressed = false;
                // set all news checked value to false
                bookmarkedNews.forEach((map) {
                  map['checked'] = false;
                });
              });
            }, () {
              // check if more than one are checked and not already deleted
              int checkedNewsLength =
                  bookmarkedNews.where((map) => (map['checked'] == true && map['deleted']==false)).length;

              if (checkedNewsLength >= 1) {
                showAlertDialog(context);
              } else {
                floatingSnackBar(
                    message: 'Please select a news first', context: context);
              }
            })
          : Utils.getKAppPrimaryAppBar('My Bookmark', true, null),
      backgroundColor: Utils.whiteColor,
      body: _getBody(),
    );
  }

  // return screen body
  _getBody() {
    return SingleChildScrollView(
        child: Column(children: [
      Padding(
          padding: const EdgeInsets.all(20.0),
          child:
              // user not logged in screen
              widget.isNotLoggedIn != null
                  ? SizedBox(
                      // height: MediaQuery.of(context).size.height,
                      width: MediaQuery.of(context).size.width,
                      child: Column(children: [
                        // banner image, text widget
                        BannerImageText(
                          bannerImagePath:
                              'assets/images/my-bookmark-not-logged-in-banner.png',
                          text:
                              'Create an account or login to newzler to continue',
                          textColor: Utils.greyColor2,
                        ),

                        // space
                        const SizedBox(
                          height: 40.0,
                        ),

                        // combined buttons
                        const LoginSignupCombinedButtons()
                      ]))
                  :
                  // bookmarks empty screen
                  widget.isEmpty != null
                      ? SizedBox(
                          // height: MediaQuery.of(context).size.height,
                          width: MediaQuery.of(context).size.width,
                          child: Column(children: [
                            // banner image, text widget
                            BannerImageText(
                              bannerImagePath:
                                  'assets/images/my-bookmark-empty-banner.png',
                              text: 'Your bookshelf has no news',
                            ),
                          ]))
                      :
                      // all news
                      Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            // news heading
                            Row(
                              children: [
                                // news icon
                                const Image(
                                  image:
                                      AssetImage('assets/images/news-icon.png'),
                                  width: 27,
                                  height: 27,
                                ),

                                // space
                                const SizedBox(
                                  width: 5.0,
                                ),

                                // text
                                Text(
                                  'News',
                                  style: Utils.kAppPrimaryTextStyle.copyWith(
                                      fontWeight: FontWeight.w800,
                                      fontSize: 16),
                                )
                              ],
                            ),

                            // space
                            const SizedBox(
                              height: 20.0,
                            ),

                            // news column
                            Column(
                              children: bookmarkedNews.map((bookmarkedNewsMap) {
                                // show not deleted news
                                return bookmarkedNewsMap['deleted'] == true
                                    ? const SizedBox()
                                    : GestureDetector(
                                        // already enabled then not enable again
                                        onLongPress: _longPressed
                                            ? null
                                            : () {
                                                // show checkbox on start of container and delete, cancel icons on top
                                                setState(() {
                                                  _longPressed = true;
                                                  // set this news checked value to true
                                                  bookmarkedNewsMap['checked'] =
                                                      true;
                                                });
                                              },
                                        child: MyBookmarkNewsTile(
                                          imagePath: bookmarkedNewsMap['image']
                                              as String,
                                          title: bookmarkedNewsMap['title']
                                              as String,
                                          timeAgo: bookmarkedNewsMap['time_ago']
                                              as String,
                                          location:
                                              bookmarkedNewsMap['location']
                                                  as String,
                                          checkBoxValue:
                                              bookmarkedNewsMap['checked']
                                                  as bool,
                                          onCheckBoxChanged: () {
                                            setState(() {
                                              // set checked value as opposite of current
                                              bookmarkedNewsMap['checked'] =
                                                  bookmarkedNewsMap[
                                                              'checked'] ==
                                                          true
                                                      ? false
                                                      : true;
                                            });
                                          },
                                          longPressed: _longPressed,
                                        ));
                              }).toList(),
                            ),
                            // space
                            const SizedBox(
                              height: 10.0,
                            ),
                            // loader
                            _isLoading
                                ? SizedBox(
                                    width: 58,
                                    height: 58,
                                    child: CircularProgressIndicator(
                                      color: Utils.kAppPrimaryColor,
                                      backgroundColor: Utils.greyColor4,
                                      strokeWidth: 5,
                                    ),
                                  )
                                : const SizedBox()
                          ],
                        ))
    ]));
  }
}
