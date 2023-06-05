import 'package:flutter/material.dart';
import 'package:supportive_ai/Screens/sign_in/widgets/button.dart';
import 'package:supportive_ai/Screens/sign_in/widgets/text_field.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  // text editing controller
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _dobController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  String? _selectedGender;

  @override
  void dispose() {
    _nameController.dispose();
    _lastNameController.dispose();
    _phoneController.dispose();
    _addressController.dispose();
    _emailController.dispose();
    _dobController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      // Perform registration logic here
      String name = _nameController.text;
      String lastName = _lastNameController.text;
      String phone = _phoneController.text;
      String address = _addressController.text;
      String email = _emailController.text;
      String dob = _dobController.text;
      String gender = _selectedGender!;
      String password = _passwordController.text;
      String confirmPassword = _confirmPasswordController.text;

      // Do something with the data (e.g., send to backend, save locally)
      print('Name: $name');
      print('Last Name: $lastName');
      print('Phone: $phone');
      print('Address: $address');
      print('Email: $email');
      print('DOB: $dob');
      print('Gender: $gender');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF1E6FF),
      body: SingleChildScrollView(
        child: SafeArea(
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
                  controller: _nameController,
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
                  controller: _lastNameController,
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
                  controller: _passwordController,
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
                  icon: const Icon(Icons.password),
                  controller: _confirmPasswordController,
                  hintText: "Confirm Password",
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
                  controller: _phoneController,
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
                  controller: _addressController,
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
                  controller: _emailController,
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
                  controller: _dobController,
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
                MyButton(
                    onTap: () {
                      _submitForm();
                    },
                    text: "Sign Up"),
                const SizedBox(height: 10),
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, 'signin');
                  },
                  child: const Row(
                    children: [
                      Icon(Icons.arrow_back),
                      Text(
                        "Back to Sign IN",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
