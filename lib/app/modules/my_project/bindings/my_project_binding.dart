import 'package:get/get.dart';

import '../controllers/my_project_controller.dart';

class MyProjectBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MyProjectController>(
      () => MyProjectController(),
    );
  }
}
