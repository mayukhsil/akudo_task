import 'package:akudo_task/modules/account_details/models/reward_model.dart';
import 'package:equatable/equatable.dart';

class Transaction extends Equatable {
  String id;
  double amount;
  int receiverId;
  String description = "";
  Reward rewardReceived = null;
  bool isDebit;
  Transaction(this.id, this.amount, this.receiverId, this.isDebit,
      {this.description, this.rewardReceived});
  @override
  List<Object> get props => [id, amount, receiverId];
  @override
  String toString() {
    return 'Transaction { id: $id, amount: $amount, receiverId: $receiverId}';
  }
}