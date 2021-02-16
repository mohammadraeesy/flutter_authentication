import 'package:flutter/cupertino.dart';
import 'package:flutter_authentication/futures/authentication/data/models/register_model.dart';
import 'package:http/http.dart' as http;

abstract class RegisterDataSource {
  Future<bool> register(RegisterModel registerModel);
}

class RegisterDataSourceImpl implements RegisterDataSource {
  final http.Client client;

  RegisterDataSourceImpl({@required this.client});

  @override
  Future<bool> register(RegisterModel registerModel) async {
    final String url = 'https://reqres.in/api/register';
    final response = await client.post(
      url,
      body: {"email": "eve.holt@reqres.in", "password": "cityslicka"},
    );
    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }
}
