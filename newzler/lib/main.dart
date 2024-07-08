import 'package:flutter/material.dart';
import 'package:newzler/presentation/views/home/home_view.dart';
import 'package:newzler/presentation/views/login/signup_view.dart';
import 'package:newzler/presentation/views/login/verify_email_view.dart';
import 'package:newzler/presentation/views/onboarding/splash_screen_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Newzler',
      // home: const SplashScreenView(),
      home: const HomeView(),
      // home: SignupView(changeScreenMethod: (){}, backButton: false,),
    );
  }
}
