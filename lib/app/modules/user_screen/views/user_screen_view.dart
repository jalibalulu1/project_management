// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:project_management/app/modules/my_project/views/my_project_view.dart';
import 'package:project_management/app/modules/widgets/user_choose_option.dart';

import '../controllers/user_screen_controller.dart';

class UserScreenView extends GetView<UserScreenController> {
  UserScreenController _userScreenController=Get.put(UserScreenController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     body: Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(15.sp),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Image.asset('assets/images/profile.jpg',
                  width: 300.w, height: 300.h),
              SizedBox(
                height: 40.h,
              ),
                 User_choose_option (option_name: 'My Bio', value: 'My Bio', userScreenController: _userScreenController, ),

                User_choose_option(userScreenController: _userScreenController,option_name: 'My Project',value:'My Project'),
             
               SizedBox(height: 20.h,),
               Container(
                
                    width: Get.width,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.lightBlue[700],
                    ),
                    child: TextButton(
                      onPressed: () {
                         Get.to(() => MyProjectView());
                      },
                      child: Text(
                        'Submit',
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                    ),
                  ),
           
                ],
              ),
            
          ),
        ),
    ));
  }
}

