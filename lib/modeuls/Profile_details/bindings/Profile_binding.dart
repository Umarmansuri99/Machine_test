import 'package:get/get.dart';

import '../controllers/Profile_controller.dart';


class Profile_binding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<Profile_controller>(
      () => Profile_controller(),
    );
  }
}
