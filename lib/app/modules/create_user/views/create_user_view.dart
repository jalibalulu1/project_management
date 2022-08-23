import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../controllers/create_user_controller.dart';

// ignore: must_be_immutable
class CreateUserView extends GetView<CreateUserController> {
  CreateUserController _createUserController = Get.put(CreateUserController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 30.w),
          child: ListView(children: [
            SizedBox(
              height: 1.h,
            ),
            Lottie.asset('assets/images/lf20_1dmxgrrj.json',
                width: 300.w, height: 300.h),
            Text(
              'Create User',
              style: TextStyle(
                  fontSize: 30.sp,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
            SizedBox(
              height: 20.h,
            ),
            CreateUserController().getTextfield(
                hintText: "UserName",
                textcontroller: _createUserController.username),
            SizedBox(
              height: 20.h,
            ),
            _createUserController.getTextfield(
                hintText: "Password",
                textcontroller: _createUserController.password),
            SizedBox(
              height: 20.h,
            ),
            Container(
              padding: EdgeInsets.all(13.sp),
              height: Get.height * 0.09,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.r),
                  border: Border.all(color: Colors.white),
                  color: Colors.white),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Obx(
                    () => Text(
                      "${_createUserController.selectedDate.value.day}  ${_createUserController.months[_createUserController.selectedDate.value.month - 1]}  ${_createUserController.selectedDate.value.year}",
                      style: TextStyle(
                          fontSize: 16.sp, color: Colors.grey.shade900),
                    ),
                  ),
                  IconButton(
                      onPressed: (() {
                        _createUserController.selectDate(context);
                      }),
                      icon: Icon(Icons.calendar_month))
                ],
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            SizedBox(
              width: double.infinity,
              child: TextButton(
                onPressed: (()async {

              await _createUserController.registerUser();
                }),
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                      Colors.blue,
                    ),
                    foregroundColor: MaterialStateProperty.all(Colors.white),
                    padding: MaterialStateProperty.all(
                        EdgeInsets.symmetric(vertical: 14.h))),
                child: Text(
                  'Submit',
                  style: TextStyle(
                    fontSize: 17.sp,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
          ]),
        ),
      ),
    );
  }
}
