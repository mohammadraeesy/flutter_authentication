import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_authentication/core/error/failures.dart';
import 'package:flutter_authentication/core/usecases/usecase.dart';
import 'package:flutter_authentication/futures/authentication/domain/entities/authentication.dart';
import 'package:flutter_authentication/futures/authentication/domain/repositories/authentication_repositorie.dart';

class DeleteAuthenticationUsecase implements UseCase<bool,NoParams>{
  AuthenticationRepository repository;
  DeleteAuthenticationUsecase({@required this.repository});

  @override
  Future<Either<Failure, bool>> call(NoParams params) async{
    return await repository.deleteAuthentication();
  }

}