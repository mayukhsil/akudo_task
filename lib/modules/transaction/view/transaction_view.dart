import 'package:akudo_task/config/colors.dart';
import 'package:akudo_task/config/styles.dart';
import 'package:akudo_task/modules/transaction/widgets/modal_sheet.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:random_color/random_color.dart';
import 'package:dropdown_search/dropdown_search.dart';



class TransactionView extends StatelessWidget {

  final RandomColor _randomColor = RandomColor();

  @override
  Widget build(BuildContext context) {
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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Friends',style: size14.copyWith(color: Colors.white38),),
              SizedBox(height: 10.sp,),
              Container(
                height: 50.sp,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    itemCount: 3,
                    itemBuilder: (context,item){
                      return Row(
                        children: [
                          CircleAvatar(
                            radius: 25,
                            // maxRadius: 50,
                            backgroundColor: _randomColor.randomColor(colorHue: ColorHue.red),
                          ),
                          SizedBox(width: 20.sp,),
                          // item>=2?
                          // GestureDetector(
                          //   onTap: (){},
                          //   child: Container(
                          //     height: 25.sp,
                          //     width: 25.sp,
                          //     decoration: BoxDecoration(
                          //         color: Colors.grey.shade600
                          //     ),
                          //     child: Center(child: Icon(Icons.add)),
                          //   ),
                          // ):Container(),
                        ],
                      );
                    }
                    ),
              ),
              SizedBox(height: 30.sp,),
              Center(
                child: GestureDetector(
                  onTap: (){
                    //TODO add friend
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
                      showCustomModalSheet(
                          hint: 'Send',
                          receiver: 'to',
                          transactionType: 'Sender',
                          btnText: 'Send Money',
                          color: Colors.greenAccent,
                          onModalPress: (){
                            //TODO send money
                          }
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
                        }
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
          ),
        ),
      ),
    );
  }
}
