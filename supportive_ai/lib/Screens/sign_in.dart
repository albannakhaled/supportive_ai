import 'package:flutter/material.dart';
import 'package:supportive_ai/Screens/home_page/home_page.dart';
import 'package:supportive_ai/responsive.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:supportive_ai/services/sharespref.dart';

import '../widget/button.dart';
import '../widget/text_field.dart';
import 'doctor_screen/profile.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  bool _isLoading = false;

  void _signIn() async {
    setState(() {
      _isLoading = true;
    });

    if (!_validateInputs()) {
      // Validation failed, return early
      setState(() {
        _isLoading = false;
      });
      return;
    }
    setState(() {
      _isLoading = true;
    });

    final String username = _usernameController.text.trim();
    final String password = _passwordController.text.trim();

    final Map<String, String> data = {
      "username": username,
      "password": password,
    };

    final Uri signInUrl =
        Uri.parse('https://supportiveai-api.onrender.com/login-api/');

    try {
      final http.Response response = await http.post(
        signInUrl,
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          // 'X-CSRFToken':''
        },
        body: json.encode(data),
      );
      // print(response);
      if (response.statusCode == 200) {
        final Map<String, dynamic> responseBody = json.decode(response.body);

        // Save token to shared preferences for later use
        final String token = responseBody['data']['Token'];
        MySharedPreferences.saveToken(token);

        if (responseBody['message'] == '') {
          // ignore: use_build_context_synchronously
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text("Verify you're Email"),
            ),
          );
        }
        if (responseBody['data']['usertype'] == 'patient') {
          // ignore: use_build_context_synchronously
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const HomePage()),
          );
        } else {
          // ignore: use_build_context_synchronously
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) => const Appointment()));
        }
      } else {
        // Handle error response
        print('Sign-in failed: ${response.body}');
        // Display an error message to the user
        // ignore: use_build_context_synchronously
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text("User Name or Password is incorrect"),
          ),
        );
      }
    } catch (e) {
      print('Error occurred during sign-in: $e');
      // Display an error message to the user
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  bool _validateInputs() {
    if (_formKey.currentState!.validate()) {
      // All form fields are valid
      return true;
    } else {
      // Some form fields are invalid
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight =
        context.height - appbarHeight - MediaQuery.of(context).padding.top;
    final screenWidth = context.width;
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 208, 208, 208),
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
                    //title
                    const Text(
                      'Welcome to Bloom',
                      style: TextStyle(
                          letterSpacing: 1,
                          fontStyle: FontStyle.italic,
                          fontSize: 24,
                          color: Colors.purple,
                          fontWeight: FontWeight.w500),
                    ),
                    const SizedBox(
                      height: 50,
                    ),
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
                        onPressed: _isLoading ? null : _signIn,
                        child: _isLoading
                            ? const LinearProgressIndicator()
                            : const Text('Sign In'),
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
                            Navigator.pushNamed(context, 'sign-up/');
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
