import 'package:flutter/material.dart';
import 'package:flutter_floating_bottom_bar/flutter_floating_bottom_bar.dart';
import 'package:newzler/configs/utils.dart';
import 'package:newzler/presentation/views/home/widgets/home_tab_view.dart';
import 'package:newzler/presentation/views/more/more_view.dart';
import 'package:newzler/presentation/views/search/search_view.dart';
import 'package:newzler/presentation/views/trending/trending_tab_view.dart';
import 'package:newzler/presentation/views/video/video_tab_view.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView>{
// class _HomeViewState extends State<HomeView> with TickerProviderStateMixin {
  // bottom navigation bar att.
  static final List<Widget> _widgetOptions = <Widget>[
    HomeTab(),
    TrendingTabView(),
    VideoTabView(),
    SearchView(),
    MoreView()
    // MoreView.isNotLoggedIn()
  ];

  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  // late int currentPage = 0;
  // late TabController tabController;

  // void changePage(int newPage) {
  //   setState(() {
  //     currentPage = newPage;
  //   });
  // }

  @override
  void initState() {
    // currentPage = 0;
    // tabController = TabController(length: 5, vsync: this);
    // tabController.animation!.addListener(
    //   () {
    //     final value = tabController.animation!.value.round();
    //     if (value != currentPage && mounted) {
    //       changePage(value);
    //     }
    //   },
    // );
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    // tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // widget tree
    return Scaffold(
      backgroundColor: Utils.whiteColor,
      body: _getBody(),
      // body: _widgetOptions.elementAt(_selectedIndex),
      // bottomNavigationBar: _getBottomNavigationBar(),
      // bottomNavigationBar: _getFloatingBottomNavBar(),
    );
  }

  _getBody() {
    return BottomBar(
        child: ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(20.0)),
          child: BottomNavigationBar(
            backgroundColor: Utils.lightGreyColor7,
            // fixedColor: Utils.whiteColor,
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                activeIcon: Icon(
                  Icons.home,
                  color: Colors.black,
                ),
                backgroundColor: Colors.white,
                icon: Icon(
                  Icons.home_outlined,
                  color: Colors.black,
                ),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                backgroundColor: Colors.white,
                activeIcon: Image(
                  image: AssetImage('assets/images/trending-bold.png'),
                  width: 24.0,
                  height: 24.0,
                ),
                icon: Image(
                  image: AssetImage('assets/images/trending-light.png'),
                  width: 16.0,
                  height: 24.0,
                ),
                label: 'Trending',
              ),
              BottomNavigationBarItem(
                backgroundColor: Colors.white,
                activeIcon: Icon(
                  Icons.play_circle_filled_sharp,
                  color: Colors.black,
                ),
                icon: Icon(
                  Icons.play_circle_outline,
                  color: Colors.black,
                ),
                label: 'Video',
              ),
              BottomNavigationBarItem(
                backgroundColor: Colors.white,
                activeIcon: Padding(
                  padding: EdgeInsets.only(right: 7.0),
                  child: Image(
                    image: AssetImage('assets/images/search-filled.png'),
                    width: 21.0,
                    height: 23.0,
                  ),
                ),
                icon: Icon(
                  Icons.search_sharp,
                  color: Colors.black,
                ),
                label: 'Search',
              ),
              BottomNavigationBarItem(
                backgroundColor: Colors.white,
                activeIcon: Image(
                  image: AssetImage('assets/images/more-filled.png'),
                  width: 22.0,
                  // width: 24.0,
                  height: 24.0,
                  // height: 26.0,
                ),
                icon: Image(
                  image: AssetImage('assets/images/more-empty.png'),
                  width: 21.0,
                  height: 24.0,
                  // width: 22.0,
                  // height: 26.0,
                ),
                label: 'More',
              ),
            ],
            // type: BottomNavigationBarType.shifting,
            type: BottomNavigationBarType.fixed,
            currentIndex: _selectedIndex,
            // selectedIconTheme: IconThemeData(fill: 0.5),
            selectedLabelStyle: Utils.kAppPrimaryTextStyle.copyWith(
                // color: Colors.black,
                fontSize: 14.0,
                fontWeight: FontWeight.w800),
            unselectedLabelStyle: Utils.kAppPrimaryTextStyle.copyWith(
                // color: Colors.black,
                fontSize: 14.0),
            selectedItemColor: Colors.black,
            // iconSize: 25,
            onTap: _onItemTapped,
            elevation: 0.0,
          ),
        ),

        /*
        child: TabBar(
          // padding: EdgeInsets.all(10.0),
          // indicatorColor: Utils.whiteColor,
          indicatorColor: Utils.transparentColor,
          // indicatorWeight: 0.1,
          // indicatorPadding: const EdgeInsets.fromLTRB(6, 0, 6, 0),
          controller: tabController,
          tabs: [
            InkWell(
              overlayColor:
                  WidgetStatePropertyAll(Utils.whiteColor), // not working
              // hoverColor: Utils.whiteColor,
              child: Container(
                margin: EdgeInsets.only(top: 10),
                height: 55,
                width: 40,
                child: Center(
                    child: Column(
                  children: [
                    Icon(
                      currentPage == 0 ? Icons.home : Icons.home_outlined,
                      color: Colors.black,
                    ),
                    // label
                    Text(
                      'Home',
                      style: Utils.kAppPrimaryTextStyle.copyWith(
                          color: Colors.black,
                          fontSize: 12,
                          fontWeight: currentPage == 0
                              ? FontWeight.w800
                              : FontWeight.normal),
                    )
                  ],
                )),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 10),
              height: 55,
              width: 40,
              child: Center(
                  child: Column(
                children: [
                  currentPage == 1
                      ? Image(
                          image: AssetImage('assets/images/trending-bold.png'),
                          width: 24.0,
                          height: 24.0,
                        )
                      : Image(
                          image: AssetImage('assets/images/trending-light.png'),
                          width: 16.0,
                          height: 24.0,
                        ),
                  // label
                  Text(
                    'Trending',
                    style: Utils.kAppPrimaryTextStyle.copyWith(
                        color: Colors.black,
                        fontSize: 8,
                        fontWeight: currentPage == 1
                            ? FontWeight.w800
                            : FontWeight.normal),
                  )
                ],
              )),
            ),
            Container(
              margin: EdgeInsets.only(top: 10),
              height: 55,
              width: 40,
              child: Center(
                  child: Column(
                children: [
                  Icon(
                    currentPage == 2
                        ? Icons.play_circle_filled_sharp
                        : Icons.play_circle_outline_outlined,
                    color: Colors.black,
                  ),
                  // label
                  Text(
                    'Video',
                    style: Utils.kAppPrimaryTextStyle.copyWith(
                        color: Colors.black,
                        fontSize: 12,
                        fontWeight: currentPage == 2
                            ? FontWeight.w800
                            : FontWeight.normal),
                  )
                ],
              )),
            ),
            Container(
              margin: EdgeInsets.only(top: 10),
              height: 55,
              width: 40,
              child: Center(
                  child: Column(
                children: [
                  currentPage == 3
                      ? Image(
                          image: AssetImage('assets/images/search-filled.png'),
                          width: 22.0,
                          height: 24.0,
                        )
                      : Icon(
                          Icons.search_sharp,
                        ),
                  // label
                  Text(
                    'Search',
                    style: Utils.kAppPrimaryTextStyle.copyWith(
                        color: Colors.black,
                        fontSize: 10,
                        fontWeight: currentPage == 3
                            ? FontWeight.w800
                            : FontWeight.normal),
                  )
                ],
              )),
            ),
            Container(
              margin: EdgeInsets.only(top: 10),
              height: 55,
              width: 40,
              child: Center(
                  child: Column(
                children: [
                  currentPage == 4
                      ? Image(
                          image: AssetImage('assets/images/more-filled.png'),
                          width: 24.0,
                          height: 26.0,
                        )
                      : Image(
                          image: AssetImage('assets/images/more-empty.png'),
                          width: 22.0,
                          height: 26.0,
                        ),
                  // label
                  Text(
                    'More',
                    style: Utils.kAppPrimaryTextStyle.copyWith(
                        color: Colors.black,
                        fontSize: 12,
                        fontWeight: currentPage == 4
                            ? FontWeight.w800
                            : FontWeight.normal),
                  )
                ],
              )),
            ),
          ],
        ),
        */
        fit: StackFit.expand,
        barColor: Utils.lightGreyColor4,
        borderRadius: BorderRadius.circular(15),
        duration: Duration(seconds: 1),
        curve: Curves.decelerate,
        showIcon: true,
        width: MediaQuery.of(context).size.width * 0.89,
        start: 0,
        end: 10,
        offset: 10,
        barAlignment: Alignment.bottomCenter,
        // iconHeight: 35,
        // iconWidth: 35,
        reverse: false,
        hideOnScroll: true,
        scrollOpposite: false,
        onBottomBarHidden: () {},
        onBottomBarShown: () {},
        body: (context, controller) =>
            // TabBarView(controller: tabController, children: _widgetOptions));
            _widgetOptions.elementAt(_selectedIndex));
  }

