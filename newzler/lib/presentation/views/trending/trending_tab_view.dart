import 'package:flutter/material.dart';
import 'package:newzler/configs/utils.dart';
import 'package:newzler/presentation/views/trending/full_coverage_view.dart';
import 'package:newzler/presentation/views/widgets/widgets.dart';

class TrendingTabView extends StatelessWidget {
  const TrendingTabView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Utils.getKAppPrimaryAppBar('Trending', true, null),
      backgroundColor: Utils.whiteColor,
      body: _getBody(context),
    );
  }

  _getBody(context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Column(
                children:
                    // cards of news
                    [1, 2].map((imageNumber) {
              return NewsCard(
                  newsImagePath: 'assets/images/news-${imageNumber}.png');
            }).toList()),

            // space
            const SizedBox(
              height: 20.0,
            ),

            // view more button
            CustomButton(
              primaryButton: true,
              onPressed: () {
                // push full coverage screen
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const FullCoverageView()),
                );
              },
              buttonText: 'View more',
              buttonWidth: MediaQuery.of(context).size.width - 20,
              buttonHeight: 50.0,
            ),

            // space for floating bottom bar
            const SizedBox(
                height: 90.0,
              ),
          ],
        ),
      ),
    );
  }
}
