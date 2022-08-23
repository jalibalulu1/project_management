import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:project_management/app/modules/model/project_model.dart';
// ignore: unused_import
import 'package:http/http.dart' as http;
import 'package:project_management/app/modules/model/user_model.dart';

class CreateProjectController extends GetxController {
  Future<List<Users>>? employeeList;
  var list = <ProjectModel>[].obs;
  var isLoading = true.obs;
  String? selectedItem;
  List<DropdownMenuItem> usersList = [];
  // RxBool isSelected =false.obs;

  // ignore: deprecated_member_use
  List<DropdownMenuItem<String>> UsernameList = [];

  @override
  void onInit() {
    super.onInit();
    // fetchData();
    // getUserList();
  }

  getTextfield({required String hintText}) {
    return TextFormField(
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.r),
          borderSide: BorderSide(width: 0, style: BorderStyle.none),
        ),
        filled: true,
        fillColor: Colors.white,
        hintText: hintText,
        contentPadding: EdgeInsets.symmetric(vertical: 14.h, horizontal: 16.w),
        hintStyle: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w400),
      ),
    );
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

  onChanged(String item) {
    selectedItem = item;
    update();
  }
}
