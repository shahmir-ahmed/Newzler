import 'package:flutter/material.dart';
import 'package:newzler/configs/utils.dart';
import 'package:newzler/presentation/views/forgot_username_password/widgets/forgot_username_password_view.dart';
import 'package:newzler/presentation/views/home/home_view.dart';
import 'package:newzler/presentation/views/widgets/widgets.dart';

class LoginView extends StatefulWidget {
  LoginView({required this.changeScreenMethod, required this.backButton});

  VoidCallback changeScreenMethod;
  bool backButton;

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  bool _passwordVisible = false;

  final _formKey = GlobalKey<FormState>();

  // pop screen and push main screen
  popAndPushMainScreen() {
    // pop
    // Navigator.pop(context);

    // push
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _passwordVisible = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Utils.getActionAppBar(widget.backButton
              ? () {
                  // on back pressed
                  Navigator.pop(context);
                }
              : null, () {
        if (widget.backButton) {
          // close login and choose langauge screen and show home screen
          // pop pop
          Navigator.pop(context);
          Navigator.pop(context);
        } else {
          // clos only login screen
          Navigator.pop(context);
        }

        // push
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => const HomeView()));
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // space
            const SizedBox(
              height: 10.0,
            ),

            // login text
            Text(
              'Login',
              style: Utils.kAppPrimaryTextStyle
                  .copyWith(fontSize: 30.0, fontWeight: FontWeight.w800),
            ),

            // space
            const SizedBox(
              height: 30.0,
            ),

            // instructions text
            Text(
              'Using your email or username and password',
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
                    // email/username label
                    Text(
                      'YOUR EMAIL/USERNAME',
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
                          return 'Email/username is required';
                        }
                        return null;
                      },
                      style: Utils.kAppPrimaryTextStyle,
                    ),

                    // space
                    const SizedBox(
                      height: 45.0,
                    ),

                    // password label
                    Text(
                      'YOUR PASSWORD',
                      style: Utils.kAppPrimaryTextStyle.copyWith(
                          fontSize: 12.0, fontWeight: FontWeight.w800),
                    ),

                    // space
                    const SizedBox(
                      height: 10.0,
                    ),

                    // password form field
                    TextFormField(
                      keyboardType: TextInputType.text,
                      obscureText:
                          !_passwordVisible, //This will obscure text dynamically
                      decoration: InputDecoration(
                        // Here is key idea
                        suffixIcon: IconButton(
                          icon: Icon(
                            // Based on passwordVisible state choose the icon
                            _passwordVisible
                                ? Icons.visibility_outlined
                                : Icons.visibility_off_outlined,
                            color: Utils.lightGreyColor2,
                            size: 25.0,
                          ),
                          onPressed: () {
                            // Update the state i.e. toogle the state of passwordVisible variable
                            setState(() {
                              _passwordVisible = !_passwordVisible;
                            });
                          },
                        ),
                      ),
                      validator: (value) {
                        if (value!.trim().isEmpty) {
                          return 'Password is required';
                        }
                        return null;
                      },
                      style: Utils.kAppPrimaryTextStyle,
                    ),

                    // space
                    const SizedBox(
                      height: 40.0,
                    ),

                    // login button
                    CustomButton(
                      primaryButton: true,
                      onPressed: () {
                        // if form is valid
                        if (_formKey.currentState!.validate()) {
                          if (widget.backButton) {
                            // close login and choose langauge screen and show home screen
                            // pop pop
                            Navigator.pop(context);
                            Navigator.pop(context);
                          } else {
                            // close only login screen
                            Navigator.pop(context);
                          }

                          // push home screen
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => const HomeView()));
                        }
                      },
                      buttonText: 'Login',
                      buttonWidth: MediaQuery.of(context).size.width,
                      buttonHeight: 65.0,
                    )
                  ],
                )),
            // space
            const SizedBox(
              height: 100.0,
            ),
            // text button column
            Column(
              children: [
                // forgot password text button
                GestureDetector(
                  onTap: () {
                    // show forgot password screen
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => ForgotUsernamePasswordView(
                            forUsernameScreen: false)));
                  },
                  child: Text('Forgot your password?',
                      style: Utils.kAppPrimaryTextStyle.copyWith(
                        fontSize: 14.0,
                        fontWeight: FontWeight.w800,
                      )),
                ),
                // space
                const SizedBox(
                  height: 20.0,
                ),
                // forgot username text button
                GestureDetector(
                  onTap: () {
                    // show forgot username screen
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => ForgotUsernamePasswordView(
                            forUsernameScreen: true)));
                  },
                  child: Text(
                    'Forgot your username?',
                    style: Utils.kAppPrimaryTextStyle.copyWith(
                      fontSize: 14.0,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ),
                // space
                const SizedBox(
                  height: 20.0,
                ),
                // signup button
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Don\'t have and account?',
                      style: Utils.kAppPrimaryTextStyle.copyWith(
                        fontSize: 14.0,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    // space
                    const SizedBox(
                      width: 5.0,
                    ),
                    GestureDetector(
                      onTap: widget.changeScreenMethod,
                      child: Text(
                        'Sign up',
                        style: Utils.kAppPrimaryTextStyle.copyWith(
                          color: Utils.kAppPrimaryColor,
                          fontSize: 14.0,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
