// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:project_management/app/modules/admin_screen/controllers/admin_screen_controller.dart';

class choose_option extends StatelessWidget {
  String? option_name;
  String? value;
  choose_option({
    Key? key,
    required AdminScreenController adminScreenController,
    required this.option_name,required  this.value
  })  : _adminScreenController = adminScreenController,
        super(key: key);

  final AdminScreenController _adminScreenController;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Obx(
          () => Radio<String?>(
            value: this.value,
            groupValue: _adminScreenController.selectedOption.value,
            onChanged: ((value) {
              _adminScreenController.onChange(value);
            }),
            activeColor: Colors.blue,
            fillColor: MaterialStateProperty.all(Colors.blue),
          ),
        ),
        Container(
          padding: EdgeInsets.all(10.sp),
          
          width: Get.width * 0.4,
           height: Get.height*0.05,

          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Color.fromARGB(255, 95, 191, 243),
          ),
          child: Center(
            child: Text(
              '$option_name',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 17.sp,
                  fontWeight: FontWeight.w600),
            ),
          ),
          
        ),
        SizedBox(height: 70.h,)
      ],
    );
  }
}
