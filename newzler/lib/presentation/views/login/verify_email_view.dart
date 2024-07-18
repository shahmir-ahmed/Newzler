import 'package:flutter/material.dart';
import 'package:newzler/configs/utils.dart';
import 'package:newzler/presentation/views/widgets/widgets.dart';
import 'package:floating_snackbar/floating_snackbar.dart';

class VerifyEmailView extends StatefulWidget {
  VerifyEmailView({required this.email, required this.backButton});

  // email
  String email;

  // back button enabled or not on signup screen
  bool backButton;

  @override
  State<VerifyEmailView> createState() => _VerifyEmailViewState();
}

class _VerifyEmailViewState extends State<VerifyEmailView> {
  // otp code
  String otp = '12345';

  final _formKey = GlobalKey<FormState>(); // form key

  final otpFieldController = TextEditingController(); // otp field controller

  // otp entered by user
  String userOTP = '';

  // loading check
  var _isLoading = false;

  // on submit button click
  void _onSubmit() {
    // set loading as true
    setState(() => _isLoading = true);
    // After 3 sec
    Future.delayed(
      const Duration(seconds: 2),
      () {
        // set loading as false
        setState(() => _isLoading = false);
        // check otp is same
        if (userOTP == otp) {
          // close screen
          Navigator.pop(context);
          // if back button enabled on signup screen
          if (widget.backButton) {
            // close signup and choose langauge screen and show home screen
            // pop pop
            Navigator.pop(context);
            Navigator.pop(context);
          } else {
            // close only signup screen
            Navigator.pop(context);
          }

          // push home screen
          // Navigator.of(context)
          //     .push(MaterialPageRoute(builder: (context) => HomeView()));

          // push add profile image screen
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => AddEditProfileImage.addImageScreen()));
        } else {
          // show floating snackbar
          floatingSnackBar(
            message: 'Please enter a valid code',
            context: context,
            textColor: Utils.whiteColor,
            duration: const Duration(milliseconds: 4000),
            backgroundColor: Colors.black,
          );
        }
      },
    );
  }

  // on resend button click
  void _onResend() {
    // set loading as true
    setState(() => _isLoading = true);
    // After 3 sec
    Future.delayed(
      const Duration(seconds: 2),
      () {
        // set loading as false
        setState(() => _isLoading = false);
        // show floating snackbar of otp sent succesfully
        floatingSnackBar(
          message: 'OTP sent successfully',
          context: context,
          textColor: Utils.whiteColor,
          duration: const Duration(milliseconds: 4000),
          backgroundColor: Colors.black,
        );
      },
    );
  }

  // clear otp field
  _clearOTPField() {
    otpFieldController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Utils.getActionAppBar(() {
        // close screen
        Navigator.pop(context);
      }, null, null, null, null),
      backgroundColor: Utils.whiteColor,
      body: _getBody(),
    );
  }

  // return screen body
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

              // text
              Text(
                'Confirm your email address',
                style: Utils.kAppPrimaryTextStyle
                    .copyWith(fontSize: 30.0, fontWeight: FontWeight.w800),
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
                        Text(
                          'CONFIRMATION CODE',
                          style: Utils.kAppPrimaryTextStyle.copyWith(
                            fontSize: 12.0,
                            fontWeight: FontWeight.w800,
                          ),
                        ),

                        // space
                        const SizedBox(
                          height: 25.0,
                        ),

                        // otp form field
                        TextFormField(
                            maxLength: 5,
                            keyboardType: TextInputType.number,
                            onChanged: (value) {
                              setState(() {
                                userOTP = value;
                              });
                            },
                            controller: otpFieldController,
                            validator: (value) {
                              if (value!.trim().isEmpty) {
                                return 'OTP is required';
                              }
                              return null;
                            },
                            style: TextStyle(
                                letterSpacing: 20.0,
                                fontWeight: FontWeight.w800,
                                color: Utils.greyColor),
                            decoration: userOTP.trim().isNotEmpty
                                ? InputDecoration(
                                    suffixIcon: IconButton(
                                    icon: Icon(
                                      Icons.cancel_outlined,
                                      color: Utils.lightGreyColor2,
                                      size: 25.0,
                                    ),
                                    onPressed: () {
                                      // Update the state i.e. toogle the state of passwordVisible variable
                                      // setState(() {
                                      _clearOTPField();
                                      setState(() {
                                        userOTP = '';
                                      });
                                      // });
                                    },
                                  ))
                                : null),

                        // space
                        const SizedBox(
                          height: 25.0,
                        ),

                        // instructions text
                        Text(
                          'Please check your email ${widget.email} to confirm your registration',
                          style: Utils.kAppPrimaryTextStyle.copyWith(
                              fontSize: 14.0, color: Utils.lightGreyColor2),
                        ),

                        // space
                        const SizedBox(
                          height: 30.0,
                        ),

                        // continue button
                        CustomButton(
                            primaryButton: true,
                            onPressed: () {
                              // if form is valid
                              if (_formKey.currentState!.validate()) {
                                // show loading on button
                                _isLoading ? null : _onSubmit();
                              }
                            },
                            buttonText: _isLoading == false ? 'Continue' : null,
                            buttonWidth: MediaQuery.of(context).size.width,
                            buttonHeight: 65.0,
                            child: _isLoading
                                ? Container(
                                    width: 35,
                                    height: 35,
                                    padding: const EdgeInsets.all(2.0),
                                    child: CircularProgressIndicator(
                                      backgroundColor: Utils.greyColor,
                                      color: Colors.white,
                                      strokeWidth: 4,
                                    ),
                                  )
                                : null),

                        // space
                        const SizedBox(
                          height: 20.0,
                        ),

                        // secondary button
                        CustomButton(
                            secondaryButton: true,
                            onPressed: () {
                              _onResend();
                            },
                            buttonText: _isLoading == false ? 'Resend' : null,
                            buttonWidth: MediaQuery.of(context).size.width,
                            buttonHeight: 65.0,
                            child: _isLoading
                                ? Container(
                                    width: 35,
                                    height: 35,
                                    padding: const EdgeInsets.all(2.0),
                                    child: CircularProgressIndicator(
                                      backgroundColor: Utils.lightGreyColor2,
                                      color: Utils.kAppPrimaryColor,
                                      strokeWidth: 4,
                                    ),
                                  )
                                : null)
                      ]))
            ])));
  }
}
