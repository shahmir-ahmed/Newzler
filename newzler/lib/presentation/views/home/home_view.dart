import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:newzler/configs/utils.dart';
import 'package:newzler/presentation/views/home/widgets/home_tab.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  // bottom navigation bar att.
  int _selectedIndex = 0;
  static const List<Widget> _widgetOptions = <Widget>[
    HomeTab(),
    SafeArea(
      child: Text('Trending Screen',
          style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold)),
    ),
    SafeArea(
      child: Text('Video Screen',
          style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold)),
    ),
    SafeArea(
      child: Text('Search Screen',
          style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold)),
    ),
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
      height: 80.0,
      decoration: BoxDecoration(
        // borderRadius: BorderRadius.all(Radius.circular(30)),
        boxShadow: [
          BoxShadow(color: Colors.black38, spreadRadius: 0, blurRadius: 10),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(30.0)),
        child: BottomNavigationBar(
          backgroundColor: Utils.whiteColor,
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
              icon: Icon(
                Icons.trending_up_rounded,
                color: Colors.black,
              ),
              label: 'Trending',
            ),
            BottomNavigationBarItem(
              backgroundColor: Colors.white,
              icon: Icon(
                Icons.play_circle_outline,
                color: Colors.black,
              ),
              label: 'Video',
            ),
            BottomNavigationBarItem(
              backgroundColor: Colors.white,
              icon: Icon(
                Icons.search_sharp,
                color: Colors.black,
              ),
              label: 'Search',
            ),
            BottomNavigationBarItem(
              backgroundColor: Colors.white,
              icon: Icon(
                Icons.more_horiz,
                color: Colors.black,
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
          unselectedLabelStyle: Utils.kAppPrimaryTextStyle
              .copyWith(color: Colors.black, fontSize: 14.0),
          iconSize: 30,
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
