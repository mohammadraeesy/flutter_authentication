import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_authentication/core/error/failures.dart';
import 'package:flutter_authentication/core/usecases/usecase.dart';
import 'package:flutter_authentication/futures/authentication/domain/entities/authentication.dart';
import 'package:flutter_authentication/futures/authentication/domain/repositories/authentication_repositorie.dart';
import 'package:flutter_authentication/futures/authentication/domain/repositories/login_repository.dart';

class LoginUsecase implements UseCase<Authentication, Params> {
  final LoginRepository repository;

  LoginUsecase({@required this.repository});

  @override
  Future<Either<Failure, Authentication>> call(Params params) async {
    return await repository.Login(
        password: params.password, username: params.username);
  }
}

class Params extends Equatable {
  final String username;
  final String password;

  Params({@required this.username, this.password});

  @override
  // TODO: implement props
  List<Object> get props => [username, password];
}