/*
// Screen above safe area
  _getFloatingBottomNavBar() {
    return BottomBar(
        child: ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(30.0)),
          child: BottomNavigationBar(
            backgroundColor: Utils.lightGreyColor4,
            // fixedColor: Utils.whiteColor,
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                activeIcon: Icon(
                  Icons.home,
                  color: Colors.black,
                ),
                backgroundColor: Colors.white,
                icon: Icon(
                  Icons.home_outlined,
                  color: Colors.black,
                ),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                backgroundColor: Colors.white,
                activeIcon: Image(
                  image: AssetImage('assets/images/trending-bold.png'),
                  width: 24.0,
                  height: 24.0,
                ),
                icon: Image(
                  image: AssetImage('assets/images/trending-light.png'),
                  width: 16.0,
                  height: 24.0,
                ),
                label: 'Trending',
              ),
              BottomNavigationBarItem(
                backgroundColor: Colors.white,
                activeIcon: Icon(
                  Icons.play_circle_filled_sharp,
                  color: Colors.black,
                ),
                icon: Icon(
                  Icons.play_circle_outline,
                  color: Colors.black,
                ),
                label: 'Video',
              ),
              BottomNavigationBarItem(
                backgroundColor: Colors.white,
                activeIcon: Image(
                  image: AssetImage('assets/images/search-filled.png'),
                  width: 22.0,
                  height: 24.0,
                ),
                icon: Icon(
                  Icons.search_sharp,
                  color: Colors.black,
                ),
                label: 'Search',
              ),
              BottomNavigationBarItem(
                backgroundColor: Colors.white,
                activeIcon: Image(
                  image: AssetImage('assets/images/more-filled.png'),
                  width: 24.0,
                  height: 26.0,
                ),
                icon: Image(
                  image: AssetImage('assets/images/more-empty.png'),
                  width: 22.0,
                  height: 26.0,
                ),
                label: 'More',
              ),
            ],
            // type: BottomNavigationBarType.shifting,
            type: BottomNavigationBarType.fixed,
            currentIndex: _selectedIndex,
            // selectedIconTheme: IconThemeData(fill: 0.5),
            selectedLabelStyle: Utils.kAppPrimaryTextStyle.copyWith(
                // color: Colors.black,
                fontSize: 14.0,
                fontWeight: FontWeight.w800),
            unselectedLabelStyle: Utils.kAppPrimaryTextStyle.copyWith(
                // color: Colors.black,
                fontSize: 14.0),
            selectedItemColor: Colors.black,
            // iconSize: 25,
            onTap: _onItemTapped,
            elevation: 0.0,
          ),
        ),
        fit: StackFit.expand,
        barColor: Utils.whiteColor,
        borderRadius: BorderRadius.circular(500),
        duration: Duration(seconds: 1),
        curve: Curves.decelerate,
        showIcon: true,
        width: MediaQuery.of(context).size.width * 0.89,
        start: 2,
        end: 0,
        offset: 10,
        barAlignment: Alignment.bottomCenter,
        // iconHeight: 35,
        // iconWidth: 35,
        reverse: false,
        hideOnScroll: true,
        scrollOpposite: false,
        onBottomBarHidden: () {},
        onBottomBarShown: () {},
        body: (context, controller) =>
            // TabBarView(controller: tabController, children: _widgetOptions));
            _widgetOptions.elementAt(_selectedIndex));
  }
  */

