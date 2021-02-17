import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_authentication/core/error/failures.dart';
import 'package:flutter_authentication/futures/authentication/domain/entities/authentication.dart';
import 'package:flutter_authentication/futures/authentication/domain/use_cases/login_usecase.dart';
import 'package:flutter_authentication/futures/authentication/presentation/bloc/authentication_bloc/authentication_bloc.dart';
import 'package:meta/meta.dart';

part 'login_event.dart';

part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final LoginUsecase loginUsecase;
  final AuthenticationBloc authenticationBloc;

  LoginBloc(
      {@required LoginUsecase loginUsecase,
      @required AuthenticationBloc authenticationBloc})
      : assert(loginUsecase != null),
        assert(authenticationBloc != null),
        loginUsecase = loginUsecase,
        authenticationBloc = authenticationBloc,
        super(Empty());

  @override
  Stream<LoginState> mapEventToState(
    LoginEvent event,
  ) async* {
    if (event is LoginBtnPreesEvent) {
      yield LoadingState();
      Either<Failure, Authentication> failureOrLogin = await loginUsecase(
          Params(username: event.username, password: event.password));
      yield failureOrLogin.fold((failure) => ErrorState(massage: 'ERROR'),
          (authentication) {
        authenticationBloc.add(
          LoginEventAuthentication(
              token: authentication.token,
              refreshToken: authentication.RefreshToken,
              expiration: authentication.Expiration),
        );
        return LoadedState(massage: 'successfully Login');
      });
    }
  }
}
