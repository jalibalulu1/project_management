import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';

import 'package:project_management/app/modules/widgets/custom_clipper.dart';
import 'package:project_management/app/modules/widgets/login_textfield.dart';

import '../controllers/login_screen_controller.dart';

// ignore: must_be_immutable
class LoginScreenView extends GetView<LoginScreenController> {
  LoginScreenController _loginScreenController=Get.put(LoginScreenController());
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(children: [
        Container(
          child: Stack(
            children: [
              Opacity(
                opacity: 0.5,
                child: ClipPath(
                  clipper: WaveClipper(),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Color.fromARGB(170, 42, 155, 231),
                    ),
                    height: 270.h,
                  ),
                ),
              ),
              ClipPath(
                clipper: WaveClipper(),
                child: Container(
                  decoration: BoxDecoration(color: Colors.lightBlue[700]),
                  height: 257.h,
                ),
              )
            ],
          ),
        ),
        SizedBox(
          height: 110.h,
        ),
        Padding(
          padding: EdgeInsets.all(12.sp),
          child: Center(
            child: Form(
              // key: signinController.formkey1,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  login_textfield(
                    name: 'User Name',
                    icon: Icons.email,
                    textEditingController:_loginScreenController.usernameController,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  login_textfield(
                    name: 'Password',
                    icon: Icons.key,
                    textEditingController:_loginScreenController.passwordController,
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Container(
                    width: Get.width,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.lightBlue[700],
                    ),
                    child: TextButton(
                      onPressed: () async{
                       await _loginScreenController.checklogin();
                       
                      },
                      child: Text(
                        'Login',
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ]),
    );
  }
}
