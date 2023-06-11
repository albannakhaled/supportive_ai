import 'dart:convert';
import 'package:http/http.dart' as http;
void main()
{
  loginUser();
}
void loginUser()async{
  var url = Uri.parse('http://127.0.0.1:8000/login/');
  var body = jsonEncode({
    'username':'test',
    'password':'Password confirmation:',
  });
  var headers = {'Content-Type':'application/json'};
  var response = await http.post(url,body:body,headers:headers);
  if(response.statusCode == 200){
    print("login success");
  }else{
    print('registration fialed : ${response.statusCode}');
    print('response body: ${response.body}');
  }
}