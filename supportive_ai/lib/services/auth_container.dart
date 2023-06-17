import 'package:flutter/material.dart';
import 'package:supportive_ai/Screens/home_page/widgets/nav_bar.dart';
import 'package:supportive_ai/Screens/sign_in/sign_in.dart';

class AuthContainer extends StatelessWidget {
  const AuthContainer({super.key});

  @override
  Widget build(BuildContext context) {
    bool isLoggedIn = true;
    if(isLoggedIn)
      return NavBar();
    else
      return SignIn();
  }
}