import 'package:flutter/material.dart';
import 'package:newzler/configs/utils.dart';
import 'package:newzler/presentation/views/login/authentication_wrapper.dart';
import 'package:newzler/presentation/views/widgets/widgets.dart';

class SearchResultView extends StatefulWidget {
  SearchResultView({super.key});

  SearchResultView.notLoggedIn({this.notLoggedIn = true});
  SearchResultView.showSingleCard({this.showSingleCard = true});
  SearchResultView.noResultFound({this.noResultFound = true});

  bool? notLoggedIn; // if value present then must be true
  bool? showSingleCard;
  bool? noResultFound; // if value present then must be true

  @override
  State<SearchResultView> createState() => _SearchResultViewState();
}

class _SearchResultViewState extends State<SearchResultView> {
  bool _isLoading = true;

  // push login screen
  pushLoginScreen(context) {
    // push
    Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => AuthenticationWrapper(
              backButton: true,
            )));
  }

  // push signup screen
  pushSignupScreen(context) {
    // push
    Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => AuthenticationWrapper(
              backButton: true,
              showLoginScreen: false,
            )));
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // set is loading to false after 2 secs
    Future.delayed(const Duration(seconds: 2), () {
      setState(() {
        _isLoading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Utils.getKAppPrimaryAppBar('Search', true, null),
      backgroundColor: Utils.whiteColor,
      body: _getBody(context),
    );
  }

  // return screen body
  _getBody(context) {
    return SingleChildScrollView(
        child: Padding(
      padding: const EdgeInsets.all(20.0),
      child: Container(
        // color: Colors.amber,
        child: Column(children: [
          _isLoading
              ? SizedBox(
                  height: MediaQuery.of(context).size.height - 150,
                  child: Center(
                    child: SizedBox(
                        width: 40,
                        height: 40,
                        child: CircularProgressIndicator(
                          backgroundColor: Utils.whiteColor,
                          color: Utils.kAppPrimaryColor,
                        )),
                  ),
                )
              :
              // if not logged in is not null then show not logged in view
              widget.notLoggedIn != null
                  ?
                  // show single card with login, signup buttons screen
                  // single card
                  Column(
                      children: [
                        // news card
                        NewsCard(
                          newsImagePath: 'assets/images/news-1.png',
                        ),

                        // space
                        const SizedBox(
                          height: 20.0,
                        ),

                        // login, signup buttons
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            textAlign: TextAlign.center,
                            'Create an account or login to Newzler to continue.',
                            style: Utils.kAppPrimaryTextStyle.copyWith(
                                fontWeight: FontWeight.w800,
                                color: Utils.lightGreyColor),
                          ),
                        ),

                        // space
                        const SizedBox(
                          height: 20.0,
                        ),

                        // buttons
                        // combined buttons
                        const LoginSignupCombinedButtons()
                      ],
                    )
                  :
                  // if show single card value is not null then show single card screen
                  widget.showSingleCard != null
                      ? Column(
                          children: [
                            Column(
                              children: [1].map((index) {
                                return NewsCard(
                                  newsImagePath:
                                      'assets/images/news-$index.png',
                                  bookmarked: false,
                                );
                              }).toList(),
                            ),
                            // that's all we have text
                            Text(
                              'That\'s all we have.',
                              style: Utils.kAppPrimaryTextStyle
                                  .copyWith(color: Utils.lightGreyColor2),
                            )
                          ],
                        )
                      // show no result found screen
                      : widget.noResultFound != null
                          ? SizedBox(
                              height: MediaQuery.of(context).size.height,
                              width: MediaQuery.of(context).size.width,
                              child: BannerImageText(
                                  bannerImagePath:
                                      'assets/images/not-found-banner.png',
                                  text: 'No news has been found'))
                          // show all results
                          : Column(
                              children: [
                                Column(
                                  children: [1, 2, 3, 4].map((index) {
                                    return NewsCard(
                                        newsImagePath:
                                            'assets/images/news-$index.png');
                                  }).toList(),
                                ),
                                // that's all we have text
                                Text(
                                  'That\'s all we have.',
                                  style: Utils.kAppPrimaryTextStyle
                                      .copyWith(color: Utils.lightGreyColor2),
                                )
                              ],
                            )
        ]),
      ),
    ));
  }
}
