part of 'register_bloc.dart';

@immutable
abstract class RegisterState extends Equatable {}

class EmpityRegisterIState extends RegisterState {
  @override
  // TODO: implement props
  List<Object> get props =>  [];
}

class LoadedRegisterState extends RegisterState {
  final String massage;

  LoadedRegisterState({@required this.massage});

  @override
  // TODO: implement props
  List<Object> get props => [massage];
}

class LoadingRegisterState extends RegisterState {
  @override
  // TODO: implement props
  List<Object> get props => [];
}

class ErrorRegisterState extends RegisterState {
  final String massage;

  ErrorRegisterState({@required this.massage});

  @override
  // TODO: implement props
  List<Object> get props => [massage];
}
