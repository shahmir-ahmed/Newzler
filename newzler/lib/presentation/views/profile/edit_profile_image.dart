import 'package:flutter/material.dart';
import 'package:newzler/configs/utils.dart';
import 'package:newzler/presentation/views/widgets/widgets.dart';

class EditProfileImage extends StatelessWidget {
  const EditProfileImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Utils.getKAppPrimaryAppBar('', false, null),
      backgroundColor: Utils.whiteColor,
      body: _getBody(context),
    );
  }

  _getBody(context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // text
          Text(
            'How you will appear?',
            style: Utils.kAppPrimaryTextStyle.copyWith(fontSize: 34),
          ),

          // space
          SizedBox(
            height: 90.0,
          ),

          // image
          Center(
              child: SizedBox(
            width: 130,
            height: 130,
            child: Stack(children: [
              Image(
                image: AssetImage('assets/images/user-image.png'),
                width: 132,
                height: 132,
              ),

              // edit icon
              Align(
                  alignment: Alignment.bottomRight,
                  child: CircleAvatar(
                      radius: 15,
                      backgroundColor: Utils.whiteColor,
                      foregroundImage:
                          AssetImage('assets/images/tabler_edit.png')))
            ]),
          )),

          // space
          SizedBox(
            height: 90.0,
          ),

          // primary button update
          Center(
            child: CustomButton(
              onPressed: () {},
              primaryButton: true,
              buttonText: 'Update',
              buttonHeight: 70,
              buttonWidth: MediaQuery.of(context).size.width,
            ),
          ),

          // space
          SizedBox(
            height: 20.0,
          ),

          // secondary button remove
          Center(
            child: CustomButton(
              onPressed: () {},
              secondaryButton: true,
              buttonText: 'Remove',
              buttonHeight: 70,
              buttonWidth: MediaQuery.of(context).size.width,
            ),
          )
        ],
      ),
    );
  }
}
