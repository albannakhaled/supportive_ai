import 'package:flutter/material.dart';
import 'package:supportive_ai/Screens/home_page/home_page.dart';
import 'package:supportive_ai/Screens/home_page/profile.dart';
import 'package:supportive_ai/Screens/home_page/widgets/nav_bar.dart';
import 'package:supportive_ai/Screens/sign_in/sign_in.dart';
import 'package:supportive_ai/Screens/sign_up/sign_up.dart';
// import 'package:supportive_ai/Screens/splash/splash.dart';
import 'Screens/home_page/chat.dart';
import 'Screens/userScreen/profileuser.dart';
// import 'Screens/userScreen/appointement.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        'signup': (context) => const SignUp(),
        'signin': (context) => const SignIn(),
        'chat': (context) => ChatBotScreen(),
        'userprofile/': (context) => ProfileScreen(),
        'profile': (context) => const Profile(),
        'home': (context) => const NavBar(),
      },
      theme: ThemeData(
        useMaterial3: true,
        primarySwatch: Colors.purple,
        primaryColor: const Color.fromARGB(255, 69, 7, 105),
      ),
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: SignIn(),
    );
  }
}
