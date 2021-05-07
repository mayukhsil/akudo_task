import 'package:akudo_task/config/styles.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


showCustomModalSheet(
    {String hint,
    String transactionType,
    String receiver,
    String btnText,
    Color color,
    Function onModalPress}){
  return Get.bottomSheet(
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
                  Text('$hint Money $receiver',style: size18,),
                  SizedBox(width: 10.sp,),
                  Container(
                    height: 45.sp,
                    width: 160.sp,
                    child: DropdownSearch<String>(
                      mode: Mode.DIALOG,
                      items: ['User 1','User 2','User 3'],
                      hint: 'Select $transactionType',
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
                    height: 50.sp,
                    child: FormBuilderTextField(
                      style: size16,
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
                onTap: onModalPress,
                child: Container(
                  height: 60.sp,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: color,
                      borderRadius: BorderRadius.circular(20)),
                  child: Center(
                    child: Text(
                      '$hint Money',
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
}