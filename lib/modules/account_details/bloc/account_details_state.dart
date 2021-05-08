import 'package:akudo_task/modules/account_details/models/user_model.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

abstract class AccountDetailsState extends Equatable{
  @override
  List<Object> get props => [];
}


class UserDetailsLoadedState extends AccountDetailsState{
  final User userDetails;
  UserDetailsLoadedState({@required this.userDetails});
}

class UserDetailsLoadingState extends AccountDetailsState{
  UserDetailsLoadingState();
}

