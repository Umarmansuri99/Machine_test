import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:umar_machine_bytecipher/utils/ColorValues.dart';

import '../../../utils/api_service.dart';

import '../../home/views/home_view.dart';
import '../controllers/dashboard_controller.dart';

class DashboardView extends GetView<DashboardController> {
  final _currentIndex = 0.obs;


  Future<bool> pop() async {
    Navigator.pop(ApiService.context);
    return true;
  }
  Future<bool?> _onBackPressed(context) async {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return

            AlertDialog(
            elevation: 10,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(10.0))),
            backgroundColor: ColorValues.TEXT_COLOR1,
            title:
              Padding(padding: EdgeInsets.only(top: 20),child:  Center(
              child:
              Text(
                'Do You Want To Exit',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  fontFamily: 'Lato',
                ),
              ),

              //Text('Do you want to exit ',),
            ),),


             content:
             Text(''),
             actionsAlignment: MainAxisAlignment.spaceEvenly,

            actions: <Widget>[
              Padding(padding: EdgeInsets.only(bottom: 20),child: Container(
                decoration: BoxDecoration(
                  color: const Color(0xffffffff),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: TextButton(
                  child: Text(
                    'NO',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                      fontFamily: 'Lato',
                    ),
                  ),
                  onPressed: () {
                    Navigator.of(context).pop(false);
                  },
                ),
              ),),
              Padding(padding: EdgeInsets.only(bottom: 20),child: Container(
                decoration: BoxDecoration(
                  color: const Color(0xffffffff),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: TextButton(
                  child: Text(
                    'YES',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                      fontFamily: 'Lato',
                    ),
                  ),
                  onPressed: () {
                    Navigator.of(context).pop(true);
                    SystemNavigator.pop();
                  },
                ),
              ),),


            ],
          );
        });
  }
  @override
  Widget build(BuildContext context) {
      //ApiService.context = context;
    return  WillPopScope(
      child:Obx(() => Scaffold(
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            child: BottomNavigationBar(
              showUnselectedLabels: true,
              currentIndex: _currentIndex.value,
              type: BottomNavigationBarType.fixed,
              backgroundColor: Color(0xffffffff),
              selectedItemColor: ColorValues.TEXT_COLOR1,
              unselectedItemColor: Colors.black,
              selectedFontSize: 11,
              unselectedFontSize: 11,
              onTap: (value) {
                _currentIndex.value = value;
                // Respond to item press.
              },
              items: [
                BottomNavigationBarItem(
                  label: "Home",
                  icon: Icon(Icons.home),
                ),
                BottomNavigationBarItem(
                  label: "Feed",
                  icon: Icon(Icons.feed_outlined),
                ),
                BottomNavigationBarItem(
                  label: "  Chat ",
                  icon: Icon(Icons.chat_bubble_outline),
                ),
                BottomNavigationBarItem(
                  label: "Settings",
                  icon: Icon(Icons.settings),
                ),
              ],
            ),
          ),
        ),
        body: Stack(
          children: [
            Obx(() => SizedBox(
              height: controller.count.value.toDouble(),
            )),
            buildScreens[_currentIndex.value]
          ],
        ),
      )),
      onWillPop: () async {
        bool? result= await _onBackPressed(context);
        if(result == null){
          result = false;
        }
        return result;
      },

    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: Theme.of(context).primaryColor,
      elevation: 0,
      iconTheme: const IconThemeData(color: Colors.black),
      actions: [
        IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.notifications_none_rounded,
            color: Colors.black,
          ),
        ),
        IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.person_outline,
            color: Colors.black,
          ),
        ),
      ],
      title: Center(
        child:  Image(
          image: AssetImage(''),
          width: 100,
          height: 50,
        ),
      ),
    );
  }

  List buildScreens = <Widget>[
    Screen1(),
    Screen1(),
    Screen1(),
    Screen1(),
  ].obs;
}

List<PersistentBottomNavBarItem> navBarsItems() {
  return [
    PersistentBottomNavBarItem(
      icon: Icon(Icons.home),
      contentPadding: 5,
      title: "\n Home",
      textStyle: TextStyle(
        fontSize: 14,
        fontFamily: 'Lato',
      ),
      activeColorPrimary: Color(0xff8069D4),
      inactiveColorPrimary: Colors.grey,
    ),
    PersistentBottomNavBarItem(
      contentPadding: 5,
      icon: Icon(Icons.home),
      title: ("Feed"),
      textStyle: TextStyle(
        fontSize: 14,
        fontFamily: 'Lato',
      ),
      activeColorPrimary: Color(0xff8069D4),
      inactiveColorPrimary: Colors.grey,
    ),
    PersistentBottomNavBarItem(
      icon: Icon(Icons.chat_bubble_outline),
      title: ("\n Create Event"),
      textStyle: TextStyle(
        fontSize: 14,
        fontFamily: 'Lato',
      ),
      activeColorPrimary: Color(0xff8069D4),
      inactiveColorPrimary: Colors.grey,
    ),
    PersistentBottomNavBarItem(
      icon: Icon(Icons.settings),
      contentPadding: 5,
      title: ("\n Settings"),
      textStyle: TextStyle(
        fontSize: 14,
        fontFamily: 'Lato',
      ),
      activeColorPrimary: Color(0xff8069D4),
      inactiveColorPrimary: Colors.grey,
    ),
  ];
}

Widget Screen1() {
  return HomeView();
}
