part of 'login_bloc.dart';

@immutable
abstract class LoginEvent extends Equatable{}

class LoginBtnPreesEvent extends LoginEvent {
  final String username;
  final String password;

  LoginBtnPreesEvent({@required this.password, @required this.username});

  @override
  // TODO: implement props
  List<Object> get props => [username,password];
}
