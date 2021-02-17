import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_authentication/core/error/exceptions.dart';
import 'package:flutter_authentication/core/error/failures.dart';
import 'package:flutter_authentication/core/network/network_info.dart';
import 'package:flutter_authentication/futures/authentication/data/data_sources/login_data_source.dart';
import 'package:flutter_authentication/futures/authentication/data/models/login_model.dart';
import 'package:flutter_authentication/futures/authentication/domain/entities/authentication.dart';
import 'package:flutter_authentication/futures/authentication/domain/repositories/login_repository.dart';

class LoginRepositoryImpl implements LoginRepository {
  final LoginDataSourceImpl loginDataSource;
  final NetworkInfo networkInfo;

  LoginRepositoryImpl({@required this.loginDataSource,@required this.networkInfo});

  @override
  Future<Either<Failure, Authentication>> Login(
      {String username, String password}) async {
    if (await networkInfo.isConnected) {
      try {
        final response = await loginDataSource.getAuthentication(
            LoginModel(username: username, password: password));
        return Right(response);
      } on ServerException {
        Left(ServerFailure());
      }
    } else
      throw ServerFailure();
  }
}
