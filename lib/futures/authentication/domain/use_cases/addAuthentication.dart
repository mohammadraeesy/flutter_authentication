import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_authentication/core/error/failures.dart';
import 'package:flutter_authentication/core/usecases/usecase.dart';
import 'package:flutter_authentication/futures/authentication/domain/entities/authentication.dart';
import 'package:flutter_authentication/futures/authentication/domain/repositories/authentication_repositorie.dart';

class AddAuthenticationUsecase implements UseCase<bool, Params> {
  final AuthenticationRepository repository;

  AddAuthenticationUsecase({@required this.repository});

  @override
  Future<Either<Failure, bool>> call(Params params) async {
    Authentication tempAuthentication = Authentication(
        token: params.token,
        Expiration: params.Expiration,
        RefreshToken: params.RefreshToken);
    return await repository.addAuthentication(tempAuthentication);
  }
}

class Params extends Equatable {
  final String token;
  final String RefreshToken;
  final DateTime Expiration;

  Params(
      {@required this.RefreshToken,
      @required this.token,
      @required this.Expiration});

  @override
  // TODO: implement props
  List<Object> get props => [RefreshToken, token, Expiration];
}
