import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:supportive_ai/Screens/gard-view.dart';
import 'package:supportive_ai/Screens/home_page/home_page.dart';
import 'package:supportive_ai/widget/nav_bar.dart';
import 'Screens/doctor_screen/profile.dart';
import 'Screens/home_page/chat.dart';
import 'Screens/patient-screen/appointement.dart';
import 'Screens/sign_in.dart';
import 'Screens/sign_up.dart';
import 'Screens/splash.dart';

// shared pref
SharedPreferences? prefs;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  prefs = await SharedPreferences.getInstance();
  var token = prefs!.getString("token");
  Widget _screen;
  if (token == null || token.isEmpty) {
    _screen = const SplashScreen();
  } else {
    _screen = const HomePage();
  }
  runApp(MyApp(_screen));
}

class MyApp extends StatelessWidget {
  final Widget _screen;
  const MyApp(this._screen, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        'sign-up/': (context) => const SignUp(),
        'sign-in/': (context) => const SignIn(),
        'chat-bot/': (context) => ChatBotScreen(),
        'user-appointment/': (context) => const AppointmentScreen(),
        'doctor-appointment/': (context) => const Appointment(),
        'nav-bar/': (context) => const NavBar(),
        'grid-view/': (context) => YouTubeGridView(),
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
