import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../routes/app_pages.dart';

// Note : photo video app bar worked diffrently
AppBar appbar(bool is_back_button,String title,bool isplus_icon) => AppBar(
      iconTheme: IconThemeData(
        size: 0,
        color: Colors.black, //change your color here
      ),
      elevation: 0,
      leadingWidth: 30,
      backgroundColor: Color(0xffffffff),
      automaticallyImplyLeading: false,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          is_back_button==true?
          GestureDetector(
            onTap: () {
              Get.back();
            },
            child: Icon(
              Icons.arrow_back_ios_sharp,
              color: Colors.black,
              size: 16,
            ),
          ):
              SizedBox(),
          Text(
            title,
            style: TextStyle(
              color: Colors.black,
              fontSize: 17,
              fontWeight: FontWeight.w500,
              fontFamily: 'Lato',
            ),
          ),
          isplus_icon==true?
              GestureDetector(
                onTap: (){
                  Get.offAllNamed(Routes.ADD_USER);
                },
                child: Image.asset("images/plus.png"),
              )
          :
              SizedBox()
        ],
      ),
    );
