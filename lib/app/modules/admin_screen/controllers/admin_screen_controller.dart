import 'package:get/get.dart';

class AdminScreenController extends GetxController {
  

  
  @override
  void onInit() {
    super.onInit();
  }
  var selectedOption='Create User'.obs;
  onChange(var selected_option){
    selectedOption.value=selected_option;

  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
  
}
