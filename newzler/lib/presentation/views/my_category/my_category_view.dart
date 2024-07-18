import 'package:flutter/material.dart';
import 'package:newzler/configs/utils.dart';
import 'package:newzler/presentation/views/widgets/widgets.dart';

class MyCategoryView extends StatefulWidget {
  const MyCategoryView({super.key});

  @override
  State<MyCategoryView> createState() => _MyCategoryViewState();
}

class _MyCategoryViewState extends State<MyCategoryView> {
  // grid list items
  var categories = [
    {
      'icon': 'assets/images/tabler_category_icon.png',
      'category': 'All',
      'starred': false
    },
    {
      'icon': 'assets/images/weather-icon.png',
      'category': 'Weather',
      'starred': false
    },
    {
      'icon': 'assets/images/business-icon.png',
      'category': 'Business',
      'starred': true
    },
    {
      'icon': 'assets/images/entmt-icon.png',
      'category': 'Entmt',
      'starred': false
    },
    {
      'icon': 'assets/images/checkmark-icon.png',
      'category': 'General',
      'starred': false
    },
    {
      'icon': 'assets/images/health-icon.png',
      'category': 'Health',
      'starred': false
    },
    {
      'icon': 'assets/images/lifestyle-icon.png',
      'category': 'Lifestyle',
      'starred': false
    },
    {
      'icon': 'assets/images/science-icon.png',
      'category': 'Science',
      'starred': false
    },
    {
      'icon': 'assets/images/sports-icon.png',
      'category': 'Sports',
      'starred': false
    },
    {
      'icon': 'assets/images/technology-icon.png',
      'category': 'Tech',
      'starred': false
    },
    {
      'icon': 'assets/images/world-icon.png',
      'category': 'World',
      'starred': false
    },
    {
      'icon': 'assets/images/food-icon.png',
      'category': 'Food',
      'starred': false
    },
    {
      'icon': 'assets/images/travel-icon.png',
      'category': 'Travel',
      'starred': false
    },
    {
      'icon': 'assets/images/gaming-icon.png',
      'category': 'Gaming',
      'starred': false
    },
    {
      'icon': 'assets/images/agriculture-icon.png',
      'category': 'Agriculture',
      'starred': false
    },
    {
      'icon': 'assets/images/random-icon.png',
      'category': 'Weird',
      'starred': false
    },
  ];

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
        // height: MediaQuery.of(context).size.height,
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      // divider
      Divider(
        height: 1.0,
        color: Utils.lightGreyColor4,
      ),
      // space
      const SizedBox(
        height: 20.0,
      ),
      // text heading
      Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Customize “My news” category',
              style: Utils.kAppPrimaryTextStyle
                  .copyWith(fontWeight: FontWeight.w800, fontSize: 15.0),
            ),
            // space
            const SizedBox(
              height: 20.0,
            ),
            // grid category items
            SizedBox(
              // color: Colors.amber,
              height: MediaQuery.of(context).size.height - 250,
              child: GridView.count(
                  shrinkWrap: true,
                  crossAxisCount: 2,
                  mainAxisSpacing: 15.0,
                  crossAxisSpacing: 15.0,
                  childAspectRatio: (1 / .35),
                  children:
                      // [
                      categories.map((categoryMap) {
                    return GestureDetector(
                        onTap: () {
                          // change value
                          setState(() {
                            categoryMap['starred'] =
                                categoryMap['starred'] == true ? false : true;
                          });
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              color: Utils.lightBlueColor,
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(10.0))),
                          // height: 20.0,
                          padding: const EdgeInsets.all(10.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              // image icon
                              Image(
                                image:
                                    AssetImage(categoryMap['icon'] as String),
                                // AssetImage(
                                //     'assets/images/tabler_category_icon.png'),
                                width: 22,
                                height: 22,
                              ),

                              // text
                              Text(
                                categoryMap['category'] as String,
                                // 'All',
                                style: Utils.kAppPrimaryTextStyle
                                    .copyWith(fontSize: 16),
                              ),

                              // star
                              categoryMap['starred'] as bool
                                  ? Icon(
                                      Icons.star,
                                      color: Utils.kAppPrimaryColor,
                                      size: 24,
                                    )
                                  : const Icon(
                                      Icons.star_outline,
                                      size: 24,
                                    ),
                            ],
                          ),
                        ));
                    // ]
                  }).toList()),
            ),

            // space
            const SizedBox(
              height: 10.0,
            ),

            // button load more primary
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomButton(
                  onPressed: () {},
                  primaryButton: true,
                  buttonText: 'Load more',
                  buttonHeight: 60,
                  buttonWidth: 150,
                ),
              ],
            )
          ],
        ),
      )
    ]));
  }
}
