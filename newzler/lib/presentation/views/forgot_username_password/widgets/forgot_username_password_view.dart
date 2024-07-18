import 'package:flutter/material.dart';
import 'package:newzler/configs/utils.dart';
import 'package:newzler/presentation/views/widgets/widgets.dart';

class ForgotUsernamePasswordView extends StatefulWidget {
  ForgotUsernamePasswordView({required this.forUsernameScreen});

  bool forUsernameScreen;

  @override
  State<ForgotUsernamePasswordView> createState() =>
      _ForgotUsernamePasswordViewState();
}

class _ForgotUsernamePasswordViewState
    extends State<ForgotUsernamePasswordView> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Utils.getActionAppBar(() {
        // on back pressed
        Navigator.pop(context);
      }, () {
        // close forgot, login and choose langauge screen and show home screen
        // pop pop
        // Navigator.pop(context);
        // Navigator.pop(context);
        // Navigator.pop(context);

        // push
      }, null, null, null),
      backgroundColor: Utils.whiteColor,
      body: _getBody(),
    );
  }

  // get screen body
  _getBody() {
    return SingleChildScrollView(
        child: Padding(
            padding: const EdgeInsets.all(30.0),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              // space
              const SizedBox(
                height: 10.0,
              ),

              // login text
              Text(
                widget.forUsernameScreen ? 'Forgot your username' : 'Forgot your password' ,
                style: Utils.kAppPrimaryTextStyle
                    .copyWith(fontSize: 30.0, fontWeight: FontWeight.w800),
              ),

              // space
              const SizedBox(
                height: 30.0,
              ),

              // instructions text
              Text(
                'Give your email address you used during registration',
                style: Utils.kAppPrimaryTextStyle
                    .copyWith(fontSize: 14.0, color: Utils.lightGreyColor2),
              ),

              // space
              const SizedBox(
                height: 30.0,
              ),

              // form
              Form(
                  key: _formKey,
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // email label
                        Text(
                          'YOUR EMAIL',
                          style: Utils.kAppPrimaryTextStyle.copyWith(
                              fontSize: 12.0, fontWeight: FontWeight.w800),
                        ),

                        // space
                        const SizedBox(
                          height: 10.0,
                        ),

                        // email form field
                        TextFormField(
                          validator: (value) {
                            if (value!.trim().isEmpty) {
                              return 'Email is required';
                            }
                            return null;
                          },
                          style: Utils.kAppPrimaryTextStyle,
                        ),

                        // space
                        const SizedBox(
                          height: 40.0,
                        ),

                        // recover button
                        CustomButton(
                          primaryButton: true,
                          onPressed: () {
                            // if form is valid
                            if (_formKey.currentState!.validate()) {
                              // recover username/password
                            }
                          },
                          buttonText: 'Recover',
                          buttonWidth: MediaQuery.of(context).size.width,
                          buttonHeight: 65.0,
                          icon: const Icon(Icons.restore_page_outlined),
                        )
                      ]))
            ])));
  }
}
