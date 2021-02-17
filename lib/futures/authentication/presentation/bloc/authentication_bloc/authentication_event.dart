part of 'authentication_bloc.dart';

@immutable
abstract class AuthenticationEvent extends Equatable{}

class AppStarted extends AuthenticationEvent {
  @override
  // TODO: implement props
  List<Object> get props => throw UnimplementedError();
}

class LoginEventAuthentication extends AuthenticationEvent {
  final String token;
  final String refreshToken;
  final DateTime expiration;

  LoginEventAuthentication(
      {@required this.token,
      @required this.refreshToken,
      @required this.expiration});

  @override
  // TODO: implement props
  List<Object> get props => [token,refreshToken,expiration];
}

class AuthenticationLogoutEvent extends AuthenticationEvent {
  @override
  // TODO: implement props
  List<Object> get props => [];
}

class CheckAuthenticationEvent extends AuthenticationEvent {
  @override
  // TODO: implement props
  List<Object> get props => [];
}


