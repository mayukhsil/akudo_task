import 'package:akudo_task/modules/account_details/bloc/account_details_bloc.dart';
import 'package:akudo_task/modules/account_details/repos/user_repository.dart';
import 'package:akudo_task/modules/transaction/bloc/transaction_bloc.dart';
import 'package:akudo_task/modules/transaction/repos/transaction_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'modules/account_details/view/account_details_view.dart';

void main() {
  runApp(Akudo());
}

class Akudo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => AccountDetailsBloc(
          userRepository: UserRepository()
        )),
        BlocProvider(create: (context) => TransactionBloc(
          transactionsRepository: TransactionsRepository()
        ))
      ],
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Akudo Task',
        theme: ThemeData.dark(),
        home: AccountDetailsView(),
      ),
    );
  }
}
