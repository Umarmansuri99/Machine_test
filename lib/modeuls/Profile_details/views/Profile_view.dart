import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:get/get.dart';
import 'package:umar_machine_bytecipher/modeuls/Profile_details/controllers/Profile_controller.dart';
import 'package:umar_machine_bytecipher/utils/ColorValues.dart';
import '../../../global_widgets/appBar.dart';
import '../../../global_widgets/textEnter.dart';

class Profile_view extends GetView<Profile_controller> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffFFF8FF),
      appBar: appbar(true,"Profile Details",false),
      body:

      Container(
        child: Obx(() {
          if (controller.isloder.value) {
            return Center(child: CupertinoActivityIndicator());
          } else {
            return
              Container(
                color: Color(0xffFFF8FF),
                child: Padding(
                  padding: const EdgeInsets.all(05.0),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [

                        Container(
                          width: double.infinity,
                          child:  Padding(
                            padding: EdgeInsets.all(20),
                            child:
                             Column(
                                 children: <Widget>[
                                  Container(
                                   height: MediaQuery.of(context).size.height/1.8,
                                   child:
                                   Card(
                                       color: ColorValues.card,
                                       child:
                                       Stack(
                                         alignment: Alignment.centerLeft,
                                         children: <Widget>[

                                           Column(
                                             children: <Widget>[
                                               Expanded(
                                                   flex: 1,
                                                   child:
                                                   Container(
                                                     width: double.infinity,
                                                     child: Image.asset("images/user_image.png",fit: BoxFit.fill,),
                                                   )

                                               ),
                                               Expanded(
                                                   flex: 1,
                                                   child:
                                                   Column(
                                                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                     crossAxisAlignment: CrossAxisAlignment.center,
                                                     children: <Widget>[

                                                       Padding(
                                                         padding: EdgeInsets.only(top: 20),
                                                         child: TextFieldShow(
                                                           textAlign: TextAlign.center,
                                                           text: "${controller.name.value}",
                                                           fontsize: 18.0,
                                                           fontWeight: FontWeight.bold,
                                                           color: ColorValues.BLACK,
                                                         ),

                                                       ),


                                                       Padding(
                                                         padding: EdgeInsets.only(top: 10),
                                                         child: TextFieldShow(
                                                           textAlign: TextAlign.center,
                                                           text: "${controller.email.value}",
                                                           fontsize: 16.0,
                                                           fontWeight: FontWeight.normal,
                                                           color: ColorValues.BLACK,
                                                         ),

                                                       ),

                                                       Padding(
                                                         padding: EdgeInsets.only(top: 10),
                                                         child: TextFieldShow(
                                                           textAlign: TextAlign.center,
                                                           text: "${controller.location.value}",
                                                           fontsize: 18.0,
                                                           fontWeight: FontWeight.normal,
                                                           color: ColorValues.BLACK,
                                                         ),

                                                       ),




                                                     ],
                                                   )
                                               ),
                                             ],
                                           ),
                                           Padding(
                                             padding: EdgeInsets.only(left: 10),
                                             child: Image.asset('images/Playicon.png'),
                                           )

                                         ],
                                       )

                                   )

                               ),
                                   Padding(
                                       padding: EdgeInsets.only(left: 10,right: 20,top: 20,bottom: 10),
                                       child:
                                       Row(
                                         mainAxisAlignment: MainAxisAlignment.start,
                                         children: <Widget>[
                                           TextFieldShow(
                                             text: "Gallery",
                                             fontsize: 18,
                                             fontWeight: FontWeight.bold,
                                             color: Colors.black,
                                           ),
                                         ],)


                                   ),
                                /*   Container(
                                     width: double.infinity,
                                     height: MediaQuery.of(context).size.height/2,
                                     child:  GridView.builder(
                                       shrinkWrap: false,
                                       physics: NeverScrollableScrollPhysics(),
                                       gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                         crossAxisSpacing: 0,
                                         mainAxisSpacing: 0,
                                         crossAxisCount: 3,
                                       ),
                                       itemCount: 20,
                                       itemBuilder: (context, index) {
                                         return new GestureDetector(
                                           onTap: () {

                                           },
                                           child:
                                           Card(
                                             shape: RoundedRectangleBorder(
                                               borderRadius: BorderRadius.circular(20.0),
                                             ),
                                             child: Container(
                                               decoration: BoxDecoration(
                                                 border: Border.all(
                                                   width: 1,
                                                 ),
                                                 borderRadius: BorderRadius.circular(20),
                                                 image: DecorationImage(
                                                     fit: BoxFit.cover,
                                                     //image: NetworkImage(_items[index].image),
                                                     image: AssetImage("images/user_image.png")
                                                 ),
                                               ),
                                             ),
                                           )

                                         );
                                         // Item rendering
                                       },
                                     ),
                                   )*/





                                   Container(
                                     color: Colors.transparent,
                                     width: double.infinity,
                                     height: MediaQuery.of(context).size.height/2,
                                     child: Padding(
                                       padding: const EdgeInsets.only(
                                         left: 0,
                                         right: 0,
                                       ),
                                       child: PageView.builder(
                                         itemCount: controller.countlist.toInt(),
                                         pageSnapping: true,
                                         //physics: NeverScrollableScrollPhysics(),
                                         scrollDirection: Axis.horizontal,
                                         controller: controller.pageController,
                                         onPageChanged: (int index){
                                           // controller.Get_image(index,10);
                                         },
                                         itemBuilder: (BuildContext context, int index) {




                                           return LevelSlider();
                                           // if (index >= _form.controls.length) {
                                           //   print("Returning null");
                                           //   return null;
                                           // }
                                           //
                                           // return FormControlFactory.createFormControl(
                                           //     _form.controls[index], null);
                                         },
                                       ),
                                     ),
                                   )


                             ])


                          )
                        ),

                      ],
                    ),
                  ),
                ),
              );
          }
        }),
      )



    );
  }

}



class LevelSlider extends GetView<Profile_controller> {


  @override
  Widget build(BuildContext context) {


    return Scaffold(
      body:
      Container(
        child: Obx(() {
          if (controller.isloder.value) {
            return Center(child: CupertinoActivityIndicator());
          } else {
            return
              Padding(
                padding: const EdgeInsets.only(
                  left: 10,
                  right: 10,
                ),
                child: GridView.builder(
                  shrinkWrap: false,
                  scrollDirection: Axis.horizontal,
                  //physics: NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisSpacing: 0,
                    mainAxisSpacing: 0,
                    crossAxisCount: 3,
                  ),
                  itemCount: controller.profilelist.length,
                  itemBuilder: (context, index) {
                    return new GestureDetector(
                        onTap: () {

                        },
                        child:
                        Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          child: Container(
                            decoration: BoxDecoration(
                              border: Border.all(
                                width: 1,
                              ),
                              borderRadius: BorderRadius.circular(20),
                              image: DecorationImage(
                                  fit: BoxFit.fill,
                                  //image: NetworkImage(_items[index].image),
                                  image: NetworkImage("${controller.profilelist[index].thumbnailUrl}",)

                              ),
                            ),
                          ),
                        )

                    );
                    // Item rendering
                  },
                ),
              );
          }
        }),
      )

    );
  }
}
