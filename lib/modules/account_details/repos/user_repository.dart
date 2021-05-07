import 'package:akudo_task/modules/account_details/models/reward_model.dart';
import 'package:akudo_task/modules/account_details/models/user_model.dart';
import 'package:akudo_task/modules/transaction/models/transaction_model.dart';

class UserRepository {

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

  static User user = User(1, 1978.90,
      rewards: rewardList,
      transactions: transactionList,
      userFriends: userFriends);

  const UserRepository();

  User getUserDetails() {
    return user;
  }

  void addUserFriend(int friendId) {
    userFriends.add(friendId);
  }

  void addTransaction(Transaction transaction) {
    transactionList.add(transaction);
    rewardList.add(transaction.rewardReceived);
  }

  void addReward(Reward reward) {
    rewardList.add(reward);
  }
}
