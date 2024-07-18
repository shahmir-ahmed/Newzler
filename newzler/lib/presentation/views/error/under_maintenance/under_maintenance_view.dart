import 'package:flutter/material.dart';
import 'package:newzler/configs/utils.dart';
import 'package:newzler/presentation/views/widgets/widgets.dart';

class UnderMaintenanceView extends StatelessWidget {
  const UnderMaintenanceView({super.key});

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
          headingText: 'Newzler in Maintenance',
          subText: 'We apologize for any inconvenience. We will be right back',
          smallWidthSubText: true,
        ),
        // space
        const SizedBox(
          height: 80.0,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 30.0),
          child: CombinedButtons(
            onPrimaryButtonPressed: (){
              // close screen
              Navigator.pop(context);
            },
            primaryButtonText: 'Close',
            onlyPrimaryButton: true,
          ),
        )
      ],
    );
  }
}