/*
  // get bottom navigation bar
  _getBottomNavigationBar() {
    return Container(
      padding: EdgeInsets.only(bottom: 20.0),
      height: 90.0,
      // color: Colors.white.withOpacity(0.5),
      // color: const Color.fromARGB(150, 255, 255, 255),
      // color: Colors.transparent,
      // width: MediaQuery.of(context).size.width - 100, // no effect
      // decoration: BoxDecoration(color: Colors.red.withOpacity(0)
      // borderRadius: BorderRadius.all(Radius.circular(30)),
      // boxShadow: [
      //   BoxShadow(color: Colors.black38, spreadRadius: 0, blurRadius: 10),
      // ],
      // ),
      child: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(30.0)),
        child: BottomNavigationBar(
          backgroundColor: Utils.lightGreyColor4,
          // fixedColor: Utils.whiteColor,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              activeIcon: Icon(
                Icons.home,
                color: Colors.black,
              ),
              backgroundColor: Colors.white,
              icon: Icon(
                Icons.home_outlined,
                color: Colors.black,
              ),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              backgroundColor: Colors.white,
              activeIcon: Image(
                image: AssetImage('assets/images/trending-bold.png'),
                width: 24.0,
                height: 24.0,
              ),
              icon: Image(
                image: AssetImage('assets/images/trending-light.png'),
                width: 16.0,
                height: 24.0,
              ),
              label: 'Trending',
            ),
            BottomNavigationBarItem(
              backgroundColor: Colors.white,
              activeIcon: Icon(
                Icons.play_circle_filled_sharp,
                color: Colors.black,
              ),
              icon: Icon(
                Icons.play_circle_outline,
                color: Colors.black,
              ),
              label: 'Video',
            ),
            BottomNavigationBarItem(
              backgroundColor: Colors.white,
              activeIcon: Image(
                image: AssetImage('assets/images/search-filled.png'),
                width: 22.0,
                height: 24.0,
              ),
              icon: Icon(
                Icons.search_sharp,
                color: Colors.black,
              ),
              label: 'Search',
            ),
            BottomNavigationBarItem(
              backgroundColor: Colors.white,
              activeIcon: Image(
                image: AssetImage('assets/images/more-filled.png'),
                width: 24.0,
                height: 26.0,
              ),
              icon: Image(
                image: AssetImage('assets/images/more-empty.png'),
                width: 22.0,
                height: 26.0,
              ),
              label: 'More',
            ),
          ],
          // type: BottomNavigationBarType.shifting,
          type: BottomNavigationBarType.fixed,
          currentIndex: _selectedIndex,
          // selectedIconTheme: IconThemeData(fill: 0.5),
          selectedLabelStyle: Utils.kAppPrimaryTextStyle.copyWith(
              // color: Colors.black,
              fontSize: 14.0,
              fontWeight: FontWeight.w800),
          unselectedLabelStyle: Utils.kAppPrimaryTextStyle.copyWith(
              // color: Colors.black,
              fontSize: 14.0),
          selectedItemColor: Colors.black,
          // iconSize: 25,
          onTap: _onItemTapped,
          elevation: 0.0,
        ),
      ),
    );
  }
  */

  // return screen body
  // _getBody() {
  //   return HomeTab();
  // }
}
