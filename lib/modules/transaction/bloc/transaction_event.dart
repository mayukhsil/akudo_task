import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

abstract class TransactionEvents extends Equatable{
  @override
  List<Object> get props => [];
}

class PayMoneyEvent extends TransactionEvents{
  final double amount;
  final String description;
  final int receiverId;
  PayMoneyEvent({@required this.amount,this.description,@required this.receiverId});
}

class RequestMoneyEvent extends TransactionEvents{
  final double amount;
  final String description;
  final int senderId;
  RequestMoneyEvent({@required this.amount,this.description,@required this.senderId});
}

