import 'package:akudo_task/config/colors.dart';
import 'package:akudo_task/config/styles.dart';
import 'package:akudo_task/modules/account_details/bloc/account_details_bloc.dart';
import 'package:akudo_task/modules/account_details/bloc/account_details_state.dart';
import 'package:akudo_task/modules/account_details/models/user_model.dart';
import 'package:akudo_task/modules/account_details/repos/user_repository.dart';
import 'package:akudo_task/modules/transaction/view/transaction_view.dart';
import 'package:animations/animations.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AccountDetailsView extends StatefulWidget {

  @override
  _AccountDetailsViewState createState() => _AccountDetailsViewState();
}

class _AccountDetailsViewState extends State<AccountDetailsView> {

  AccountDetailsBloc _accountBlocSink;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _accountBlocSink.close();
  }

  var transactionStatus;
  var res;

  String returnStatus({String status}){
    if(status == 'true'){
      return 'Success';
    }
    else
      return 'Failed';
  }

  @override
  Widget build(BuildContext context) {

    final Size screenSize = MediaQuery.of(context).size;
    _accountBlocSink = BlocProvider.of<AccountDetailsBloc>(context);

    ScreenUtil.init(
        BoxConstraints(
            maxHeight: screenSize.height, maxWidth: screenSize.width),
        designSize: Size(screenSize.width, screenSize.height));

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(20.sp),
          child: BlocBuilder<AccountDetailsBloc, AccountDetailsState>(
            builder: (context, state) {
              if(state is UserDetailsLoadingState){
                return CircularProgressIndicator();
              }
              return Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      CircleAvatar(),
                      SizedBox(
                        width: 8.sp,
                      ),
                      Text(
                        'User Name',
                        style: size18,
                      )
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Amount',
                            style: size14.copyWith(color: Colors.white38),
                          ),
                          Text('Rs. ${_accountBlocSink.userRepository.getUserDetails().accountBalance}', style: size30),
                        ],
                      ),
                      SizedBox(
                        height: 30.sp,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Total reward points',
                            style: size14.copyWith(color: Colors.white38),
                          ),
                          Text(
                            '${_accountBlocSink.userRepository.getUserDetails().rewards.length}',
                            style: size30,
                          )
                        ],
                      ),
                      SizedBox(
                        height: 30.sp,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Recent Transactions',
                            style: size14.copyWith(color: Colors.white38),
                          ),
                          SizedBox(
                            height: 5.sp,
                          ),
                          ListView.builder(
                            itemCount: 2,
                            physics: NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            scrollDirection: Axis.vertical,
                            itemBuilder: (context,item){
                              return Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Rs. ${_accountBlocSink.userRepository.getUserDetails().transactions[item].amount} Sent to Friend ${_accountBlocSink.userRepository.getUserDetails().transactions[item].id}',
                                    style: size18,
                                  ),
                                  Text(
                                    res = returnStatus(status: _accountBlocSink.userRepository.getUserDetails().transactions[item].isDebit.toString()
                                    ),
                                    style: size18.copyWith(color: res == 'Success'?Colors.green:Colors.red),
                                  )
                                ],
                              );
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                  OpenContainer(
                    openColor: Colors.grey,
                    closedColor: appGreenColor,
                    openBuilder: (BuildContext context,
                        void Function({Object returnValue}) action) {
                      return TransactionView(_accountBlocSink.userRepository.getUserDetails().userFriends.map((e) => e.toString()).toList());
                    },
                    closedBuilder:
                        (BuildContext context, void Function() action) {
                      return Container(
                        height: 60.sp,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            color: appGreenColor,
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(10),
                                bottomRight: Radius.circular(10))),
                        child: Center(
                            child: Text(
                          'Send Money',
                          style: size18.copyWith(
                            fontWeight: FontWeight.bold,
                              color: Colors.black87,
                          ),
                        )),
                      );
                    },
                  )
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
