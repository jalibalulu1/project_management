import 'package:get/get.dart';

import '../controllers/admin_screen_controller.dart';

class AdminScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AdminScreenController>(
      () => AdminScreenController(),
    );
  }
}
