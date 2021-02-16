import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_authentication/core/usecases/usecase.dart';
import 'package:flutter_authentication/futures/authentication/domain/use_cases/DeleteAuthentication.dart';
import 'package:flutter_authentication/futures/authentication/domain/use_cases/addAuthentication.dart';
import 'package:flutter_authentication/futures/authentication/domain/use_cases/chekAuthentication.dart';
import 'package:flutter_authentication/futures/authentication/domain/use_cases/find_authentication.dart';
import 'package:meta/meta.dart';

part 'authentication_event.dart';

part 'authentication_state.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  // final AddAuthenticationUsecase addAuthentication; // It should be use case.
  // final CheckAuthenticationUsecase checkAuthenticationUsecase;
  // final DeleteAuthenticationUsecase deleteAuthentication;
  final FindAuthenticationUsecase findAuthentication;

  AuthenticationBloc({@required FindAuthenticationUsecase find})
      : assert(find != null),
        findAuthentication = find,
        super(Uninitialized());

  // AuthenticationBloc(
  //     {@required AddAuthenticationUsecase add,
  //       @required CheckAuthenticationUsecase check,
  //       @required DeleteAuthenticationUsecase delete,
  //       @required FindAuthenticationUsecase find})
  //     : assert(add != null),
  //       assert(check != null),
  //       assert(delete != null),
  //       assert(find != null),
  //       addAuthentication = add,
  //       checkAuthenticationUsecase = check,
  //       deleteAuthentication = delete,
  //       findAuthentication = find,
  //       super(Uninitialized());

  // this value is temp and i will delete it after maded server

  @override
  Stream<AuthenticationState> mapEventToState(
    AuthenticationEvent event,
  ) async* {
    if (event is AppStarted) {
      yield* _mapAppStartedToState();
    } else if (event is LoginEventAuthentication) {
      //AuthenticationLoading
      yield* _mapLoggedInToState(
          event.token, event.refreshToken, event.expiration);
    } else if (event is LogoutEvent) {
      //AuthenticationLoading
      // yield* _mapLoggedOutToState();
    } else if (event is CheckAuthenticationEvent) {
      // develop later
    }
  }

  Stream<AuthenticationState> _mapAppStartedToState() async* {
    try {
      // await findAuthentication(NoParams())
      final checkToken = null;
      //splash
      await Future.delayed(const Duration(seconds: 10));
      if (checkToken != null) {
        yield Authenticated();
      } else
        yield Unauthenticated();
    } catch (exception) {
      yield Unauthenticated();
    }
  }

  Stream<AuthenticationState> _mapLoggedInToState(
      String token, String refreshToken, DateTime expiredToken) async* {
    final bool checkAuthentication = true;
    // addAuthentication(Params(
    //     token: token,
    //     RefreshToken: refreshToken,
    //     Expiration: expiredToken)) as bool;
    if (checkAuthentication) {
      yield Authenticated();
    } else {
      yield Unauthenticated();
    }
  }
}
