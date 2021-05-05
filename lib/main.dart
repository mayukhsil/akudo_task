import 'package:akudo_task/modules/account_details/bloc/account_details_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
          userRepository:
        ))
      ],
      child: MaterialApp(
        title: 'Akudo Task',
        home: AccountDetailsView(),
      ),
    );
  }
}
