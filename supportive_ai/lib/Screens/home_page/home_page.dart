import 'package:flutter/material.dart';
import 'package:supportive_ai/Screens/home_page/widgets/nav_bar.dart';

class HomePage extends StatefulWidget {
  final String token;
  HomePage({required this.token});


  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: NavBar(),
      body: Container(),
    );
  }
}
