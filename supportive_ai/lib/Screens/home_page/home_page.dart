import 'package:flutter/material.dart';

import '../../widget/nav_bar.dart';


class HomePage extends StatefulWidget {
  // final String token;
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      bottomNavigationBar: NavBar(),
      body: Center(
        child: Text('fdas'),
      ),
    );
  }
}
