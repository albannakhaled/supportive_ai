import 'package:flutter/material.dart';
import 'package:supportive_ai/Screens/sign_in/widgets/button.dart';
import 'package:supportive_ai/Screens/sign_in/widgets/text_field.dart';
import 'package:supportive_ai/responsive.dart';
import 'package:supportive_ai/services/auth.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  String dropdownvalue = 'Patient';
  var items = ['Patient', 'Doctor'];
  SignUpAuth signauth = SignUpAuth();
  // text editing controller
  final username = TextEditingController();
  final password = TextEditingController();
  final name = TextEditingController();
  final email = TextEditingController();
  final phoneNumber = TextEditingController();
  final location_city = TextEditingController();
  // final patient_doctor = TextEditingController();
  final gender = TextEditingController();
  final birth = TextEditingController();
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
                        controller: username,
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
                        controller: password,
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
                        controller: name,
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
                        controller: email,
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
                        controller: phoneNumber,
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
                        controller: location_city,
                        hintText: "Address",
                        obscureText: false,
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Please enter your Email';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 5),
                      // dropdownbutton
                      DropdownButton(
                        // Initial Value
                        value: dropdownvalue,

                        // Down Arrow Icon
                        icon: const Icon(Icons.keyboard_arrow_down),

                        // Array list of items
                        items: items.map((String items) {
                          return DropdownMenuItem(
                            value: items,
                            child: Text(items),
                          );
                        }).toList(),
                        // After selecting the desired option,it will
                        // change button value to selected value
                        onChanged: (String? newValue) {
                          setState(() {
                            dropdownvalue = newValue!;
                          });
                        },
                      ),
                      const SizedBox(height: 15),

                      MyTextField(
                        icon: const Icon(Icons.date_range),
                        controller: gender,
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
                        controller: birth,
                        hintText: "Date of Birth",
                        obscureText: false,
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Please enter your Birth';
                          }
                          return null;
                        },
                      ),

                      // sign in button
                      MyButton(
                          onPressed: () {
                            signauth.signUpUser(
                                '$username',
                                '$password',
                                '$name',
                                '$email',
                                '$phoneNumber',
                                '$location_city',
                                dropdownvalue,
                                '$gender',
                                '$birth');
                          },
                          text: "Sign Up"),
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
