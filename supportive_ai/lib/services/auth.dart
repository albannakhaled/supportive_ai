import 'package:http/http.dart' as http;
import 'dart:convert';

Future<void> postData() async {
  var apiUrl = 'https://example.com/api/posts'; // Replace with your API endpoint

  var postData = {
    'name': '_nameController.text',
    'last_name': '_lastNameController.text',
    'password': '_passwordController.text',
    'password_confirm': '_confirmPasswordController.text',
    'phone': '_phoneController.text',
    'address': '_addressController.text',
    'email': '_emailController.text',
    'dob': '_dobController.text',
    'gender': '_selectedGender',
    // Add any other fields you need to send in the request
  };

  var response = await http.post(
    Uri.parse(apiUrl),
    body: jsonEncode(postData),
    headers: {'Content-Type': 'application/json'},
  );

  if (response.statusCode == 201) {
    // POST request successful
    print('Post request successful!');
  } else {
    // POST request failed
    print('Post request failed with status: ${response.statusCode}.');
  }
}
