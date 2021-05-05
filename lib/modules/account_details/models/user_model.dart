import 'package:akudo_task/modules/account_details/models/reward_model.dart';
import 'package:akudo_task/modules/transaction/models/transaction_model.dart';
import 'package:equatable/equatable.dart';

class User extends Equatable {
  final int id;
  final double accountBalance;
  List<Reward> rewards = [];
  List<Transaction> transactions = [];
  List<int> userFriends = [];
  User(this.id, this.accountBalance,
      {this.rewards, this.transactions, this.userFriends});
  @override
  List<Object> get props => [id];
  @override
  String toString() {
    return 'User { id: $id, amount: $accountBalance}';
  }
}
