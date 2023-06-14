import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:supportive_ai/Screens/sign_in/widgets/button.dart';
import 'package:supportive_ai/Screens/sign_in/widgets/text_field.dart';
import 'package:supportive_ai/responsive.dart';
import 'package:http/http.dart' as http;

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  // text editing controller
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneNumberController = TextEditingController();
  final _location_cityController = TextEditingController();
  final _userTypeController = TextEditingController();
  final _genderController = TextEditingController();
  final _birthController = TextEditingController();

  Future<void> register(
    String username,
    String password,
    String name,
    String phone,
    String city,
    String email,
    String birth,
    String gender,
    String userType,
  ) async {
    final url = Uri.parse('http://127.0.0.1:8000/register/');

    final response = await http.post(
      url,
      body: {
        'username': username,
        'password': password,
        "name": name,
        "phone": phone,
        "address": city,
        "email": email,
        "dob": birth, //2020-07-01
        "gender": gender,
        "post": userType,
      },
    );

    if (response.statusCode == 201) {
      final responseData = jsonDecode(response.body);

      // Registration successful, you can handle the response data here
      print('Registration successful! Response: $responseData');
    } else {
      // Registration failed, display an error message to the user
      print('Registration failed. Status code: ${response.statusCode}');
    }
  }
  // final patient_doctor = TextEditingController();

  void _handleRegistration() {
    final username = _usernameController.text;
    final password = _passwordController.text;
    final email = _emailController.text;
    final userType = _userTypeController.text;
    final name = _nameController.text;
    final phone = _phoneNumberController.text;
    final city = _location_cityController.text;
    final gender = _genderController.text;
    final birth = _birthController.text;

    register(
        username, password, name, phone, city, email, birth, gender, userType);
  }

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
                        controller: _usernameController,
                        hintText: "User name",
                        obscureText: false,
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Please enter your username';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 5),
                      MyTextField(
                        icon: const Icon(Icons.person_2),
                        controller: _passwordController,
                        hintText: "Password",
                        obscureText: true,
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
                        controller: _nameController,
                        hintText: "Name",
                        obscureText: false,
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
                        controller: _emailController,
                        hintText: "Email",
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
                        controller: _phoneNumberController,
                        hintText: "Phone number",
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
                        controller: _location_cityController,
                        hintText: "Address",
                        obscureText: false,
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Please enter your Email';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 15),

                      MyTextField(
                        icon: const Icon(Icons.date_range),
                        controller: _genderController,
                        hintText: "Gender",
                        obscureText: false,
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Please enter your Birth';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 15),
                      MyTextField(
                        icon: const Icon(Icons.date_range),
                        controller: _userTypeController,
                        hintText: "User Type",
                        obscureText: false,
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Please enter your Birth';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 15),
                      MyTextField(
                        icon: const Icon(Icons.date_range),
                        controller: _birthController,
                        hintText: "Date of Birth",
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
                      MyButton(onPressed: _handleRegistration, text: "Sign Up"),
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
