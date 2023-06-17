import 'package:flutter/material.dart';
import 'package:supportive_ai/Screens/sign_in/sign_in.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Add any logic or async operations you need to perform during the splash screen
    // For example, you can fetch data, initialize services, etc.
    // After that, you can navigate to the next screen using a timer or future delay.
    navigateToNextScreen();
  }

  void navigateToNextScreen() {
    Future.delayed(const Duration(seconds: 2), () {
      // Replace 'HomeScreen()' with the screen you want to navigate to after the splash screen
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const SignIn()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Customize your splash screen UI here
      body: SafeArea(
        child: Center(
          child:Image.asset('assets/images/splash.JPG'),
        ),
      ),
    );
  }
}
