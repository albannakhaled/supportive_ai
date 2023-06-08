import 'package:flutter/material.dart';
import 'package:supportive_ai/Screens/sign_in/widgets/button.dart';
import 'package:supportive_ai/Screens/sign_in/widgets/text_field.dart';
import 'package:supportive_ai/responsive.dart';

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
    final screenHeight =
        context.height - appbarHeight - MediaQuery.of(context).padding.top;
    final screenWidth = context.width;
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 208, 208, 208),
      body: SafeArea(
        child: Container(
          height: double.infinity,
          decoration: BoxDecoration(
              border: Border.all(color: Colors.white.withOpacity(0.13)),
              image: const DecorationImage(
                  opacity: 80,
                  image: AssetImage(""),
                  fit: BoxFit.cover)),
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(
                  vertical: screenHeight * 0.1, horizontal: screenWidth * 0.1),
              child: SafeArea(
                child: Center(
                  child: Container(
                    padding: EdgeInsets.symmetric(
                        horizontal: screenHeight * 0.03,
                        vertical: screenWidth * 0.2),
                    decoration: BoxDecoration(
                        color: Color.fromARGB(255, 255, 255, 255),
                        boxShadow: const [
                          BoxShadow(
                              blurRadius: 3,
                              spreadRadius: 1,
                              color: Color.fromARGB(255, 155, 103, 164),
                              offset: Offset(3, 3)),
                        ],
                        borderRadius: BorderRadius.circular(35)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // username filed
                        MyTextField(
                            icon: const Icon(Icons.person),
                            controller: emailTextController,
                            hintText: "User name",
                            obscureText: false),
                        // password field
                        SizedBox(height: screenHeight * 0.05),
                        MyTextField(
                          icon: const Icon(Icons.password_outlined),
                          controller: passwordTextController,
                          hintText: "Password",
                          obscureText: true,
                        ),

                        // sign in button
                        SizedBox(height: screenHeight * 0.05),
                        SizedBox(
                          height: screenHeight * 0.07,
                          child: MyButton(onTap: () {}, text: "Sign In"),
                        ),
                        // go to register page
                        const SizedBox(
                          height: 16,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              "Not a member ?",
                              style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  color: Colors.blueGrey),
                            ),
                            const SizedBox(width: 10),
                            GestureDetector(
                              onTap: () {
                                Navigator.pushNamed(context, 'signup');
                              },
                              child: const Text(
                                "Register Now",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.purple),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: screenWidth * 0.3,
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
