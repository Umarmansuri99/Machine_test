import 'package:get/get.dart';

import '../controllers/Singup_controller.dart';


class SingupBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SingupController>(
      () => SingupController(),
    );
  }
}
