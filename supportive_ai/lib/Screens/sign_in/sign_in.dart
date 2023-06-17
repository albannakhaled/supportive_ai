import 'package:flutter/material.dart';
import 'package:supportive_ai/Screens/sign_in/widgets/button.dart';
import 'package:supportive_ai/Screens/sign_in/widgets/text_field.dart';
import 'package:supportive_ai/responsive.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  Future<void> login(
      String username, String password, BuildContext context) async {
    final url = Uri.parse('http://127.0.0.1:8000/login/');
    final response = await http.post(
      url,
      body: {'username': username, 'password': password},
    );
    if (response.statusCode == 200) {
      final responseData = jsonDecode(response.body);
      final String token = responseData['token'];
      print('Logged in successfully! Token: $token');
    } else {
      print('Login failed. Status code: ${response.statusCode}');
    }
  }

  void _handleLogin(BuildContext context) {
    final username = _usernameController.text;
    final password = _passwordController.text;

    login(username, password, context);
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight =
        context.height - appbarHeight - MediaQuery.of(context).padding.top;
    final screenWidth = context.width;
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 208, 208, 208),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            vertical: screenHeight * 0.1,
            horizontal: screenWidth * 0.1,
          ),
          child: Center(
            child: SingleChildScrollView(
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    // username filed
                    MyTextField(
                        icon: const Icon(Icons.person),
                        controller: _usernameController,
                        hintText: "User name",
                        obscureText: false,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter Username';
                          }
                          return null;
                        }),
                    SizedBox(height: screenHeight * 0.02),
                    // password field
                    MyTextField(
                        icon: const Icon(Icons.password_outlined),
                        controller: _passwordController,
                        hintText: "Password",
                        obscureText: true,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter Password';
                          }
                          return null;
                        }),

                    // sign in button
                    SizedBox(height: screenHeight * 0.05),
                    SizedBox(
                      height: screenHeight * 0.07,
                      child: MyButton(
                        onPressed: () {
                          _handleLogin(context);
                        },
                        text: "Sign In",
                      ),
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
    );
  }
}
