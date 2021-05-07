import 'dart:math';
import 'package:akudo_task/modules/account_details/models/reward_model.dart';
import 'package:akudo_task/modules/account_details/models/user_model.dart';
import 'package:akudo_task/modules/transaction/models/transaction_model.dart';

class TransactionsRepository {

  static List<Reward> rewardList = [
    Reward("1", "First Reward"),
    Reward("2", "Second Reward")
  ];

  static List<Transaction> transactionList = [
    Transaction("1", 55.0, 2, true),
    Transaction("2", 980, 3, false),
    Transaction("3", 1050.0, 2, true)
  ];

  static List<int> userFriends = [2, 3, 4, 7];

  static User user = new User(1, 1978.90,
      rewards: rewardList,
      transactions: transactionList,
      userFriends: userFriends);

  const TransactionsRepository();

  Transaction payMoney(double amount, String description, int receiverId) {
    Random random = new Random();
    bool isSuccessful = random.nextBool();
    if (isSuccessful) {
      return new Transaction(random.nextInt(100).toString(), amount, receiverId, true);
    } else {
      throw Exception("Pay money was unsuccessful");
    }
  }

  Transaction requestMoney(double amount, String description, int senderId) {
    Random random = new Random();
    bool isSuccessful = random.nextBool();
    if (isSuccessful) {
      return new Transaction(random.nextInt(100).toString(), amount, senderId, false);
    } else {
      throw Exception("Request money was unsuccessful");
    }
  }

}