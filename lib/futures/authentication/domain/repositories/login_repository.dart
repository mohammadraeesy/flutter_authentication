import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_authentication/core/error/failures.dart';
import 'package:flutter_authentication/futures/authentication/domain/entities/authentication.dart';

abstract class LoginRepository {
  Future<Either<Failure, Authentication>> Login(
      {@required String username, @required String password});

  /*Future<Either<Failure, bool>> register(
      {@required String username,
      @required String password,
      @required String phoneNumber,
      @required String email,
      @required String fisrtname,
      @required String lastname});*/
}
