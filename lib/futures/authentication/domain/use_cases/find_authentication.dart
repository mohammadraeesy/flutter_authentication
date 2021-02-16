import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_authentication/core/error/failures.dart';
import 'package:flutter_authentication/core/usecases/usecase.dart';
import 'package:flutter_authentication/futures/authentication/domain/entities/authentication.dart';
import 'package:flutter_authentication/futures/authentication/domain/repositories/authentication_repositorie.dart';

class FindAuthenticationUsecase implements UseCase<Authentication, NoParams> {
  final AuthenticationRepository repository;

  FindAuthenticationUsecase({@required this.repository});

  @override
  Future<Either<Failure, Authentication>> call(NoParams params) async {
    return await repository.findAuthentication();
  }
}
