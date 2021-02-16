import 'package:flutter/cupertino.dart';

class RegisterModel {
  final String username;
  final String password;
  final String phonenumber;
  final String fisrtname;
  final String lastname;
  final String email;

  RegisterModel(
      {@required this.lastname,
      @required this.fisrtname,
      @required this.email,
      @required this.password,
      @required this.username,
      @required this.phonenumber});

  Map<String, dynamic> toJson() {
    return {
      'username': username,
      'password': password,
      'phonenumber': phonenumber,
      'fisrtname': fisrtname,
      'lastname': lastname,
      'email': email
    };
  }
}
