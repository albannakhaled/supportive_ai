import 'package:shared_preferences/shared_preferences.dart';

class MySharedPreferences{
  static Future<void> saveToken(String token) async{
        final SharedPreferences prefs = await SharedPreferences.getInstance();
        await prefs.setString('token', token);
  }
  static getToken() async{
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    var token =  prefs.getString('token');
    return token ;
  }
}