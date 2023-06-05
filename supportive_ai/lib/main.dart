import 'package:flutter/material.dart';
import 'package:supportive_ai/Screens/sign_in/sign_in.dart';
import 'package:supportive_ai/Screens/sign_up/sign_up.dart';

import 'Screens/home_page/widgets/nav_bar.dart';
import 'Screens/sign_up/sign_up.dart';

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
        'register': (context) => Register(),
        'signin': (context) => SignIn(),
      },
      theme: ThemeData(
        primaryColor: const Color.fromARGB(255, 69, 7, 105),
      ),
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: SignIn(),
    );
  }
}
