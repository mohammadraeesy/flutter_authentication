import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_authentication/core/error/exceptions.dart';
import 'package:flutter_authentication/core/error/failures.dart';
import 'package:flutter_authentication/core/network/network_info.dart';
import 'package:flutter_authentication/futures/authentication/data/data_sources/register_data_source.dart';
import 'package:flutter_authentication/futures/authentication/data/models/register_model.dart';
import 'package:flutter_authentication/futures/authentication/domain/repositories/register_repository.dart';

class RegisterRepositoryImpl implements RegisterRepository {
  final RegisterDataSource registerDataSource;
  final NetworkInfo networkInfo;

  RegisterRepositoryImpl({
      @required this.networkInfo, @required this.registerDataSource});

  @override
  Future<Either<Failure, bool>> register(
      {String username,
      String password,
      String phoneNumber,
      String email,
      String fisrtname,
      String lastname}) async {
    if (await networkInfo.isConnected) {
      try {
        final bool response = await registerDataSource.register(RegisterModel(
            lastname: lastname,
            fisrtname: fisrtname,
            email: email,
            password: password,
            username: username,
            phonenumber: phoneNumber));
        if (response) {
          return Right(response);
        } else {
          return Right(response);
        }
      } on ServerException {
        throw ServerException();
      }
    }
  }
}
