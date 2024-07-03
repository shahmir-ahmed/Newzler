import 'package:flutter/material.dart';
import 'package:newzler/presentation/views/login/login_view.dart';
import 'package:newzler/presentation/views/login/signup_view.dart';

class AuthenticationWrapper extends StatefulWidget {
  AuthenticationWrapper({required this.backButton});

  bool backButton; // back button present or not

  @override
  State<AuthenticationWrapper> createState() => _AuthenticationWrapperState();
}

class _AuthenticationWrapperState extends State<AuthenticationWrapper> {
  bool showLoginScreen = true;

  changeScreen() {
    setState(() {
      showLoginScreen = !showLoginScreen;
    });
  }

  @override
  Widget build(BuildContext context) {
    return showLoginScreen
        ? LoginView(changeScreenMethod: changeScreen, backButton: widget.backButton)
        : SignupView(changeScreenMethod: changeScreen, backButton: widget.backButton);
  }
}
