import 'package:get/get.dart';
import 'package:umar_machine_bytecipher/modeuls/Profile_details/bindings/Profile_binding.dart';
import 'package:umar_machine_bytecipher/modeuls/Profile_details/views/Profile_view.dart';
import 'package:umar_machine_bytecipher/modeuls/Singup/bindings/Singup_binding.dart';
import 'package:umar_machine_bytecipher/modeuls/Singup/views/Singup_view.dart';
import 'package:umar_machine_bytecipher/modeuls/home/bindings/home_binding.dart';
import 'package:umar_machine_bytecipher/modeuls/home/views/home_view.dart';
import 'package:umar_machine_bytecipher/modeuls/login/bindings/login_binding.dart';
import 'package:umar_machine_bytecipher/modeuls/login/views/login_view.dart';

import '../modeuls/Add_user/bindings/Add_user_binding.dart';
import '../modeuls/Add_user/views/Add_user_view.dart';
import '../modeuls/dashboard/bindings/dashboard_binding.dart';
import '../modeuls/dashboard/views/dashboard_view.dart';


part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.LOGIN;

  static final routes = [

    GetPage(
      name: _Paths.LOGIN,
      page: () => LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.SIGNUP,
      page: () => SingupView(),
      binding: SingupBinding(),
    ),
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.DESHBOARD,
      page: () => DashboardView(),
      binding: DashboardBinding(),
    ),
    GetPage(
      name: _Paths.PROFILE,
      page: () => Profile_view(),
      binding: Profile_binding(),
    ),
    GetPage(
      name: _Paths.ADD_USER,
      page: () => Add_user_View(),
      binding: Add_user_binding(),
    ),
  ];
}
