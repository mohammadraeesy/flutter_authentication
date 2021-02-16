part of 'register_bloc.dart';

@immutable
abstract class RegisterEvent extends Equatable {}

class BtnPressRegisterEvent extends RegisterEvent {
  final String username;
  final String password;
  final String email;
  final String firstname;
  final String lastname;
  final String phoneNumber;

  BtnPressRegisterEvent(
      {@required this.phoneNumber,
      @required this.username,
      @required this.password,
      @required this.email,
      @required this.firstname,
      @required this.lastname});

  @override
  // TODO: implement props
  List<Object> get props => throw [phoneNumber,username,password,email,firstname,lastname];

}
