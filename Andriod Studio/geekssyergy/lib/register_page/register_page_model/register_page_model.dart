// To parse this JSON data, do
//
//     final signUpData = signUpDataFromJson(jsonString);

import 'dart:convert';

SignUpData signUpDataFromJson(String str) => SignUpData.fromJson(json.decode(str));

String signUpDataToJson(SignUpData data) => json.encode(data.toJson());

class SignUpData {
  String message;
  SignUp signUp;

  SignUpData({
    required this.message,
    required this.signUp,
  });

  factory SignUpData.fromJson(Map<String, dynamic> json) => SignUpData(
    message: json["message"],
    signUp: SignUp.fromJson(json["signUp"]),
  );

  Map<String, dynamic> toJson() => {
    "message": message,
    "signUp": signUp.toJson(),
  };
}

class SignUp {
  int id;
  String name;
  int age;
  String email;
  String password;

  SignUp({
    required this.id,
    required this.name,
    required this.age,
    required this.email,
    required this.password,
  });

  factory SignUp.fromJson(Map<String, dynamic> json) => SignUp(
    id: json["id"],
    name: json["name"],
    age: json["age"],
    email: json["email"],
    password: json["password"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "age": age,
    "email": email,
    "password": password,
  };
}
