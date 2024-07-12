import 'package:flutter/material.dart';
import 'package:newzler/configs/utils.dart';
import 'package:newzler/presentation/views/widgets/widgets.dart';

class EditMobileNumberView extends StatelessWidget {
  const EditMobileNumberView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Utils.getActionAppBar(() {
        Navigator.pop(context);
      }, null, null, null, null),
      backgroundColor: Utils.whiteColor,
      body: _getBody(context),
    );
  }

  _getBody(context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20.0, 40, 20, 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // title
          Text(
            'Your mobile number',
            style: Utils.kAppPrimaryTextStyle.copyWith(fontSize: 32),
          ),

          // space
          SizedBox(
            height: 30.0,
          ),

          // name label
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'YOUR MOBILE NUMBER',
                  style: Utils.kAppPrimaryTextStyle
                      .copyWith(fontSize: 12.0, fontWeight: FontWeight.w800),
                ),
                // space
                SizedBox(
                  height: 10.0,
                ),

                // email form field
                Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        keyboardType: TextInputType.phone,
                        initialValue: '+91',
                        style: Utils.kAppPrimaryTextStyle,
                      ),
                    ),
                    VerticalDivider(
                      color: Colors.black,
                      width: 4.0,
                    ),
                    Expanded(
                      flex: 6,
                      child: TextFormField(
                        keyboardType: TextInputType.number,
                        initialValue: '1234567890',
                        style: Utils.kAppPrimaryTextStyle,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          // space
          SizedBox(
            height: 20.0,
          ),

          // primary button update
          Center(
            child: CustomButton(
              onPressed: () {
                Navigator.pop(context);
              },
              buttonHeight: 60,
              buttonWidth: MediaQuery.of(context).size.width - 80,
              buttonText: 'Update',
              primaryButton: true,
            ),
          )
        ],
      ),
    );
  }
}
