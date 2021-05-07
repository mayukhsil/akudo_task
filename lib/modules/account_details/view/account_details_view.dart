import 'package:akudo_task/config/colors.dart';
import 'package:akudo_task/config/styles.dart';
import 'package:akudo_task/modules/account_details/bloc/account_details_bloc.dart';
import 'package:akudo_task/modules/account_details/bloc/account_details_state.dart';
import 'package:akudo_task/modules/transaction/view/transaction_view.dart';
import 'package:animations/animations.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AccountDetailsView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;

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
                          Text('Rs. 10,235.5', style: size30),
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
                            '425',
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
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Rs.55.0 Sent to Friend 2',
                                style: size18,
                              ),
                              Text(
                                'Successful',
                                style: size18.copyWith(color: Colors.green),
                              )
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Rs.55.0 Sent to Friend 2',
                                style: size18,
                              ),
                              Text(
                                'Failed',
                                style: size18.copyWith(color: Colors.red),
                              )
                            ],
                          )
                        ],
                      ),
                    ],
                  ),
                  OpenContainer(
                    openColor: Colors.grey,
                    closedColor: appGreenColor,
                    openBuilder: (BuildContext context,
                        void Function({Object returnValue}) action) {
                      return TransactionView();
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
