import 'dart:async';
import 'dart:core';
import 'dart:core';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_authentication/core/error/failures.dart';
import 'package:flutter_authentication/futures/authentication/domain/use_cases/register_usecase.dart';
import 'package:flutter_authentication/futures/authentication/presentation/bloc/loginBloc/login_bloc.dart';
import 'package:meta/meta.dart';

part 'register_event.dart';
part 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  final RegisterUsecase registerUsecase;
  RegisterBloc({@required RegisterUsecase usecase}) :assert(usecase!=null),registerUsecase = usecase, super(EmpityRegisterIState());

  @override
  Stream<RegisterState> mapEventToState(
    RegisterEvent event,
  ) async* {
    if (event is BtnPressRegisterEvent) {
      yield LoadingRegisterState();
      //yield* _startProcessLogin(event.username, event.password);
      final Either<Failure, bool> failureOrRegister =
      await registerUsecase(Params(
          username: event.username,
          password: event.password,
          fisrtname: event.firstname,
          lastname: event.lastname,
          phoneNumber: event.phoneNumber,
          email: event.email));
      yield failureOrRegister.fold(
            (failure) => ErrorRegisterState(massage: 'ERROR'),
            (respons) {
          if (respons) {
            return LoadedRegisterState(massage: 'successfully Login');
          } else {
            return ErrorRegisterState(massage: 'Error');
          }
        },
      );
    } else {
      yield ErrorRegisterState(massage: 'ERROR');
    }
  }
}
