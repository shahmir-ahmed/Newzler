import 'package:flutter/material.dart';
import 'package:newzler/configs/utils.dart';
import 'package:newzler/presentation/views/widgets/widgets.dart';

class MyPublisherMyLanguageView extends StatefulWidget {
  MyPublisherMyLanguageView({this.myPublisherScreen, this.myLanguageScreen});

  bool? myPublisherScreen;
  bool? myLanguageScreen;

  @override
  State<MyPublisherMyLanguageView> createState() =>
      _MyPublisherMyLanguageViewState();
}

class _MyPublisherMyLanguageViewState extends State<MyPublisherMyLanguageView> {
  // search field controller
  final searchFieldController = TextEditingController();

  // search field text
  String searchText = '';

  // publishers
  var publishers = [
    {
      'image': 'assets/images/tabler_category_icon.png',
      'title': 'All Publishers',
      'checked': false,
    },
    {
      'image': 'assets/images/Ellipse 15NN.png',
      'title': 'News Nation',
      'checked': true,
    },
    {
      'image': 'assets/images/Ellipse 16TOI.png',
      'title': 'Times of India',
      'checked': true,
    },
    {
      'image': 'assets/images/Ellipse 17NN2.png',
      'title': 'News Nation',
      'checked': false,
    },
    {
      'image': 'assets/images/Ellipse 18GN.png',
      'title': 'Gadgets Now',
      'checked': false,
    },
    {
      'image': 'assets/images/Ellipse 19.png',
      'title': 'India Today',
      'checked': false,
    },
    {
      'image': 'assets/images/Ellipse 20Swirlster.png',
      'title': 'Swirlster',
      'checked': false,
    },
  ];

  // languages
  var languages = [
    {
      'title': 'English',
      'checked': true,
    },
    {
      'title': 'Urdu',
      'checked': false,
    },
    {
      'title': 'French',
      'checked': false,
    },
    {
      'title': 'Hindi',
      'checked': true,
    },
    {
      'title': '中文',
      'checked': false,
    },
    {
      'title': 'Russian',
      'checked': false,
    },
    {
      'title': 'Punjabi',
      'checked': false,
    },
    {
      'title': 'German',
      'checked': false,
    },
    {
      'title': 'Spanish',
      'checked': false,
    },
  ];

  bool _isSearching = false;

  bool _searched = false;

  // on search submit
  _onSubmitted() {
    // set searching as true
    setState(() {
      _isSearching = true;
    });

    // after 2 secs
    Future.delayed(
        const Duration(
          seconds: 2,
        ), () {
      setState(() {
        // publishers.forEach((publisherMap) {
        //   var title = publisherMap['title'] as String;
        //   if (title.toLowerCase().contains(searchText.toLowerCase())) {
        //     searchedPublishers.add(publisherMap);
        //   }
        // });
        // set as false
        _isSearching = false;
        // set as true to show search results
        _searched = true;
      });
    });
  }

