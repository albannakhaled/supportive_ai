import 'package:flutter/material.dart';
import 'package:supportive_ai/Screens/home_page/home_page.dart';
import 'package:supportive_ai/Screens/sign_in/widgets/button.dart';
import 'package:supportive_ai/Screens/sign_in/widgets/text_field.dart';
import 'package:supportive_ai/responsive.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class SignIn extends StatefulWidget {
  const SignIn({Key? key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  bool _logSuccess = false;
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  Future<void> login(String username, String password) async {
    final url = Uri.parse('http://127.0.0.1:8000/login/');
    final headers = {
      'Content-type': 'application/json',
      'Accept': 'application/json',
      'Content-Type': 'application/x-www-form-urlencoded',
      // 'Authorization': 'Bearer $token',
      // 'X-CSRFToken':
      //     'ghMzXXOybawlKlDp5md46Zz03bdud0g9', // Update the referer URL here
    };

    final body = {
      'username': username,
      'password': password,
    };

    final response = await http.post(
      url,
      headers: headers,
      body: body,
    );

    if (response.statusCode == 200) {
      final responseData = jsonDecode(response.body);
      final String token = responseData['data']['Token'];
      if (token != null) {
        _logSuccess = true;
      }
      print('Logged in successfully! Token: $token');
    } else {
      print('Login failed. Status code: ${response.statusCode}');
    }
  }

  void _handleLogin() {
    final username = _usernameController.text;
    final password = _passwordController.text;

    login(username, password);
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
                    // username field
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
                      },
                    ),
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
                      },
                    ),

                    // sign in button
                    SizedBox(height: screenHeight * 0.05),
                    SizedBox(
                      height: screenHeight * 0.07,
                      child: MyButton(
                        onPressed: () {
                          if (_logSuccess) {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      const HomePage()),
                            );
                          }
                          _handleLogin;
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
                            color: Colors.blueGrey,
                          ),
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
                              color: Colors.purple,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: screenWidth * 0.3,
                    ),
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
