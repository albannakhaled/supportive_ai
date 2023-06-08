

import 'package:http/http.dart' as http;

main() async {
  var response = await http.post(
    Uri.parse('http://127.0.0.1:8000/login/'),
    body: {
      'username': "test1",
      "password": "123qweasdzxc123",
    },
  );

  if (response.statusCode == 201)
  {print('done');}
  else {
    print('Invalid response: ${response.statusCode}');
  }
}
