import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_authentication/core/error/failures.dart';
import 'package:flutter_authentication/futures/authentication/domain/entities/authentication.dart';

abstract class AuthenticationRepository {
  Future<Either<Failure, bool>> checkAuthentication();

  Future<Either<Failure, bool>> addAuthentication(
      Authentication tempAuthentication);

  Future<Either<Failure, bool>> deleteAuthentication();

  Future<Either<Failure, Authentication>> findAuthentication();

  // Future<Either<Failure, Authentication>> Login(
  //     {@required String username, @required String password});

  /*Future<Either<Failure, bool>> register(
      {@required String username,
      String password,
      String phoneNumber,
      String email,
      String fisrtname,
      String lastname});*/
}
