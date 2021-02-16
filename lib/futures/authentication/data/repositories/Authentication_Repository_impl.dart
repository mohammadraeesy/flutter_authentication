import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_authentication/core/error/exceptions.dart';
import 'package:flutter_authentication/core/error/failures.dart';
import 'package:flutter_authentication/core/network/network_info.dart';
import 'package:flutter_authentication/futures/authentication/data/data_sources/authentication_data_source.dart';
import 'package:flutter_authentication/futures/authentication/data/data_sources/login_data_source.dart';
import 'package:flutter_authentication/futures/authentication/data/models/login_model.dart';
import 'package:flutter_authentication/futures/authentication/domain/entities/authentication.dart';
import 'package:flutter_authentication/futures/authentication/domain/repositories/authentication_repositorie.dart';

class AuthenticationRepositoryImpl implements AuthenticationRepository {
  final AuthenticationDataSources dataSources;

  // final LoginDataSourceImpl loginDataSource;
//  final NetworkInfo networkInfo;

  AuthenticationRepositoryImpl(
      {@required this.dataSources,});

  @override
  Future<Either<Failure, bool>> deleteAuthentication() {
    try {
      dataSources.deleteAuthentication();
      return Future.value(Right(true));
    } on CacheException {
      return Future.value(Right(false));
    }
  }

  @override
  Future<Either<Failure, bool>> checkAuthentication() async {
    try {
      final bool isUserAuthenticated = await dataSources.checkToken();
      return Right(isUserAuthenticated);
    } on CacheException {
      return Right(false);
    }
  }

  @override
  Future<Either<Failure, bool>> addAuthentication(
      Authentication tempAuthentication) {
    try {
      dataSources.addAuthentication(tempAuthentication);
      return Future.value(Right(true));
    } on CacheException {
      return Future.value(Right(false));
    }
  }

  @override
  Future<Either<Failure, Authentication>> findAuthentication() async {
    final localAuthentication = await dataSources.findToken();
    if (localAuthentication != null) {
      return Right(localAuthentication);
    } else {
      return Left(CacheFailureToken());
    }
  }

  // @override
  // Future<Either<Failure, Authentication>> Login(
  //     {String username, String password}) async {
  //   if (await networkInfo.isConnected) {
  //     try {
  //       final response = await loginDataSource.getAuthentication(
  //           LoginModel(username: username, password: password));
  //       return Right(response);
  //     } on ServerException {
  //       Left(ServerFailure());
  //     }
  //   } else
  //     throw ServerFailure();
  // }
}
