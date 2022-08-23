import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';

import '../controllers/my_project_controller.dart';

class MyProjectView extends GetView<MyProjectController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: SafeArea(
        child: Padding(
          padding:  EdgeInsets.all(12.sp),
          child: ListView(
           
            children: [
              SizedBox(height: 40.h,),
              Text(
                'My Project',
                style: TextStyle(
                    fontSize: 30.sp,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
              SizedBox(
                height: 20.h,
              ),
              
             
              SizedBox(
                height: 20.h,
              ),
              Container(
                padding: EdgeInsets.all(13.sp),
                height: Get.height * 0.06,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.r),
                    border: Border.all(color: Colors.white),
                    color: Color.fromARGB(255, 217, 218, 219)),
                   
                      child:  Text('Project Name',style: TextStyle(color: Colors.grey.shade700),),
              ),
              SizedBox(height: 20.h,),
              Container(
                padding: EdgeInsets.all(13.sp),
                height: Get.height * 0.06,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.r),
                    border: Border.all(color: Colors.white),
                    color: Color.fromARGB(255, 217, 218, 219)),
                   
                      child:  Text('Company Details',style: TextStyle(color: Colors.grey.shade700),),
              ),
              SizedBox(height: 20.h,),
              Container(
                padding: EdgeInsets.all(13.sp),
                height: Get.height * 0.06,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.r),
                    border: Border.all(color: Colors.white),
                    color: Color.fromARGB(255, 217, 218, 219)),
                   
                      child:  Text('Website',style: TextStyle(color: Colors.grey.shade700),),
              ),SizedBox(height: 20.h,),
               Container(
                padding: EdgeInsets.all(13.sp),
                height: Get.height * 0.06,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.r),
                    border: Border.all(color: Colors.white),
                    color: Color.fromARGB(255, 217, 218, 219)),
                   
                      child:  Text('Location with Map view',style: TextStyle(color: Colors.grey.shade700),),
              ),
              
                   ] ),
              ),
              

            
          ),
    );
  }
}
