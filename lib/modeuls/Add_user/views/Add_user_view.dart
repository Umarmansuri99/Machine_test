import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:umar_machine_bytecipher/global_widgets/appBar.dart';
import 'package:umar_machine_bytecipher/utils/ColorValues.dart';
import '../../../global_widgets/textEnter.dart';
import '../../../global_widgets/textfield_ui.dart';
import '../../../routes/app_pages.dart';
import '../controllers/Add_user_controller.dart';



class Add_user_View extends GetView<Add_user_controller> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      //appBar: appbar(true,"",false),
      //backgroundColor: Theme.of(context).primaryColor,
      body:
      Container(
        child: Obx(() {
          if (controller.isLoading.value) {
            return Center(child: CupertinoActivityIndicator());
          } else {
            return
            Stack(
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


                 SingleChildScrollView  (
                   child: Container(
                     height: MediaQuery.of(context).size.height,
                     alignment: Alignment.center,
                     child: Column(
                       mainAxisAlignment: MainAxisAlignment.start,
                       crossAxisAlignment: CrossAxisAlignment.center,
                       children: <Widget>[

                         GestureDetector(
                           onTap: (){
                             print("==============");
                             Get.offNamed(Routes.DESHBOARD);
                           },
                           child: Padding(
                               padding: EdgeInsets.only(left: 20,right: 20,top: 20),
                               child:
                               Row(
                                 mainAxisAlignment: MainAxisAlignment.start,
                                 children: <Widget>[
                                   Padding(
                                       padding: EdgeInsets.only(top: 00,bottom: 00),
                                       child: Icon(
                                         Icons.arrow_back_ios_sharp,
                                         color: Colors.white,
                                         size: 20,
                                       ),
                                   ),
                                 ],)


                           ),
                         ),

                         Padding(
                             padding: EdgeInsets.only(top: 40,bottom: 10),
                             child: Image.asset("images/logo.png")
                         ),

                         Padding(
                             padding: EdgeInsets.only(left: 20,right: 20,top: 20),
                             child:
                             Row(
                               mainAxisAlignment: MainAxisAlignment.center,
                               children: <Widget>[
                                 TextFieldShow(
                                   text: "Add User",
                                   fontsize: 22,
                                   fontWeight: FontWeight.bold,
                                   color: Color.fromARGB(255, 255, 255, 255),
                                 ),
                               ],)


                         ),

                         Padding(
                           padding: EdgeInsets.symmetric(
                               vertical: 10,
                               horizontal: MediaQuery.of(context).size.height * 0.03),
                           child: TextFieldDesigned(
                             controller: controller.nameController,
                             // validator: (value) {
                             //   if (value != null && !value.isEmail) {
                             //     return 'Invalid Email ID.';
                             //   }
                             //   return null;
                             // },
                             maxLines: 2,
                             fontSize: 14,
                             maxLength: 50,

                             minLines: 1,
                             hintText: "Enter your name",
                             hintStyle: Color(0xffCCD2E3),
                             autovalidateMode: AutovalidateMode.disabled,
                             readOnly: false,
                             keyboardType: TextInputType.text,
                             prefixIcon: Icon(
                               Icons.person,
                               color: Color(0xffCCD2E3),
                               size: 16.0,
                             ),
                           ),
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
                             hintText: "Email id",
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
                               vertical: 10,
                               horizontal: MediaQuery.of(context).size.height * 0.03),
                           child: TextFieldDesigned(
                             controller: controller.Locationcontroller,
                             // validator: (value) {
                             //   if (value != null && !value.isEmail) {
                             //     return 'Invalid Email ID.';
                             //   }
                             //   return null;
                             // },
                             maxLines: 2,
                             fontSize: 14,
                             maxLength: 50,

                             minLines: 1,
                             hintText: "Your your location",
                             hintStyle: Color(0xffCCD2E3),
                             autovalidateMode: AutovalidateMode.onUserInteraction,
                             readOnly: false,
                             keyboardType: TextInputType.text,
                             prefixIcon: Icon(
                               Icons.location_on,
                               color: Color(0xffCCD2E3),
                               size: 16.0,
                             ),
                           ),
                         ),


                         GestureDetector(
                           onTap: (){

                           },
                           child:  Padding(
                             padding: EdgeInsets.only(left: 20,right: 20,top: 20),
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
                                     text: "Submit",
                                     fontsize: 18.0,
                                     fontWeight: FontWeight.bold,
                                     color: ColorValues.TEXT_COLOR1,
                                   ),
                                 )

                             ),
                           ),
                         ),




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
