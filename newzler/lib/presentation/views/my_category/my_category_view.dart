import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:newzler/configs/utils.dart';

class MyCategoryView extends StatefulWidget {
  const MyCategoryView({super.key});

  @override
  State<MyCategoryView> createState() => _MyCategoryViewState();
}

class _MyCategoryViewState extends State<MyCategoryView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Utils.getKAppPrimaryAppBar('My category', true, null),
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
      // space
      SizedBox(height: 20.0,),
      // text heading
      Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Text(
              'Customize “My news” category',
              style: Utils.kAppPrimaryTextStyle
                  .copyWith(fontWeight: FontWeight.w800, fontSize: 15.0),
            ),
            // space
      SizedBox(height: 20.0,),
        // grid category items
        GridView.count(crossAxisCount: 7, children: [
          Container(
            color: Utils.lightBlueColor,
            padding: EdgeInsets.all(10.0),
            child: Row(
              children: [
                // icon
                

                // text

                // star
              ],
            ),
          )
        ],)
          ],
        ),
      )

    ]));
  }
}
