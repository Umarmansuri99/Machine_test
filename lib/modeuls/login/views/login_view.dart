import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:umar_machine_bytecipher/utils/ColorValues.dart';
import '../../../global_widgets/textEnter.dart';
import '../../../global_widgets/textfield_ui.dart';
import '../../../routes/app_pages.dart';
import '../controllers/login_controller.dart';


class LoginView extends GetView<LoginController> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      //backgroundColor: Theme.of(context).primaryColor,
      body:
      Container(
        child: Obx(() {
          if (controller.isLoading.value) {
            return Center(child: CupertinoActivityIndicator());
          } else {
            return
            Stack(
              //fit: StackFit.loose,
              children: <Widget>[

                Container(
                decoration: BoxDecoration(
               gradient: LinearGradient(
                 begin: Alignment.topCenter,
                 end: Alignment.bottomCenter,
                colors:[
              Color(0xFF7F69D4),
              Color(0xFFC685B0)
              ],
              )
             ),
            ),


                 SingleChildScrollView(
                   child: Container(
                     height: MediaQuery.of(context).size.height,
                     alignment: Alignment.center,
                     child: Column(
                       mainAxisAlignment: MainAxisAlignment.start,
                       crossAxisAlignment: CrossAxisAlignment.center,
                       children: <Widget>[


                         Padding(
                             padding: EdgeInsets.only(top: 40,bottom: 10),
                             child: Image.asset("images/logo.png")
                         ),

                         Padding(
                             padding: EdgeInsets.only(left: 20,right: 20,top: 20),
                             child:
                             Row(
                               mainAxisAlignment: MainAxisAlignment.start,
                               children: <Widget>[
                                 TextFieldShow(
                                   text: "Sign In",
                                   fontsize: 22,
                                   fontWeight: FontWeight.bold,
                                   color: Color.fromARGB(255, 255, 255, 255),
                                 ),
                               ],)


                         ),
                         Padding(
                             padding: EdgeInsets.only(left: 20,right: 20),
                             child:
                             Row(
                               mainAxisAlignment: MainAxisAlignment.start,
                               children: <Widget>[
                                 TextFieldShow(
                                   text: "with your phone number",
                                   fontsize: 16,
                                   fontWeight: FontWeight.w500,
                                   fontFamily: "regular",
                                   color: Color.fromARGB(255, 255, 255, 255),
                                 ),
                               ],)


                         ),
                         Padding(
                           padding: EdgeInsets.symmetric(
                               vertical: 10,
                               horizontal: MediaQuery.of(context).size.height * 0.03),
                           child: TextFieldDesigned(
                             controller: controller.emailController,
                             validator: (value) {
                               if (value != null && !value.isEmail) {
                                 return 'Invalid Email ID.';
                               }
                               return null;
                             },
                             maxLines: 2,
                             fontSize: 14,
                             maxLength: 50,

                             minLines: 1,
                             hintText: "Your Email",
                             hintStyle: Color(0xffCCD2E3),
                             autovalidateMode: AutovalidateMode.onUserInteraction,
                             readOnly: false,
                             keyboardType: TextInputType.text,
                             prefixIcon: Icon(
                               Icons.email_outlined,
                               color: Color(0xffCCD2E3),
                               size: 16.0,
                             ),
                           ),
                         ),
                         Padding(
                             padding: EdgeInsets.symmetric(
                                 vertical: MediaQuery.of(context).size.height * 0.01,
                                 horizontal: MediaQuery.of(context).size.height * 0.03),
                             child: TextFormField(
                               validator: (value) {
                                 if (value != null && value.length < 5) {
                                   return 'Invalid Password.';
                                 }
                                 return null;
                               },
                               cursorColor: Color(0xff000000),
                               maxLength: 20,
                               style: TextStyle(color: Color(0xff000000)),
                               controller: controller.passwordcontroller,
                               obscureText: controller.obscureNewPass.value,
                               decoration: InputDecoration(
                                 focusedErrorBorder: OutlineInputBorder(
                                   borderSide: BorderSide(color: Color(0xffCCD2E3)),
                                   borderRadius: BorderRadius.circular(10),
                                 ),
                                 focusedBorder: OutlineInputBorder(
                                   borderSide: BorderSide(color: Color(0xffCCD2E3)),
                                   borderRadius: BorderRadius.circular(10),
                                 ),
                                 enabledBorder: OutlineInputBorder(
                                   borderSide: BorderSide(color: Color(0xffCCD2E3)),
                                   //36325A
                                   borderRadius: BorderRadius.circular(10),
                                 ),
                                 errorBorder: OutlineInputBorder(
                                   borderSide: BorderSide(color: Color(0xffCCD2E3)),
                                   borderRadius: BorderRadius.circular(10),
                                 ),
                                 border: InputBorder.none,
                                 prefixIcon: Icon(
                                   Icons.lock_outline,
                                   color: Color(0xffCCD2E3),
                                   size: 16.0,
                                 ),
                                 contentPadding: EdgeInsets.only(
                                     left: 15, top: 13, bottom: 0, right: 15),
                                 filled: true,
                                 fillColor: ColorValues.TEXT_FIELD_BACKGRAUND,
                                 hintText: 'Password'.tr,
                                 hintStyle: TextStyle(fontSize: 14.0, color:Color(0xffCCD2E3)),
                                 suffixIcon: GestureDetector(
                                   behavior: HitTestBehavior.translucent,
                                   onTap: () {
                                     controller.obscureNewPass.value =
                                     !controller.obscureNewPass.value;
                                   },
                                   child: Icon(
                                     controller.obscureNewPass.value
                                         ? Icons.lock_rounded
                                         : Icons.lock_open,
                                     size: 24,
                                     color: Color.fromRGBO(142, 153, 183, 0.5),
                                   ),
                                 ),

                               ),
                             )
                         ),
                         GestureDetector(
                           onTap: (){
                             controller.onLoginSubmit();
                           },
                           child: Padding(padding: EdgeInsets.only(left: 20,right: 20),
                             child: Container(
                                 height: 50,
                                 decoration: BoxDecoration(
                                   color: const Color(0xffffffff),
                                   borderRadius: BorderRadius.circular(12),
                                 ),
                                 width: double.infinity,
                                 child:
                                 Center(
                                   child:  TextFieldShow(
                                     height: 1.5,
                                     textAlign: TextAlign.center,
                                     text: "Login",
                                     fontsize: 18.0,
                                     fontWeight: FontWeight.bold,
                                     color: ColorValues.TEXT_COLOR1,
                                   ),
                                 )

                             ),
                           ),
                         ),

                         Spacer(),

                         Padding(
                             padding: EdgeInsets.only(bottom: 20),
                         child: Row(
                           crossAxisAlignment: CrossAxisAlignment.end,
                           mainAxisAlignment: MainAxisAlignment.center,
                           children: [
                             TextFieldShow(
                               textAlign: TextAlign.center,
                               text: "Have not any account? ",
                               fontsize: 16.0,
                               fontWeight: FontWeight.normal,
                               color: Color.fromARGB(255, 255, 255, 255),
                             ),
                             GestureDetector(
                               onTap: () {
                                 Get.offAllNamed(Routes.SIGNUP);
                               },

                               //  controller.onSignup(),
                               child: TextFieldShow(
                                 textAlign: TextAlign.center,
                                 text: "Sign Up",
                                 fontsize: 16.0,
                                 fontWeight: FontWeight.bold,
                                 color: Color.fromARGB(255, 255, 255, 255),
                               ),
                             ),
                           ],
                         ),
                         )

                       ],
                     ),
                   ),
                 )

              ],
            );
          }
        }),
      )

    );
  }
}
