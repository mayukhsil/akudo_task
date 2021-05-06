import 'package:akudo_task/modules/account_details/models/user_model.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

abstract class AccountDetailsState extends Equatable{
  @override
  List<Object> get props => [];
}

class AccountInitState extends AccountDetailsState{
  AccountInitState();
}

class UserDetailsLoadedState extends AccountDetailsState{
  final User userDetails;
  final int friendId;
  UserDetailsLoadedState({@required this.userDetails,this.friendId}):assert (userDetails!=null);
}

class UserDetailsLoadingState extends AccountDetailsState{
  UserDetailsLoadingState();
}