  // clear search field
  _clearSearchField() {
    searchFieldController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: widget.myPublisherScreen != null
          ? Utils.getKAppPrimaryAppBar('My publisher', true, null)
          : widget.myLanguageScreen != null
              ? Utils.getKAppPrimaryAppBar('My language', true, [
                  // done button
                  Padding(
                    padding: const EdgeInsets.only(right: 18.0),
                    child: CustomButton(
                      onPressed: () {
                        // close screen
                        Navigator.pop(context);
                      },
                      primaryButton: true,
                      buttonText: 'Done',
                      buttonWidth: 95,
                      buttonHeight: 45,
                    ),
                  )
                ])
              // if none of the screen is specified then null
              : null,
      backgroundColor: Utils.whiteColor,
      body: _getBody(context),
    );
  }

  _getBody(context) {
    return SingleChildScrollView(
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        // search field main container
        Container(
          height: 85,
          padding: const EdgeInsets.symmetric(vertical: 0.0, horizontal: 20.0),
          // color: Colors.amber,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 55.0,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(10.0)),
                  color: Utils.lightGreyColor4,
                ),
                // container with border radius and bg color inside textfield
                child: Center(
                  child: TextField(
                    controller: searchFieldController,
                    style: Utils.kAppPrimaryTextStyle.copyWith(
                        color: Utils.kAppPrimaryColor, fontSize: 14.0),
                    cursorColor: Colors.black,
                    decoration: InputDecoration(
                        hintText: 'Search',
                        hintStyle: Utils.kAppPrimaryTextStyle
                            .copyWith(color: Utils.lightGreyColor),
                        border: InputBorder.none,
                        fillColor: Utils.greyColor,
                        suffixIcon: _isSearching
                            ? Container(
                                width: 27,
                                height: 27,
                                // color: Colors.amber,
                                padding: const EdgeInsets.all(12.0),
                                child: CircularProgressIndicator(
                                  color: Utils.kAppPrimaryColor,
                                  strokeWidth: 2,
                                ),
                              )
                            : GestureDetector(
                                onTap: () {
                                  _clearSearchField();
                                  // clear search results also
                                  setState(() {
                                    _searched = false;
                                  });
                                },
                                child: Icon(
                                  Icons.cancel_outlined,
                                  color: Utils.lightGreyColor2,
                                ),
                              ),
                        prefixIcon: const Icon(
                          Icons.search,
                          size: 30.0,
                        )),
                    onSubmitted: (value) {
                      // filter publishers according to search from list
                      _onSubmitted();
                    },
                    onChanged: (value) {
                      // Perform search functionality here
                      setState(() {
                        searchText = value;
                      });
                      // if searched is true then set as false
                      if (_searched) {
                        setState(() {
                          _searched = false;
                        });
                      }
                    },
                  ),
                ),
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
          padding: const EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              widget.myPublisherScreen != null
                  ?
                  // space
                  const SizedBox(
                      height: 20.0,
                    )
                  : const SizedBox(),

              // title
              widget.myPublisherScreen != null
                  ? Text(
                      'Customize news across all categories',
                      style: Utils.kAppPrimaryTextStyle.copyWith(
                          fontWeight: FontWeight.w800, fontSize: 15.0),
                    )
                  : const SizedBox(),

              // space
              widget.myPublisherScreen != null
                  ? const SizedBox(
                      height: 20.0,
                    )
                  : const SizedBox(),

              // column
              Column(
                  // list of publishers
                  // for my publisher screen
                  children: widget.myPublisherScreen != null
                      ? _searched
                          ?
                          // show searched text according publishers only
                          publishers.map((publisherMap) {
                              String title = publisherMap['title'] as String;
                              // show items which contains the search text in their title
                              if (title
                                  .toLowerCase()
                                  .contains(searchText.toLowerCase())) {
                                // single publisher widget (searched)
                                return GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      publisherMap['checked'] =
                                          publisherMap['checked'] == true
                                              ? false
                                              : true;
                                    });
                                  },
                                  child: MyLanguageMyPublisherTile(
                                    imagePath: publisherMap['image'] as String,
                                    title: publisherMap['title'] as String,
                                    checkedValue:
                                        publisherMap['checked'] as bool,
                                    onCheckChanged: () {
                                      // change the value of checked
                                      setState(() {
                                        publisherMap['checked'] =
                                            publisherMap['checked'] == true
                                                ? false
                                                : true;
                                      });
                                    },
                                    myPublisherTile: true,
                                  ),
                                );
                              }
                              return const SizedBox();
                            }).toList()
                          // all publishers
                          : publishers.map((publisherMap) {
                              // single publisher widget
                              return GestureDetector(
                                onTap: () {
                                  setState(() {
                                    publisherMap['checked'] =
                                        publisherMap['checked'] == true
                                            ? false
                                            : true;
                                  });
                                },
                                child: MyLanguageMyPublisherTile(
                                    myPublisherTile: true,
                                    imagePath: publisherMap['image'] as String,
                                    title: publisherMap['title'] as String,
                                    checkedValue:
                                        publisherMap['checked'] as bool,
                                    onCheckChanged: () {
                                      // change the value of checked
                                      setState(() {
                                        publisherMap['checked'] =
                                            publisherMap['checked'] == true
                                                ? false
                                                : true;
                                      });
                                    }),
                              );
                            }).toList()
                      // for my languages screen
                      : widget.myLanguageScreen != null
                          ? _searched
                              ?
                              // show searched text according publishers only
                              languages.map((languageMap) {
                                  String title = languageMap['title'] as String;
                                  // show items which contains the search text in their title
                                  if (title
                                      .toLowerCase()
                                      .contains(searchText.toLowerCase())) {
                                    // single publisher widget
                                    return GestureDetector(
                                      onTap: () {
                                        // change the value of checked
                                        setState(() {
                                          languageMap['checked'] =
                                              languageMap['checked'] == true
                                                  ? false
                                                  : true;
                                        });
                                      },
                                      child: MyLanguageMyPublisherTile(
                                          myLanguageTile: true,
                                          title: languageMap['title'] as String,
                                          checkedValue:
                                              languageMap['checked'] as bool,
                                          onCheckChanged: () {
                                            // change the value of checked
                                            setState(() {
                                              languageMap['checked'] =
                                                  languageMap['checked'] == true
                                                      ? false
                                                      : true;
                                            });
                                          }),
                                    );
                                  }
                                  return const SizedBox();
                                }).toList()
                              // all languages
                              : languages.map((languageMap) {
                                  // single publisher widget
                                  return GestureDetector(
                                    onTap: () {
                                      // change the value of checked
                                      setState(() {
                                        languageMap['checked'] =
                                            languageMap['checked'] == true
                                                ? false
                                                : true;
                                      });
                                    },
                                    child: MyLanguageMyPublisherTile(
                                        myLanguageTile: true,
                                        title: languageMap['title'] as String,
                                        checkedValue:
                                            languageMap['checked'] as bool,
                                        onCheckChanged: () {
                                          // change the value of checked
                                          setState(() {
                                            languageMap['checked'] =
                                                languageMap['checked'] == true
                                                    ? false
                                                    : true;
                                          });
                                        }),
                                  );
                                }).toList()
                          :
                          // if none of the screen is specified then null
                          [])
            ],
          ),
        )
      ]),
    );
  }
}
