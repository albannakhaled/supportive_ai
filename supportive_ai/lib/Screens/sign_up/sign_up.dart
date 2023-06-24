import 'package:flutter/material.dart';
import 'package:supportive_ai/Screens/sign_in/widgets/button.dart';
import 'package:supportive_ai/Screens/sign_in/widgets/text_field.dart';
import 'package:supportive_ai/responsive.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';


class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final _formKey = GlobalKey<FormState>();
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

    signUpUser(
        username, password, name, phone, city, email, birth, gender, userType);
  }
  Future<void> signUpUser(
  String username,
  String password,
  String name,
  String phone,
  String address,
  String email,
  String dob,
  String gender,
  String post,
) async {
  final url = 'https://supportiveai-api.onrender.com/register-api/';

  final headers = {
    'Content-type': 'application/json',
    'Accept': 'application/json',
  };

  final body = {
    'username': username,
    'password': password,
    'name': name,
    'phone': phone,
    'address': address,
    'email': email,
    'dob': dob,
    'gender': gender,
    'post': post,
  };

  try {
    final response = await http.post(
      Uri.parse(url),
      headers: headers,
      body: jsonEncode(body),
    );

    if (response.statusCode == 201 || response.statusCode == 200) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Register Successfully")));
      final responseData = jsonDecode(response.body);
      // Process the response data as needed
      final token = responseData['token']['access'];
      print('Signed up successfully! Token: $token');
    } else {
      print('Sign up failed. Status code: ${response.statusCode}');
    }
  } catch (e) {
    print('Error during sign up: $e');
  }
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
                child: Form(
                  key: _formKey,
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
                          if (value!.isEmpty) {
                            return 'Please enter your username';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 5),
                      // password field
                      MyTextField(
                        icon: const Icon(Icons.password_outlined),
                        controller: _passwordController,
                        hintText: "Password",
                        obscureText: true,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter your Password';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 5),
                      // name field
                      MyTextField(
                        icon: const Icon(Icons.person),
                        controller: _nameController,
                        hintText: "Name",
                        obscureText: false,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter your Name';
                          }
                          return null;
                        },
                      ),

                      const SizedBox(height: 5),

                      //email field
                      MyTextField(
                        icon: const Icon(Icons.email),
                        controller: _emailController,
                        hintText: "Email",
                        obscureText: false,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter your Email';
                          }
                          // check valid email
                        //   final regex = RegExp(r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');
                        //   if(!regex.hasMatch('$_emailController')){
                        //     return 'Enter a valid Email';
                        //   }
                        //   return null;
                        },
                      ),
                      const SizedBox(height: 5),
                      // number field
                      MyTextField(
                        icon: const Icon(Icons.phone),
                        controller: _phoneNumberController,
                        hintText: "Phone number",
                        obscureText: false,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter your Phone number';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 5),
                      //address field
                      MyTextField(
                        icon: const Icon(Icons.location_city),
                        controller: _location_cityController,
                        hintText: "Address",
                        obscureText: false,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter your Address';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 5),
                      // gender field

                      MyTextField(
                        icon: const Icon(Icons.male_outlined),
                        controller: _genderController,
                        hintText: "Gender",
                        obscureText: false,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter your Gender';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 5),
                      // user type field
                      MyTextField(
                        icon: const Icon(Icons.supervised_user_circle),
                        controller: _userTypeController,
                        hintText: "patient or doctor",
                        obscureText: false,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter your Type';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 5),
                      //birth field
                      MyTextField(
                        icon: const Icon(Icons.date_range),
                        controller: _birthController,
                        hintText: "Date of Birth",
                        obscureText: false,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter your Birth';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 15),
                      // sign in button
                      MyButton(
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              _handleRegistration;
                            }
                          },
                          child: Text("Sign Up")),
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
