import 'dart:convert';
import 'package:http/http.dart' as http;

void registerUser() async {
  var url = Uri.parse('http://127.0.0.1:8000/register/');

  var body = jsonEncode({
    'username': 'khaeld',
    'password': '123qweasdzxc',
    'name': 'John',
    'email': 'albannakhalil90@gmail.com',
    'phone': '1234567890',
    'address': 'New York',
    'gender': 'Male',
    'dob': '1990-01-01',
  });

  var headers = {'Content-Type': 'application/json'};

  var response = await http.post(url, body: body, headers: headers);

  if (response.statusCode == 201) {
    // Registration successful
    print('User registered successfully');
  } else {
    // Registration failed
    print('Registration failed with status code: ${response.statusCode}');
    print('Response body: ${response.body}');
  }
}

void main() async {
  registerUser();
}
