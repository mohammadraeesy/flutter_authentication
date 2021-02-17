part of 'login_bloc.dart';

@immutable
abstract class LoginState extends Equatable{}

class Empty extends LoginState {
  @override
  // TODO: implement props
  List<Object> get props => [];
}

class LoadingState extends LoginState {
  @override
  // TODO: implement props
  List<Object> get props => [];
}

class LoadedState extends LoginState {
  final String massage;

  LoadedState({@required this.massage});

  @override
  // TODO: implement props
  List<Object> get props => [massage];
}

class ErrorState extends LoginState {
  final String massage;

  ErrorState({@required this.massage});

  @override
  // TODO: implement props
  List<Object> get props => [massage];
}
