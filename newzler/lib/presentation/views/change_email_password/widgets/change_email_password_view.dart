import 'package:flutter/material.dart';
import 'package:newzler/configs/utils.dart';
import 'package:newzler/presentation/views/widgets/widgets.dart';

class ChangeEmailPasswordView extends StatefulWidget {
  ChangeEmailPasswordView({required this.heading});

  String heading = '';

  @override
  State<ChangeEmailPasswordView> createState() =>
      _ChangeEmailPasswordViewState();
}

class _ChangeEmailPasswordViewState extends State<ChangeEmailPasswordView> {
  final _formKey = GlobalKey<FormState>();

  bool _passwordVisible = false;
  bool _newPasswordVisible = false;
  bool _confirmNewPasswordVisible = false;

  String currentPassword = '';
  String newPassword = '';
  String confirmNewPassword = '';

  String userEmail = '';
  String confirmUserEmail = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Utils.getActionAppBar(() {
        Navigator.pop(context);
      }, () {}, null, null, null),
      backgroundColor: Utils.whiteColor,
      body: _getBody(),
    );
  }

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

            // heading text
            Text(
              widget.heading,
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
                      // password label
                      Text(
                        'YOUR CURRENT PASSWORD',
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
                        onChanged: (value) {
                          setState(() {
                            currentPassword = value;
                          });
                        },
                        validator: (value) {
                          if (value!.trim().isEmpty) {
                            return 'Current password is required';
                          }
                          return null;
                        },
                        style: Utils.kAppPrimaryTextStyle,
                      ),

                      // space
                      const SizedBox(
                        height: 45.0,
                      ),

                      widget.heading.contains('password')
                          ?
                          // change password screen view
                          Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // label
                                Text(
                                  'YOUR NEW PASSWORD',
                                  style: Utils.kAppPrimaryTextStyle.copyWith(
                                      fontSize: 12.0,
                                      fontWeight: FontWeight.w800),
                                ),
                                // space
                                const SizedBox(
                                  height: 10.0,
                                ),

                                // password form field
                                TextFormField(
                                  keyboardType: TextInputType.text,
                                  obscureText:
                                      !_newPasswordVisible, //This will obscure text dynamically
                                  decoration: InputDecoration(
                                    // Here is key idea
                                    suffixIcon: IconButton(
                                      icon: Icon(
                                        // Based on passwordVisible state choose the icon
                                        _newPasswordVisible
                                            ? Icons.visibility_outlined
                                            : Icons.visibility_off_outlined,
                                        color: Utils.lightGreyColor2,
                                        size: 25.0,
                                      ),
                                      onPressed: () {
                                        // Update the state i.e. toogle the state of passwordVisible variable
                                        setState(() {
                                          _newPasswordVisible =
                                              !_newPasswordVisible;
                                        });
                                      },
                                    ),
                                  ),
                                  onChanged: (value) {
                                    setState(() {
                                      newPassword = value;
                                    });
                                  },
                                  validator: (value) {
                                    if (value!.trim().isEmpty) {
                                      return 'New password is required';
                                    } else if (newPassword !=
                                        confirmNewPassword) {
                                      return 'Both passwords must be same';
                                    } else if (newPassword == currentPassword) {
                                      return 'New password must be different from current password';
                                    }
                                    return null;
                                  },
                                  style: Utils.kAppPrimaryTextStyle,
                                ),

                                // space
                                const SizedBox(
                                  height: 45.0,
                                ),

                                // label
                                Text(
                                  'CONFIRM YOUR NEW PASSWORD',
                                  style: Utils.kAppPrimaryTextStyle.copyWith(
                                      fontSize: 12.0,
                                      fontWeight: FontWeight.w800),
                                ),

                                // space
                                const SizedBox(
                                  height: 10.0,
                                ),

                                // password form field
                                TextFormField(
                                  keyboardType: TextInputType.text,
                                  obscureText:
                                      !_confirmNewPasswordVisible, //This will obscure text dynamically
                                  decoration: InputDecoration(
                                    // Here is key idea
                                    suffixIcon: IconButton(
                                      icon: Icon(
                                        // Based on passwordVisible state choose the icon
                                        _confirmNewPasswordVisible
                                            ? Icons.visibility_outlined
                                            : Icons.visibility_off_outlined,
                                        color: Utils.lightGreyColor2,
                                        size: 25.0,
                                      ),
                                      onPressed: () {
                                        // Update the state i.e. toogle the state of passwordVisible variable
                                        setState(() {
                                          _confirmNewPasswordVisible =
                                              !_confirmNewPasswordVisible;
                                        });
                                      },
                                    ),
                                  ),
                                  onChanged: (value) {
                                    setState(() {
                                      confirmNewPassword = value;
                                    });
                                  },
                                  validator: (value) {
                                    if (value!.trim().isEmpty) {
                                      return 'Please enter password again';
                                    } else if (confirmNewPassword !=
                                        newPassword) {
                                      return 'Both passwords must be same';
                                    } else if (confirmNewPassword ==
                                        currentPassword) {
                                      return 'New password must be different from current password';
                                    }
                                    return null;
                                  },
                                  style: Utils.kAppPrimaryTextStyle,
                                ),
                              ],
                            )
                          :
                          // change email form view
                          Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // label
                                Text(
                                  'YOUR NEW EMAIL ADDRESS',
                                  style: Utils.kAppPrimaryTextStyle.copyWith(
                                      fontSize: 12.0,
                                      fontWeight: FontWeight.w800),
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
                                      return 'New email is required';
                                    } else if (userEmail != confirmUserEmail) {
                                      return 'Both emails must be same';
                                    }
                                    return null;
                                  },
                                  style: Utils.kAppPrimaryTextStyle,
                                ),

                                // space
                                const SizedBox(
                                  height: 45.0,
                                ),

                                // label
                                Text(
                                  'CONFIRM YOUR NEW EMAIL ADDRESS',
                                  style: Utils.kAppPrimaryTextStyle.copyWith(
                                      fontSize: 12.0,
                                      fontWeight: FontWeight.w800),
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
                                      confirmUserEmail = value;
                                    });
                                  },
                                  validator: (value) {
                                    if (value!.trim().isEmpty) {
                                      return 'Please enter email again';
                                    } else if (confirmUserEmail != userEmail) {
                                      return 'Both emails must be same';
                                    }
                                    return null;
                                  },
                                  style: Utils.kAppPrimaryTextStyle,
                                ),
                              ],
                            ),

                      // space
                      const SizedBox(
                        height: 40.0,
                      ),

                      // update button
                      CustomButton(
                        primaryButton: true,
                        onPressed: () {
                          // if form is valid
                          if (_formKey.currentState!.validate()) {
                            // close screen
                            Navigator.pop(context);
                          }
                        },
                        buttonText: 'Update',
                        buttonWidth: MediaQuery.of(context).size.width,
                        buttonHeight: 65.0,
                      ),
                    ]))
          ])),
    );
  }
}
