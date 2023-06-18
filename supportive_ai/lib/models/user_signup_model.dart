import 'dart:convert';

List<UserModel> userModelFromJson(String str) =>
    List<UserModel>.from(json.decode(str).map((x) => UserModel.fromJson(x)));

String userModelToJson(List<UserModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class UserModel {
  String? username;
  String? password;
  String? name;
  String? phone;
  String? address;
  String? email;
  String? dob;
  String? gender;
  String? post;

  UserModel(
      {this.username,
      this.password,
      this.name,
      this.phone,
      this.address,
      this.email,
      this.dob,
      this.gender,
      this.post});

  UserModel.fromJson(Map<String, dynamic> json) {
    username = json['username'];
    password = json['password'];
    name = json['name'];
    phone = json['phone'];
    address = json['address'];
    email = json['email'];
    dob = json['dob'];
    gender = json['gender'];
    post = json['post'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['username'] = this.username;
    data['password'] = this.password;
    data['name'] = this.name;
    data['phone'] = this.phone;
    data['address'] = this.address;
    data['email'] = this.email;
    data['dob'] = this.dob;
    data['gender'] = this.gender;
    data['post'] = this.post;
    return data;
  }
}
