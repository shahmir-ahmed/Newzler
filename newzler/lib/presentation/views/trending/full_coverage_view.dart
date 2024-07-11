import 'package:flutter/material.dart';
import 'package:newzler/configs/utils.dart';
import 'package:newzler/presentation/views/widgets/widgets.dart';

class FullCoverageView extends StatelessWidget {
  const FullCoverageView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Utils.getKAppPrimaryAppBar('Full coverage', true, null),
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
                    [1, 2, 3, 4].map((imageNumber) {
              return NewsCard(
                  newsImagePath: 'assets/images/news-${imageNumber}.png');
              // newsImagePath: (imageNumber == 3 || imageNumber == 4)
              //     ? 'assets/images/news-${imageNumber}.jpg'
              //     : 'assets/images/news-${imageNumber}.png');
            }).toList()),
          ],
        ),
      ),
    );
  }
}
