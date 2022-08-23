import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:project_management/app/modules/create_project/views/create_project_view.dart';
import 'package:project_management/app/modules/create_user/views/create_user_view.dart';
import 'package:project_management/app/modules/widgets/choose_option.dart';

import '../controllers/admin_screen_controller.dart';

// ignore: must_be_immutable
class AdminScreenView extends GetView<AdminScreenController> {
  AdminScreenController _adminScreenController =
      Get.put(AdminScreenController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(15.sp),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Lottie.asset('assets/images/75572-choose-from-list.json',
                  width: 400.w, height: 400.h),
              SizedBox(
                height: 40.h,
              ),
              choose_option(
                adminScreenController: _adminScreenController,
                option_name: 'Create User',
                value: 'Create User',
              ),
              choose_option(
                  adminScreenController: _adminScreenController,
                  option_name: 'Create Project',
                  value: 'Create Project'),
              SizedBox(
                height: 20.h,
              ),
              Container(
                width: Get.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.lightBlue[700],
                ),
                child: TextButton(
                  onPressed: () {
                    _adminScreenController.selectedOption == 'Create User'
                        ? Get.to(() => CreateUserView())
                        : Get.to(() => CreateProjectView());
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
    );
  }
}
