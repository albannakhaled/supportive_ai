import 'package:flutter/material.dart';
import 'package:supportive_ai/Screens/sign_in/widgets/button.dart';
import 'package:supportive_ai/Screens/sign_in/widgets/text_field.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  // text editing controller
  final emailTextController = TextEditingController();
  final passwordTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF1E6FF),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // logo

              // phrase

              // username filed
              MyTextField(
                  icon: const Icon(Icons.person),
                  controller: emailTextController,
                  hintText: "User name",
                  obscureText: false),
              // password field
              const SizedBox(
                height: 10,
              ),
              MyTextField(
                icon: const Icon(Icons.password_outlined),
                controller: passwordTextController,
                hintText: "Password",
                obscureText: true,
              ),

              // sign in button
              const SizedBox(
                height: 8,
              ),
              MyButton(onTap: () {
                print(emailTextController);
                print(passwordTextController);
              }, text: "Sign In"),
              // go to register page
              const SizedBox(
                height: 8,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Not a member ?",
                    style: TextStyle(
                        fontWeight: FontWeight.w100, color: Colors.grey),
                  ),
                  const SizedBox(width: 4),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, 'register');
                    },
                    child: const Text(
                      "Register Now",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
  
}
