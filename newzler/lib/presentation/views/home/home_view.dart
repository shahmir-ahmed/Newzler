import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:newzler/configs/utils.dart';
import 'package:newzler/presentation/views/home/widgets/home_tab_view.dart';
import 'package:newzler/presentation/views/search/search_view.dart';
import 'package:newzler/presentation/views/trending/trending_tab_view.dart';
import 'package:newzler/presentation/views/video/video_tab_view.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  // bottom navigation bar att.
  int _selectedIndex = 0;
  static final List<Widget> _widgetOptions = <Widget>[
    HomeTab(),
    TrendingTabView(),
    VideoTabView(),
    SearchView(),
    SafeArea(
      child: Text('More Screen',
          style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold)),
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    // widget tree
    return Scaffold(
      backgroundColor: Utils.whiteColor,
      // body: _getBody(),
      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: _getBottomNavigationBar(),
    );
  }

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

  // return screen body
  // _getBody() {
  //   return HomeTab();
  // }
}
