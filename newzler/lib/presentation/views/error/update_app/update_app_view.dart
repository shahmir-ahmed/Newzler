import 'package:flutter/material.dart';
import 'package:newzler/configs/utils.dart';
import 'package:newzler/presentation/views/widgets/widgets.dart';

class UpdateAppView extends StatelessWidget {
  const UpdateAppView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Utils.whiteColor,
      body: _getBody(context),
    );
  }

  _getBody(context) {
    return Column(
      children: [
        BannerImageText(
          bannerImagePath: 'assets/images/error-banner.png',
          headingText: 'Update your app',
          subText:
              'An update is available with new features, a faster experience, fixes and more. It typically takes less then minute.',
        ),
        // space
        const SizedBox(
          height: 80.0,
        ),
        Padding(
          padding:
              const EdgeInsets.symmetric(vertical: 0.0, horizontal: 30.0),
          child: CombinedButtons(
            onPrimaryButtonPressed: () {},
            onSecondaryButtonPressed: () {
              // close screen
              Navigator.pop(context);
            },
            primaryButtonText: 'Update',
            secondaryButtonText: 'Close',
            oppositePosition: true,
          ),
        )
      ],
    );
  }
}
