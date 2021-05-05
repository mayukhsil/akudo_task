import 'package:akudo_task/modules/account_details/models/user_model.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

abstract class AccountDetailsState extends Equatable{}

class LoadUserDetails extends AccountDetailsState{
  @override
  List<Object> get props => [];
}

class UserDetailsLoaded extends AccountDetailsState{
  final User userDetails;
  UserDetailsLoaded({@required this.userDetails}):assert (userDetails!=null);

  @override
  List<Object> get props => null;
}

class AddUserFriend extends AccountDetailsState{
  final int friendId;
  AddUserFriend({@required this.friendId});

  @override
  List<Object> get props => null;
}