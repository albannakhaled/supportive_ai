import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:supportive_ai/Screens/home_page/home_page.dart';
import 'package:supportive_ai/Screens/home_page/profile.dart';
import 'package:supportive_ai/Screens/home_page/widgets/nav_bar.dart';
import 'package:supportive_ai/Screens/sign_in/sign_in.dart';
import 'package:supportive_ai/Screens/sign_up/sign_up.dart';
import 'package:supportive_ai/Screens/splash/splash.dart';
import 'Screens/home_page/chat.dart';

SharedPreferences? prefs;

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); 
  prefs = await SharedPreferences.getInstance();
  var token = prefs!.getString("token");
  Widget _screen;
  if (token == null || token.isEmpty) { 
    _screen = SplashScreen();
  } else {
    _screen = const HomePage();
  }
  runApp(MyApp(_screen));
}

class MyApp extends StatelessWidget {
  final Widget _screen;
  const MyApp(this._screen, {Key? key}) : super(key: key); // Fix the constructor signature

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        'signup/': (context) => const SignUp(),
        'signin/': (context) => const SignIn(),
        'chat/': (context) => ChatBotScreen(),
        'userprofile/': (context) => Profile(),
        'profile/': (context) => const Profile(),
        'nav/': (context) => const NavBar(),
        'home-page/': (context) => const HomePage(),
      },
      theme: ThemeData(
        primarySwatch: Colors.purple,
        primaryColor: const Color.fromARGB(255, 69, 7, 105),
      ),
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: _screen,
    );
  }
}
