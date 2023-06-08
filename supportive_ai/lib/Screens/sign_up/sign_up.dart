import 'package:flutter/material.dart';
import 'package:supportive_ai/Screens/sign_in/widgets/button.dart';
import 'package:supportive_ai/Screens/sign_in/widgets/text_field.dart';
import 'package:supportive_ai/responsive.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  // text editing controller
  final nameTextController = TextEditingController();
  final passwordTextController = TextEditingController();
  final confirmPasswordTextController = TextEditingController();
  final userNameTextController = TextEditingController();
  final phoneTextController = TextEditingController();
  final addressTextController = TextEditingController();
  final emailTextController = TextEditingController();
  final dobTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final screenHeight =
        context.height - appbarHeight - MediaQuery.of(context).padding.top;
    final screenWidth = context.width;
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 208, 208, 208),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(
                vertical: screenHeight * 0.1, horizontal: screenWidth * 0.1),
            child: SafeArea(
              child: Center(
                child: Container(
                  padding: EdgeInsets.symmetric(
                      horizontal: screenHeight * 0.03,
                      vertical: screenWidth * 0.1),
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
                        controller: nameTextController,
                        hintText: "Name",
                        obscureText: false,
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Please enter your name';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 5),
                      MyTextField(
                        icon: const Icon(Icons.person_2),
                        controller: userNameTextController,
                        hintText: "Last name",
                        obscureText: false,
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Please enter your last name';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 5),
                      MyTextField(
                        icon: const Icon(Icons.password),
                        controller: passwordTextController,
                        hintText: "Password",
                        obscureText: true,
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Please enter your password';
                          }
                          return null;
                        },
                      ),

                      const SizedBox(height: 5),
                      MyTextField(
                        icon: const Icon(Icons.phone),
                        controller: phoneTextController,
                        hintText: "Phone Number",
                        obscureText: false,
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Please enter your number';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 5),
                      MyTextField(
                        icon: const Icon(Icons.location_city),
                        controller: addressTextController,
                        hintText: "Address",
                        obscureText: false,
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Please enter your Address';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 5),
                      MyTextField(
                        icon: const Icon(Icons.email),
                        controller: emailTextController,
                        hintText: "Email",
                        obscureText: false,
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Please enter your Email';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 5),
                      MyTextField(
                        icon: const Icon(Icons.date_range),
                        controller: dobTextController,
                        hintText: "Date Of Birth",
                        obscureText: false,
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Please enter your Birth';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 15),

                      // sign in button
                      MyButton(onPressed: () {}, text: "Sign Up"),
                      const SizedBox(height: 10),
                      GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, 'signin');
                        },
                        child: const Row(
                          children: [
                            Icon(
                              Icons.arrow_back,
                              color: Colors.purple,
                            ),
                            Text(
                              "Back to Sign IN",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.blueGrey),
                            ),
                          ],
                        ),
                      ),
                    ],
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
