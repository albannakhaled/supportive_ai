import 'package:flutter/material.dart';

import '../../../responsive.dart';

class MyButton extends StatelessWidget {
  final Function()? onTap;
  final String text;
  const MyButton({super.key, required this.onTap, required this.text});

  @override
  Widget build(BuildContext context) {
    final screenHeight =
        context.height - appbarHeight - MediaQuery.of(context).padding.top;
    final screenWidth = context.width;
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          shadowColor: Colors.purple,
          elevation: 3,
          foregroundColor: Colors.purple, // Background color
          backgroundColor: Colors.white,
          // surfaceTintColor: Colors.purple, // Text color
          padding: const EdgeInsets.all(16), // Padding around the button
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15), // Rounded corners
          ),
        ),
        onPressed: () {
          // Button action
        },
        child: Text(text),
      ),
    );
  }
}
