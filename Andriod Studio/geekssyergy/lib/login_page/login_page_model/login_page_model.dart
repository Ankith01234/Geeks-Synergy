// To parse this JSON data, do
//
//     final loginData = loginDataFromJson(jsonString);

import 'dart:convert';

LoginData loginDataFromJson(String str) => LoginData.fromJson(json.decode(str));

String loginDataToJson(LoginData data) => json.encode(data.toJson());

class LoginData {
  String message;
  LoginDetails loginDetails;

  LoginData({
    required this.message,
    required this.loginDetails,
  });

  factory LoginData.fromJson(Map<String, dynamic> json) => LoginData(
    message: json["message"],
    loginDetails: LoginDetails.fromJson(json["loginDetails"]),
  );

  Map<String, dynamic> toJson() => {
    "message": message,
    "loginDetails": loginDetails.toJson(),
  };
}

class LoginDetails {
  String email;
  String password;

  LoginDetails({
    required this.email,
    required this.password,
  });

  factory LoginDetails.fromJson(Map<String, dynamic> json) => LoginDetails(
    email: json["email"],
    password: json["password"],
  );

  Map<String, dynamic> toJson() => {
    "email": email,
    "password": password,
  };
}
