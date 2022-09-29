import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../routes/app_pages.dart';

import '../../../utils/api_service.dart';
import '../../../utils/shared_prefrence/shared_prefrences_constant.dart';
import '../../../utils/toast.dart';

class Add_user_controller extends GetxController {

  final TextEditingController emailController = TextEditingController(text: "");
  final TextEditingController Locationcontroller = TextEditingController(text: "");
  final TextEditingController nameController = TextEditingController(text: "");
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

  }

  void increment() => count.value++;



}
