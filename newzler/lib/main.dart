import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
// import 'package:newzler/presentation/views/home/home_view.dart';
import 'package:newzler/presentation/views/onboarding/splash_screen_view.dart';

void main() {
  // Enable only potrait mode in app
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Newzler',
      home: const SplashScreenView(),
      // home: HomeView(),
      // home: SignupView(changeScreenMethod: (){}, backButton: false,),
    );
  }
}
