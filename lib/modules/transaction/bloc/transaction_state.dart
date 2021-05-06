import 'package:akudo_task/modules/transaction/models/transaction_model.dart';
import 'package:equatable/equatable.dart';

abstract class TransactionState extends Equatable{
  @override
  List<Object> get props => [];
}

class TransactionInitState extends TransactionState{}

class TransactionSuccessful extends TransactionState{
  final Transaction transaction;
  TransactionSuccessful({this.transaction});
}

class TransactionFailed extends TransactionState{
  final String message ;
  TransactionFailed({this.message = 'Unfortunately! The transaction has failed!'});
}

class MoneyRequested extends TransactionState{
  final Transaction transaction;
  MoneyRequested({this.transaction});
}

class MoneyRequestFailed extends TransactionState{
  final String message ;
  MoneyRequestFailed({this.message = 'Unfortunately! The transaction has failed!'});
}
