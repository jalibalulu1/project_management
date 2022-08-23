import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_management/app/modules/admin_screen/views/admin_screen_view.dart';
import 'package:project_management/app/modules/user_screen/views/user_screen_view.dart';

class LoginScreenController extends GetxController {
  
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  FirebaseAuth auth = FirebaseAuth.instance;

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  checklogin() async {
    print("just entered");
    // if (formkey1.currentState!.validate()) {
    if (usernameController.text == 'Admin@kssmart.co' &&
        passwordController.text == '123456') {
      // print('object');
      try {
        await auth.signInWithEmailAndPassword(
            email: usernameController.text, password: passwordController.text);
        print(' hello object');
        Get.offAll(() => AdminScreenView());
        return;
      } on FirebaseAuthException catch (e) {
        Get.snackbar("About Login", "Login message",
            backgroundColor: Colors.redAccent,
            snackPosition: SnackPosition.BOTTOM,
            messageText: Text(
              e.message.toString(),
              style: TextStyle(color: Colors.white),
            ),
            titleText: Text(
              "Login failed",
              style: TextStyle(color: Colors.white),
            ));
      }
    }
    if (usernameController.text != 'Admin@kssmart.co' &&
        usernameController.text != '123456') {
      print('user');
      try {
        await auth.signInWithEmailAndPassword(
            email: usernameController.text, password: passwordController.text);
        Get.offAll(() => UserScreenView());
        return;
      } on FirebaseAuthException catch (e) {
        Get.snackbar("About Login", "Login message",
            backgroundColor: Colors.redAccent,
            snackPosition: SnackPosition.BOTTOM,
            messageText: Text(
              e.message.toString(),
              style: TextStyle(color: Colors.white),
            ),
            titleText: Text(
              "Login failed",
              style: TextStyle(color: Colors.white),
            ));
      }
    }
  }

  @override
  void onClose() {}
}
