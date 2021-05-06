import 'package:akudo_task/modules/transaction/bloc/transaction_event.dart';
import 'package:akudo_task/modules/transaction/bloc/transaction_state.dart';
import 'package:akudo_task/modules/transaction/models/transaction_model.dart';
import 'package:akudo_task/modules/transaction/repos/transaction_repository.dart';
import 'package:bloc/bloc.dart';

class TransactionBloc extends Bloc<TransactionEvents,TransactionState>{
  final TransactionsRepository transactionsRepository;

  TransactionBloc({this.transactionsRepository}) : super(null);

  TransactionState get initialState => TransactionInitState();
  @override
  Stream<TransactionState> mapEventToState(TransactionEvents event) async* {
    if (event is RequestMoneyEvent) {
      try {
        Transaction transaction = await transactionsRepository.payMoney(
            event.amount, event.description, event.senderId);
        yield TransactionSuccessful(transaction: transaction);
      } catch (e) {
        yield TransactionFailed();
      }
    }
    else if (event is PayMoneyEvent) {
      if (event is RequestMoneyEvent) {
        try {
          Transaction transaction = await transactionsRepository.payMoney(
              event.amount, event.description, event.receiverId);
          yield MoneyRequested(transaction: transaction);
        } catch (e) {
          yield MoneyRequestFailed();
        }
      }
    }
  }
}