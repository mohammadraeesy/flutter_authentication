import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_authentication/core/error/failures.dart';
import 'package:flutter_authentication/core/usecases/usecase.dart';
import 'package:flutter_authentication/futures/authentication/domain/repositories/authentication_repositorie.dart';
import 'package:flutter_authentication/futures/authentication/domain/repositories/register_repository.dart';

class RegisterUsecase implements UseCase<bool, Params> {
  final RegisterRepository repository;

  RegisterUsecase({@required this.repository});

  @override
  Future<Either<Failure, bool>> call(Params params) async {
    return await repository.register(
        username: params.username,
        password: params.password,
        email: params.email,
        fisrtname: params.fisrtname,
        lastname: params.lastname,
        phoneNumber: params.phoneNumber);
  }
}

class Params extends Equatable {
  final String username;
  final String password;
  final String fisrtname;
  final String lastname;
  final String email;
  final String phoneNumber;

  Params(
      {@required this.username,
      @required this.phoneNumber,
      @required this.email,
      @required this.lastname,
      @required this.fisrtname,
      @required this.password});

  @override
  // TODO: implement props
  List<Object> get props =>
      [username, password, fisrtname, lastname, email, phoneNumber];
}
