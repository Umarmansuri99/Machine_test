import 'package:get/get.dart';

import '../controllers/Add_user_controller.dart';




class Add_user_binding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<Add_user_controller>(
      () => Add_user_controller(),
    );
  }
}
