import 'package:get/get.dart';

class UserScreenController extends GetxController {
  
var selectedOption='My Bio'.obs;
  onChange(var selected_option){
    selectedOption.value=selected_option;

  }
  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
  void increment() => count.value++;
}
