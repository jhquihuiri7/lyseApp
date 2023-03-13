// To parse this JSON data, do
//
//     final loginModel = loginModelFromJson(jsonString);

import 'dart:convert';

LoginModel loginModelFromJson(String str) => LoginModel.fromJson(json.decode(str));

String loginModelToJson(LoginModel data) => json.encode(data.toJson());

class LoginModel {
  LoginModel({
    required this.phone,
    required this.code,
    required this.status,
  });

  String phone;
  String code;
  String status;

  factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
    phone: json["phone"],
    code: json["code"],
    status: json["status"],
  );

  Map<String, dynamic> toJson() => {
    "phone": phone,
    "code": code,
    "status": status,
  };
}
