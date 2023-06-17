import 'dart:convert';
import 'package:http/http.dart' as http;

Future<void> signUpUser(
  String username,
  String password,
  String name,
  String email,
  String phoneNumber,
  String location_city,
  String patient_doctor,
  String gender,
  String birth,
) async {
  var url = Uri.parse('http://127.0.0.1:8000/register/');
  var body = jsonEncode({
    'username': username,
        'password': password,
        "name": name,
        "phone": phoneNumber,
        "address": location_city,
        "email": email,
        "dob": birth, //2020-07-01
        "gender": gender,
        "post": patient_doctor,
  });
  var headers = {
    'Content-Type': 'application/json',
    'X-CSRFToken': 'ghMzXXOybawlKlDp5md46Zz03bdud0g9',
  };

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

void main() async {
  signUpUser('test101', '123', 'ahmad', 'albannakhalil90@gmail.com', '1234567',
      'akkar', 'patient', 'M', '2010-10-10');
}
