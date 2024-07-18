import 'package:flutter/material.dart';
import 'package:newzler/configs/utils.dart';
import 'package:newzler/presentation/views/home/home_view.dart';
import 'package:newzler/presentation/views/login/verify_email_view.dart';
import 'package:newzler/presentation/views/widgets/widgets.dart';

class SignupView extends StatefulWidget {
  SignupView({required this.changeScreenMethod, required this.backButton});

  VoidCallback changeScreenMethod;
  bool backButton;

  @override
  State<SignupView> createState() => _SignupViewState();
}

class _SignupViewState extends State<SignupView> {
  final _formKey = GlobalKey<FormState>();

  bool _passwordVisible = false;

  bool checked = false;

  bool showCheckBoxError = false;

  String userEmail = '';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _passwordVisible = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Utils.getActionAppBar(
          widget.backButton
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
          // close only signup screen
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
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              // space
              const SizedBox(
                height: 10.0,
              ),

              // login text
              Text(
                'Sign Up',
                style: Utils.kAppPrimaryTextStyle
                    .copyWith(fontSize: 30.0, fontWeight: FontWeight.w800),
              ),

              // space
              const SizedBox(
                height: 30.0,
              ),

              // instructions text
              Text(
                'Create your newzler account',
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
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  // first name label
                                  Text(
                                    'YOUR FIRST NAME',
                                    style: Utils.kAppPrimaryTextStyle.copyWith(
                                      fontSize: 12.0,
                                      fontWeight: FontWeight.w800,
                                    ),
                                  ),

                                  // space
                                  const SizedBox(
                                    height: 10.0,
                                  ),

                                  // first name form field
                                  TextFormField(
                                    textCapitalization:
                                        TextCapitalization.words,
                                    validator: (value) {
                                      if (value!.trim().isEmpty) {
                                        return 'First name is required';
                                      }
                                      return null;
                                    },
                                    style: Utils.kAppPrimaryTextStyle,
                                  ),
                                ],
                              ),
                            ),

                            // space
                            const SizedBox(
                              width: 25.0,
                            ),

                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  // last name label
                                  Text(
                                    'YOUR LAST NAME',
                                    style: Utils.kAppPrimaryTextStyle.copyWith(
                                      fontSize: 12.0,
                                      fontWeight: FontWeight.w800,
                                    ),
                                  ),

                                  // space
                                  const SizedBox(
                                    height: 10.0,
                                  ),

                                  // last name form field
                                  TextFormField(
                                    textCapitalization:
                                        TextCapitalization.words,
                                    validator: (value) {
                                      if (value!.trim().isEmpty) {
                                        return 'Last name is required';
                                      }
                                      return null;
                                    },
                                    style: Utils.kAppPrimaryTextStyle,
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),

                        // space
                        const SizedBox(
                          height: 45.0,
                        ),

                        // username label
                        Text(
                          'CHOOSE YOUR USERNAME',
                          style: Utils.kAppPrimaryTextStyle.copyWith(
                            fontSize: 12.0,
                            fontWeight: FontWeight.w800,
                          ),
                        ),

                        // space
                        const SizedBox(
                          height: 10.0,
                        ),

                        // username form field
                        TextFormField(
                          validator: (value) {
                            if (value!.trim().isEmpty) {
                              return 'Username is required';
                            }
                            return null;
                          },
                          style: Utils.kAppPrimaryTextStyle,
                        ),

                        // space
                        const SizedBox(
                          height: 45.0,
                        ),

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
                          keyboardType: TextInputType.emailAddress,
                          onChanged: (value) {
                            setState(() {
                              userEmail = value;
                            });
                          },
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
                          height: 45.0,
                        ),

                        // check box and text row
                        Row(
                          children: [
                            // checkbox
                            Checkbox(
                                checkColor: Utils.whiteColor,
                                activeColor: Utils.kAppPrimaryColor,
                                value: checked,
                                onChanged: (newValue) {
                                  setState(() {
                                    checked = newValue!;
                                  });
                                }),
                            // space
                            const SizedBox(
                              width: 2.0,
                            ),

                            Expanded(
                              child: Text(
                                'I agree to the Newzler Terms of Service and Privacy Policy',
                                style: Utils.kAppPrimaryTextStyle.copyWith(
                                    color: Utils.lightGreyColor2,
                                    fontSize: 12.0),
                              ),
                            )
                          ],
                        ),

                        showCheckBoxError
                            ? const Text(
                                'Required',
                                style: TextStyle(
                                    color: Color.fromARGB(255, 183, 29, 18)),
                              )
                            : const SizedBox(),

                        // space
                        const SizedBox(
                          height: 40.0,
                        ),

                        // signup button
                        CustomButton(
                          primaryButton: true,
                          onPressed: () {
                            // if check box is not checked
                            if (!checked) {
                              setState(() {
                                showCheckBoxError = true;
                              });
                            } else {
                              setState(() {
                                showCheckBoxError = false;
                              });
                            }
                            // if form is valid
                            if (_formKey.currentState!.validate()) {
                              /*
                              if (widget.backButton) {
                                // close signup and choose langauge screen and show home screen
                                // pop pop
                                Navigator.pop(context);
                                Navigator.pop(context);
                              } else {
                                // close only signup screen
                                Navigator.pop(context);
                              }
                              */

                              // push home screen
                              // Navigator.of(context).push(MaterialPageRoute(
                              //     builder: (context) => HomeView()));
                              // push verify email screen
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) =>
                                      VerifyEmailView(email: userEmail, backButton: widget.backButton)));
                            }
                          },
                          buttonText: 'Sign Up',
                          buttonWidth: MediaQuery.of(context).size.width,
                          buttonHeight: 65.0,
                        ),

                        // space
                        const SizedBox(
                          height: 30.0,
                        ),
                        // signup button
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Already have an account?',
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
                                'Login',
                                style: Utils.kAppPrimaryTextStyle.copyWith(
                                  color: Utils.kAppPrimaryColor,
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.w800,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ]))
            ])));
  }
}
