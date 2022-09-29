
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:umar_machine_bytecipher/routes/app_pages.dart';


class MyHttpOverrides extends HttpOverrides{
  @override
  HttpClient createHttpClient(SecurityContext? context){
    return super.createHttpClient(context)
      ..badCertificateCallback = (X509Certificate cert, String host, int port)=> true;
  }
}

Future<void> main() async {


  /* await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);*/


  HttpOverrides.global = new MyHttpOverrides();
  WidgetsFlutterBinding.ensureInitialized();

  runApp(
    GetMaterialApp(
      title: "Application",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      debugShowCheckedModeBanner: false,

      theme: ThemeData(
        /* scaffoldBackgroundColor: const Color(0xFFEFEFEF),*/
          scaffoldBackgroundColor: Colors.white,
          visualDensity: VisualDensity.adaptivePlatformDensity,
          primaryColor: Color(0xff),
          accentColor: Colors.white,
          textSelectionTheme:
          TextSelectionThemeData(cursorColor: Colors.black)),
    ),
  );
}
