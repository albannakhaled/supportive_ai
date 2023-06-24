import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

Future<void> signIn(String username, String password) async {
  var url = Uri.parse('https://supportiveai-api.onrender.com/login/');
  var response = await http.post(
    url,
    headers: {'Content-Type': 'application/json'},
    body: jsonEncode({'username': username, 'password': password}),
  );

  if (response.statusCode == 200) {
    var data = jsonDecode(response.body);
    // print(data);
    var token = data['data']['Token'];
    print(token);
  } else {
    print("error = ${response.statusCode}");
  }
}
void main(){
  signIn("chadi", "123");
}