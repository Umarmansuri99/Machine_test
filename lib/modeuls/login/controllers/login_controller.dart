import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../routes/app_pages.dart';

import '../../../utils/api_service.dart';
import '../../../utils/shared_prefrence/shared_prefrences_constant.dart';
import '../../../utils/toast.dart';

class LoginController extends GetxController {

  final TextEditingController emailController = TextEditingController(text: "");
  final TextEditingController passwordcontroller =
  TextEditingController(text: "");
  late final FormFieldValidator<String>? validator;
  final loginFormKey = GlobalKey<FormState>();
  bool passwordVisible = true;
  final count = 0.obs;
  var isLoading = false.obs;
  var obscureNewPass = true.obs;

  @override
  void onInit() async {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    /*emailController.dispose();
    passwordcontroller.dispose();*/
  }

  void increment() => count.value++;

  void onLoginSubmit() async {

    if(emailController.text.isEmpty){


      Get.snackbar('Enter Your Email', '',
        duration: Duration(seconds: 2),
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Color(0xffEC297B),
        padding: EdgeInsets.symmetric(
            vertical: 5,horizontal: 5
        ),
        barBlur: 0,
        colorText: Colors.white,
        maxWidth: double.infinity,
        snackStyle: SnackStyle.GROUNDED,
        borderRadius: 10,);



    }else if(passwordcontroller.text.isEmpty){

      Get.snackbar('Enter Your Password', '',
        duration: Duration(seconds: 2),
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Color(0xffEC297B),
        padding: EdgeInsets.symmetric(
            vertical: 5,horizontal: 5
        ),
        barBlur: 0,
        colorText: Colors.white,
        maxWidth: double.infinity,
        snackStyle: SnackStyle.GROUNDED,
        borderRadius: 10,);



    }else if(passwordcontroller.text.length<=4){


      Get.snackbar('Invalid Password', '',
        duration: Duration(seconds: 2),
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Color(0xffEC297B),
        padding: EdgeInsets.symmetric(
            vertical: 5,horizontal: 5
        ),
        barBlur: 0,
        colorText: Colors.white,
        maxWidth: double.infinity,
        snackStyle: SnackStyle.GROUNDED,
        borderRadius: 10,);


    }else{

      getLogin();

    }
  }
  void getLogin() async {
    try {
      isLoading(true);
      var response = await ApiService()
          .LoginUser(emailController.text, passwordcontroller.text);
      print({'$response'});


        if (response['message'] == "success") {

          SharedPreferences prefs = await SharedPreferences.getInstance();
          prefs.setString(SDConstant.token, response['data']['Token'].toString());
          prefs.setString('loginstatus', "true");


          Get.snackbar('Login Successfully', '',
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Color(0xffEC297B),
            padding: EdgeInsets.symmetric(
                vertical: 5,horizontal: 5
            ),
            barBlur: 0,
            colorText: Colors.white,
            maxWidth: double.infinity,
            snackStyle: SnackStyle.GROUNDED,
            borderRadius: 10,);

         Get.offAllNamed(Routes.DESHBOARD);

        } else if (response['message'] == "false") {


          Get.snackbar(response['message'].toString(), '',
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Color(0xffEC297B),
            padding: EdgeInsets.symmetric(
                vertical: 5,horizontal: 5
            ),
            barBlur: 0,
            colorText: Colors.white,
            maxWidth: double.infinity,
            snackStyle: SnackStyle.GROUNDED,
            borderRadius: 10,);

        }
      }  finally {
      isLoading(false);
     /* Get.snackbar(
        "Something went wrong or No Connection !",
        "",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Color(0xFFEC297B),
        colorText: Colors.white,
        borderRadius: 5,
        duration: Duration(seconds: 2),
      );*/

    }
  }


}
