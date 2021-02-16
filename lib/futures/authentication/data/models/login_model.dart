import 'package:flutter/cupertino.dart';
import 'package:flutter_authentication/futures/authentication/domain/entities/authentication.dart';

class LoginModel {
  final String username;
  final String password;

  LoginModel({@required this.username, @required this.password});

  Map<String, dynamic> toJson() {
    return {'username': username, 'password': password};
  }
}
