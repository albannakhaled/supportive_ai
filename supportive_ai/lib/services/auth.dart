import 'package:http/http.dart' as http;
import 'dart:convert';

class SignUpAuth {
  // const SignUpAuth({super.});
  Future<void> signUpUser(
    String username,
    String password,
    String name,
    String email,
    String phoneNumber,
    String location_city,
    String patient_doctor,
    String gender,
    String birth,) async {
  var url = Uri.parse('https://supportiveai-api.onrender.com/register/');
  var body = jsonEncode({
    'username': username,
      'password': password,
      'name': name,
      'email': email,
      'phoneNumber': phoneNumber,
      'location_city': location_city,
      'patient_doctor': patient_doctor,
      'gender': gender,
      'birth': birth,
  });
  var headers = {'Content-Type': 'application/json'};

  try {
    var response = await http.post(url, body: body, headers: headers);

    if (response.statusCode == 201) {
      // Signup successful
      print('Signup successful');
    } else {
      // Signup failed
      print('Signup failed with status code: ${response.statusCode}');
      print('Response body: ${response.body}');
    }
  } catch (e) {
    // Handle any exceptions
    print('Exception occurred during signup: $e');
  }
}
  // log in


}




