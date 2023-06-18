import 'package:http/http.dart' as http;
import 'dart:convert';

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
  final url = 'http://127.0.0.1:8000/register/';

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

// void main()
// {
//   signUpUser('username', 'password', 'name', '123', 'address', 'albannakhail90@gmail.com', '2000-2-2', 'M', 'patient');
// }