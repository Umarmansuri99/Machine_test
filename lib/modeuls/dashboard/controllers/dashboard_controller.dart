import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:umar_machine_bytecipher/modeuls/home/controllers/home_controller.dart';
class DashboardController extends GetxController {
  final item = [].obs;
  final advertisementList = <String>[].obs;
  final categoryList_all = [].obs;
  final package_id = 0.obs;
  final bar_title = "".obs;

  final baseUrl_category = "".obs;
  final baseUrl_advertisement = "".obs;
  final baseUrl_event = "".obs;
  final username = "".obs;
  final count = 0.obs;
  final current = 0.obs;
  final bool_isLogin = false.obs;

  String token = "";
  late SharedPreferences prefs;

  final persistentTabController = PersistentTabController();
  bool hideNavBar = false;

  final HomeController1 = Get.put(HomeController());


  @override
  void onInit() {
    super.onInit();

    hideNavBar = false;
    HomeController1.onInit();

  }

  @override
  void onClose() {
    HomeController1.onClose();

  }

  List<PersistentBottomNavBarItem> navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: Icon(Icons.home),
        title: "Home",
        activeColorPrimary: Colors.blue,
        inactiveColorPrimary: Colors.grey,
        inactiveColorSecondary: Colors.purple,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(Icons.search),
        title: ("Search"),
        activeColorPrimary: Colors.teal,
        inactiveColorPrimary: Colors.grey,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(Icons.add),
        title: ("Add"),
        activeColorPrimary: Colors.blueAccent,
        activeColorSecondary: Colors.white,
        inactiveColorPrimary: Colors.white,
        /* routeAndNavigatorSettings: RouteAndNavigatorSettings(
            initialRoute: '/',
            routes: {
              '/first': (context) => MainScreen2(),
              '/second': (context) => MainScreen3(),
            },
          ),
          onPressed: (context) {
            pushDynamicScreen(context,
                screen: SampleModalScreen(), withNavBar: true);
          }*/
      ),
      PersistentBottomNavBarItem(
        icon: Icon(Icons.message),
        title: ("Messages"),
        activeColorPrimary: Colors.deepOrange,
        inactiveColorPrimary: Colors.grey,
        /* routeAndNavigatorSettings: RouteAndNavigatorSettings(
          initialRoute: '/',
          routes: {
            '/first': (context) => MainScreen2(),
            '/second': (context) => MainScreen3(),
          },
        ),*/
      ),
      PersistentBottomNavBarItem(
        icon: Icon(Icons.settings),
        title: ("Settings"),
        activeColorPrimary: Colors.indigo,
        inactiveColorPrimary: Colors.grey,
        /*routeAndNavigatorSettings: RouteAndNavigatorSettings(
          initialRoute: '/',
          routes: {
            '/first': (context) => MainScreen2(),
            '/second': (context) => MainScreen3(),
          },
        ),*/
      ),
    ];

    void increment() => count.value++;
  }
}
