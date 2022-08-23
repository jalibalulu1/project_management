import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:project_management/app/modules/admin_screen/views/admin_screen_view.dart';

import 'package:project_management/app/modules/model/user_model.dart';
import 'package:project_management/app/modules/user_screen/views/user_screen_view.dart';

class CreateUserController extends GetxController {
 
  final formkey = GlobalKey<FormState>();
FirebaseAuth auth = FirebaseAuth.instance;
  final username = TextEditingController();
  final password = TextEditingController();
  Rx<DateTime> selectedDate = DateTime.now().obs;
  
  List<String> months = [
    "Jan",
    "Feb",
    "Mar",
    "Apr",
    "May",
    "Jun",
    "Jul",
    "Aug",
    "Sep",
    "Oct",
    "Nov",
    "Dec"
  ];
  selectDate(BuildContext ctx) async {
    final DateTime? selected = await showDatePicker(
      context: ctx,
      initialDate: selectedDate.value,
      firstDate: DateTime(1800),
      lastDate: DateTime.now(),
    );
    if (selected != null && selected != selectedDate) {
      selectedDate.value = selected;
      ;
    }
  }

  Future registerUser() async {
    if (username.text.isNotEmpty && password.text.isNotEmpty) {
      try {
        final result= await auth.createUserWithEmailAndPassword(
            email: username.text.trim(), password: password.text.trim());
 User resultUser=result.user!;
        final userData = Users(username.text, password.text, selectedDate.value,resultUser.uid);
        createUser(
          users: userData,
          id:resultUser.uid
        
        );
        Get.offAll(()=>UserScreenView());
        Get.snackbar("Success", "Successfully registered",
        duration: Duration(seconds: 1),
        
            backgroundColor: Colors.green,
            snackPosition: SnackPosition.TOP,
            
            messageText: Text(
              "SUCESSFULLY REGISTERED",
              style: TextStyle(color: Colors.white),
            ),
            titleText: Text(
              "",
              style: TextStyle(color: Colors.white),
            ));
      } on FirebaseException catch (e) {
        Get.snackbar("Failed", "Creating user is failed",
            backgroundColor: Colors.redAccent,
             duration: Duration(seconds: 2),
            snackPosition: SnackPosition.TOP,
            messageText: Text(
              e.message.toString(),
              style: TextStyle(color: Colors.white),
            ),
            titleText: Text(
              "User creation failed",
              style: TextStyle(color: Colors.white),
            ));
      }
      Get.to(()=>AdminScreenView());
      username.clear();
      password.clear();



    }
  }

  createUser({
    required Users users,
    required id
  })async {

    final docUser = FirebaseFirestore.instance.collection('users').doc(id);
    // print("Docuser id of user :${docUser.id}");
    users.id=id;
   
    final json = users.toJson();
    //Create document and write data toFirebase
     await docUser.set(json);
  }
  @override
  // ignore: must_call_super
  void onInit() {}
  getTextfield(
      {required String hintText,
      required TextEditingController textcontroller}) {
    return Form(
      key: formkey,
      child: TextFormField(
        validator: (value) {
          if (value!.isEmpty) {
            return '${hintText} cannot be empty';
          } else {
            return null;
          }
        },
        controller: textcontroller,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.r),
            borderSide: BorderSide(width: 0, style: BorderStyle.none),
          ),
          filled: true,
          fillColor: Colors.white,
          hintText: hintText,
          contentPadding:
              EdgeInsets.symmetric(vertical: 14.h, horizontal: 16.w),
          hintStyle: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w400),
        ),
      ),
    );
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
}
