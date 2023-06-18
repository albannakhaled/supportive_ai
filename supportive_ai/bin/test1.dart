import 'package:http/http.dart' as http;
import 'dart:convert';

Future<void> login(String username, String password) async {
  final url = Uri.parse('http://127.0.0.1:8000/login/');
  final headers = {
    'Content-type': 'application/json',
    'Accept': 'application/json',
    'Content-Type': 'application/x-www-form-urlencoded',
    // 'Authorization': 'Bearer $token',
    // 'X-CSRFToken': 'ghMzXXOybawlKlDp5md46Zz03bdud0g9', // Update the referer URL here
  };

  final body = {
    'username': username,
    'password': password,
  };

  final response = await http.post(
    url,
    headers: headers,
    body: body,
  );

  if (response.statusCode == 200) {
    final responseData = jsonDecode(response.body);
    final String token = responseData['data']['Token'];

    print('Logged in successfully! Token: $token');
  } else {
    print('Login failed. Status code: ${response.statusCode}');
  }
}

void main() {
  login("chadi3", '123');
}
