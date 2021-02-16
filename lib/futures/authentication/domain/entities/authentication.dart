import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

class Authentication extends Equatable {
  DateTime Expiration;
  String token;
  String RefreshToken;
  bool chekToken;
  Authentication({@required this.Expiration,@required this.token,@required this.RefreshToken});

  @override
  // TODO: implement props
  List<Object> get props => [Expiration,token,RefreshToken,chekToken];
}