import 'package:get/get.dart';

import '../controllers/my_bio_controller.dart';

class MyBioBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MyBioController>(
      () => MyBioController(),
    );
  }
}
