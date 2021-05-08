import 'package:akudo_task/config/colors.dart';
import 'package:akudo_task/config/styles.dart';
import 'package:akudo_task/modules/transaction/bloc/transaction_bloc.dart';
import 'package:akudo_task/modules/transaction/bloc/transaction_event.dart';
import 'package:akudo_task/modules/transaction/bloc/transaction_state.dart';
import 'package:akudo_task/modules/transaction/widgets/modal_sheet.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:random_color/random_color.dart';
import 'package:dropdown_search/dropdown_search.dart';


class TransactionView extends StatelessWidget {

  final List<String> users;
  TransactionView(this.users);

  final RandomColor _randomColor = RandomColor();

  var amount;
  var desc;
  var recId;

  @override
  Widget build(BuildContext context) {
    final _transactionBlocSink = BlocProvider.of<TransactionBloc>(context);
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: GestureDetector(
          onTap: (){
            Get.back();
          },
          child: Icon(Icons.arrow_back_ios),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(20.sp),
          child: BlocBuilder<TransactionBloc,TransactionState>(
            builder: (context, state){
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Friends',style: size14.copyWith(color: Colors.white38),),
                  SizedBox(height: 10.sp,),
                  Container(
                    height: 50.sp,
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        itemCount: users.length,
                        itemBuilder: (context,item){
                          return Row(
                            children: [
                              CircleAvatar(
                                radius: 25,
                                // maxRadius: 50,
                                backgroundColor: _randomColor.randomColor(colorHue: ColorHue.red),
                              ),
                              SizedBox(width: 20.sp,),
                            ],
                          );
                        }
                    ),
                  ),
                  SizedBox(height: 30.sp,),
                  Center(
                    child: GestureDetector(
                      onTap: (){

                      },
                      child: Container(
                        height: 40.sp,
                        width: 150.sp,
                        decoration: BoxDecoration(
                            color: Colors.deepOrange.shade700,
                            borderRadius: BorderRadius.circular(20)),
                        child: Center(
                          child: Text(
                            'Add Friend',
                            style: size18.copyWith(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 30.sp,),
                  Text('Send/Receive Money',style: size14.copyWith(color: Colors.grey),),
                  SizedBox(height: 10.sp,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: (){
                          // showCustomModalSheet(
                          //     hint: 'Send',
                          //     receiver: 'to',
                          //     transactionType: 'Sender',
                          //     btnText: 'Send Money',
                          //     color: Colors.greenAccent,
                          //     users: users
                          // );
                          Get.bottomSheet(
                              Container(
                                height: Get.height / 2.2,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                    color: Colors.grey.shade700,
                                    borderRadius: BorderRadius.only(topLeft: Radius.circular(10),topRight: Radius.circular(10))
                                ),
                                child: Padding(
                                  padding: EdgeInsets.all(20.sp),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Text('Sent Money to',style: size18,),
                                          SizedBox(width: 10.sp,),
                                          Container(
                                            height: 45.sp,
                                            width: 160.sp,
                                            child: DropdownSearch<String>(
                                              mode: Mode.DIALOG,
                                              items: users,
                                              hint: 'Select Sender',
                                              validator: (v){
                                                if(v.isEmpty){
                                                  return 'Sender cannot be empty';
                                                }
                                                else{
                                                  recId = v;
                                                }
                                                return null;
                                              },
                                            ),
                                          ),
                                        ],
                                      ),
                                      Column(
                                        children: [
                                          Text('Amount',style: size24,),
                                          Container(
                                            width: 180.sp,
                                            height: 60.sp,
                                            child: FormBuilderTextField(
                                              style: size24,
                                              validator: (v){
                                                if(v.isEmpty){
                                                  return 'Amount cannot be empty';
                                                }
                                                else {
                                                  amount = v;
                                                }
                                                return null;
                                              },
                                              keyboardType: TextInputType.number,
                                              decoration: InputDecoration(
                                                  prefix: Text('\u20B9'),
                                                  border: OutlineInputBorder(
                                                      borderRadius: BorderRadius.circular(10),
                                                      borderSide: BorderSide(
                                                          color: Colors.white,
                                                          width: 1
                                                      )
                                                  )
                                              ),
                                              name: 'text_field',
                                            ),
                                          ),
                                          SizedBox(height: 10.sp,),
                                          Container(
                                            height: 45.sp,
                                            child: FormBuilderTextField(
                                              style: size16,
                                              validator: (v){
                                                if(v.isEmpty){

                                                }
                                                else{
                                                  desc = v;
                                                }
                                                return null;
                                              },
                                              textAlign: TextAlign.center,
                                              decoration: InputDecoration(
                                                  hintText: 'Description',
                                                  border: OutlineInputBorder(
                                                      borderRadius: BorderRadius.circular(10),
                                                      borderSide: BorderSide(
                                                          color: Colors.white,
                                                          width: 1
                                                      )
                                                  )
                                              ),
                                              name: 'text_field',
                                            ),
                                          ),
                                        ],
                                      ),
                                      InkWell(
                                        onTap: () {
                                          _transactionBlocSink.transactionsRepository.payMoney(amount, desc, recId);
                                          Get.back();
                                        },
                                        child: Container(
                                          height: 60.sp,
                                          width: double.infinity,
                                          decoration: BoxDecoration(
                                              color: Colors.green,
                                              borderRadius: BorderRadius.circular(20)),
                                          child: Center(
                                            child: Text(
                                              'Send Money',
                                              style: size18.copyWith(
                                                fontWeight: FontWeight.bold,
                                                color: Colors.white,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              )
                          );
                        },
                        child: Container(
                          height: 60.sp,
                          width: 180.sp,
                          decoration: BoxDecoration(
                              color: Colors.greenAccent,
                              borderRadius: BorderRadius.circular(20)
                          ),
                          child: Center(
                            child: Text('Send',
                              style: size18.copyWith(
                                  color: Colors.black87,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: (){
                          showCustomModalSheet(
                              hint: 'Receive',
                              receiver: 'from',
                              transactionType: 'Receiver',
                              btnText: 'Request Money',
                              color: Colors.orangeAccent,
                              onModalPress: (){
                                //TODO request money
                              },

                          );
                        },
                        child: Container(
                          height: 60.sp,
                          width: 180.sp,
                          decoration: BoxDecoration(
                              color: Colors.orangeAccent,
                              borderRadius: BorderRadius.circular(100)
                          ),
                          child: Center(child: Text('Receive',
                            style: size18.copyWith(
                                color: Colors.black87,
                                fontWeight: FontWeight.bold),
                          ),
                          ),
                        ),
                      )
                    ],
                  )
                ],
              );
            },
          )
        ),
      ),
    );
  }
}
