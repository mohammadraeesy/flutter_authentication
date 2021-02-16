import 'package:flutter/cupertino.dart';
import 'package:flutter_authentication/futures/authentication/domain/entities/authentication.dart';

class AuthenticationModel extends Authentication {
  AuthenticationModel(
      {@required String token,
      @required String RefreshToken,
      @required DateTime Expiration})
      : super(Expiration: Expiration, RefreshToken: RefreshToken, token: token);
  factory AuthenticationModel.fromJson(Map<String, dynamic> json) {
    return AuthenticationModel(
        token: json['token'],
        RefreshToken: json['RefreshToken'],
        Expiration: json['Expiration']);
  }
  Map<String,dynamic> toJson(){
    return {
      'token' : token,
      'RefreshToken':RefreshToken,
      'Expiration':Expiration
    };
  }

}
