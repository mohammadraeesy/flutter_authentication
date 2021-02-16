import 'package:flutter/cupertino.dart';
import 'package:flutter_authentication/core/error/exceptions.dart';
import 'package:flutter_authentication/futures/authentication/data/models/login_model.dart';
import 'package:flutter_authentication/futures/authentication/domain/entities/authentication.dart';
import 'package:http/http.dart' as http;

abstract class LoginDataSource {
  Future<Authentication> getAuthentication(LoginModel loginModel);
}

class LoginDataSourceImpl implements LoginDataSource {
  final String url = 'https://reqres.in/api/login';
  final http.Client client;

  LoginDataSourceImpl({@required this.client});

  @override
  Future<Authentication> getAuthentication(LoginModel loginModel) async {
    final String token = 'QpwL5tke4Pnpja7X4';
    final String refreshToken = 'QpwL5tke4Pnpjasff';
    final DateTime dateTimeTemp = DateTime(2022, 5, 26, 5, 30, 25);
    final response = await client.post(url,
        body: {"email": "eve.holt@reqres.in", "password": "cityslicka"});
    if (response.statusCode == 200) {
      return Authentication(
          Expiration: dateTimeTemp, token: token, RefreshToken: refreshToken);
    }else {
      throw ServerException();
    }
  }
}
