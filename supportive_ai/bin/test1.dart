import 'dart:convert';
import 'package:http/http.dart' as http;
void main()
{
  loginUser('test1','123qweasdzxc');
}
// void loginUser()async{
//   var url = Uri.parse('https://supportiveai-api.onrender.com/login/');
//   var body = jsonEncode({
//     'username':'test1',
//     'password':'123qweasdzxcy',
//   });
//   var headers = {'Content-Type':'application/json'};
//   var response = await http.post(url,body:body,headers:headers);
//   if(response.statusCode == 200){
//     print("login success");
//   }else{
//     print('registration fialed : ${response.statusCode}');
//     print('response body: ${response.body}');
//   }
// }
Future<void> loginUser(String username, String password) async {
  var url = Uri.parse('https://supportiveai-api.onrender.com/login/');
  var body = jsonEncode({
    'username': username,
    'password': password,
  });
  var headers = {'Content-Type': 'application/json'};

  try {
    var response = await http.post(url, body: body, headers: headers);

    if (response.statusCode == 200) {
      // Login successful
      var responseData = jsonDecode(response.body);
      print(responseData);
      // var token = responseData['token'];
      // Store the token or perform further actions
      print('Login successful');
    } else {
      // Login failed
      print('Login failed with status code: ${response.statusCode}');
      print('Response body: ${response.body}');
    }
  } catch (e) {
    // Handle any exceptions
    print('Exception occurred during login: $e');
  }
}