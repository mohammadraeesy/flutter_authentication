import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter_authentication/core/error/exceptions.dart';
import 'package:flutter_authentication/futures/authentication/data/models/authenticationModel.dart';
import 'package:flutter_authentication/futures/authentication/data/models/login_model.dart';
import 'package:flutter_authentication/futures/authentication/domain/entities/authentication.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

abstract class AuthenticationDataSources {
  Future<void> addAuthentication(AuthenticationModel authenticationCash);

  Future<bool> deleteAuthentication();

  Future<bool> checkToken();

  Future<AuthenticationModel> findToken();
}

class AuthenticationDataSourcesImpl implements AuthenticationDataSources {
  static const String CASHED_AUTHENTICATION_TOKEN =
      'CASHED_AUTHENTICATION_TOKEN';

  final SharedPreferences sharedPreferences;

  AuthenticationDataSourcesImpl({@required this.sharedPreferences});

  @override
  Future<bool> deleteAuthentication() {
    final token = sharedPreferences.getString(CASHED_AUTHENTICATION_TOKEN);
    if (token.isNotEmpty) {
      sharedPreferences.remove(CASHED_AUTHENTICATION_TOKEN);
      return Future.value(true);
    } else
      throw CacheException();
  }

  @override
  Future<bool> checkToken() {
    final token = sharedPreferences.getString(CASHED_AUTHENTICATION_TOKEN);
    if (token != null && token.isNotEmpty) {
      return Future.value(true);
    } else {
      return Future.value(false);
    }
  }

  @override
  Future<void> addAuthentication(AuthenticationModel authenticationCash) {
    return sharedPreferences.setString(
        CASHED_AUTHENTICATION_TOKEN, json.encode(authenticationCash.toJson()));
  }

  @override
  Future<AuthenticationModel> findToken() async {
    final jsonString = sharedPreferences.getString(CASHED_AUTHENTICATION_TOKEN);
    if (jsonString.isNotEmpty) {
      return Future.value(
          AuthenticationModel.fromJson(json.decode(jsonString)));
    }
  }
}
