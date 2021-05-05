import 'package:equatable/equatable.dart';

abstract class AccountDetailsEvent extends Equatable{}

class UserDetails extends AccountDetailsEvent {
  @override
  List<Object> get props => [];
}

class RewardDetails extends AccountDetailsEvent {
  @override
  List<Object> get props => [];
}