import 'package:get/get.dart';

import '../controllers/user_screen_controller.dart';

class UserScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<UserScreenController>(
      () => UserScreenController(),
    );
  }
}
