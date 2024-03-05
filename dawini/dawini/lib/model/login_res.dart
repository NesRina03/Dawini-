import 'dart:convert';

class LoginResponse {
  String? message;
  Data? data;

  LoginResponse({this.message, this.data});

  factory LoginResponse.fromJson(Map<String, dynamic> json) {
    return LoginResponse(
      message: json['message'],
      data: json['data'] != null ? Data.fromJson(json['data']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  String? username;
  String? password;
  String? email;
  DateTime? date;
  String? id;
  String? token;

  Data({
    this.username,
    this.password,
    this.email,
    this.date,
    this.id,
    this.token,
  });

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      username: json['username'],
      password: json['password'],
      email: json['email'],
      date: json['date'] != null ? DateTime.parse(json['date']) : null,
      id: json['id'],
      token: json['token'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['username'] = username;
    data['password'] = password;
    data['email'] = email;
    data['date'] = date?.toIso8601String();
    data['id'] = id;
    data['token'] = token;
    return data;
  }
}

LoginResponse loginResponseFromJson(String str) =>
    LoginResponse.fromJson(jsonDecode(str));