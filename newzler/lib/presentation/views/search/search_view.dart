import 'package:flutter/material.dart';
import 'package:newzler/configs/utils.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Utils.getKAppSearchAppBar(),
      backgroundColor: Utils.whiteColor,
      body: _getBody(context),
    );
  }

  _getBody(context) {
    return SingleChildScrollView(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      // divider
      Divider(
        height: 1.0,
        color: Utils.lightGreyColor4,
      ),

      Padding(
        padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 30.0),
        child: Column(
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // text
                Text(
                  'Recent Searches',
                  style: Utils.kAppPrimaryTextStyle
                      .copyWith(fontWeight: FontWeight.w800),
                ),
                // delete button
                Image(
                  image: AssetImage('assets/images/delete-icon.png'),
                  width: 24.0,
                  height: 24.0,
                ),
              ],
            ),

            // space
            SizedBox(
              height: 20.0,
            ),

            // row
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                  children:
                      // texts
                      ['Biden', 'Anderson Cooper', 'Trump'].map((name) {
                return Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(5.0)),
                      color: Utils.lightGreyColor4,
                    ),
                    margin: EdgeInsets.only(right: 25.0),
                    padding:
                        EdgeInsets.symmetric(vertical: 5.0, horizontal: 15.0),
                    child: Text(
                      name,
                      style: Utils.kAppPrimaryTextStyle.copyWith(
                          color: Utils.kAppPrimaryColor,
                          fontSize: 12.0,
                          fontWeight: FontWeight.w800),
                    ));
              }).toList()),
            ),

            // space
            SizedBox(
              height: 50.0,
            ),

            // text
            Row(
              children: [
                // icon
                Image(
                  image: AssetImage('assets/images/trending-light.png'),
                  width: 26.0,
                  height: 26.0,
                ),

                // space
                SizedBox(
                  width: 10.0,
                ),

                // text
                Text(
                  'Trending',
                  style: Utils.kAppPrimaryTextStyle
                      .copyWith(fontWeight: FontWeight.w800),
                )
              ],
            ),

            // space
            SizedBox(
              height: 20.0,
            ),

            // column
            Column(
                children:
                    ['Anbazhangan', 'Chanels', 'Malayalam'].map((trendingName) {
              return Container(
                margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 0.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      trendingName,
                      style: Utils.kAppPrimaryTextStyle
                          .copyWith(fontWeight: FontWeight.w800),
                    ),
                    Text(
                      '|',
                      style: TextStyle(
                          color: Utils.lightGreyColor3, fontSize: 20.0),
                    ),
                    Text(
                      trendingName,
                      style: Utils.kAppPrimaryTextStyle
                          .copyWith(fontWeight: FontWeight.w800),
                    ),
                  ],
                ),
              );
            }).toList())
          ],
        ),
      )
    ]));
  }
}
