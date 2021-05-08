import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

abstract class AccountDetailsEvent extends Equatable{
  @override
  List<Object> get props => null;
}

class LoadUserDetailsEvent extends AccountDetailsEvent {
  LoadUserDetailsEvent();
}

class AddUserFriendEvent extends AccountDetailsEvent {
  final int friendId;
  AddUserFriendEvent({this.friendId});
}