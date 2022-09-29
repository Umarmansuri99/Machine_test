import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:umar_machine_bytecipher/utils/ColorValues.dart';
import '../../../global_widgets/appBar.dart';
import '../../../global_widgets/textEnter.dart';
import '../../../routes/app_pages.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffFFF8FF),
      appBar: appbar(false,"HireTheART",true),
      body:
      Container(
        child: Obx(() {
          if (controller.isloder.value) {
            return Center(
                child: CupertinoActivityIndicator()
            );
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
                          color: Colors.transparent,
                          width: double.infinity,
                          child: ListView.builder(
                            physics: ClampingScrollPhysics(),
                            shrinkWrap: true,
                            scrollDirection: Axis.vertical,
                            itemCount: controller.LocalList.length + (controller.isLastPage.value ? 0 : 1),
                            itemBuilder: (BuildContext context, int index) {
                              if (index == controller.LocalList.length - controller.nextPageTrigger.value ) {
                                controller.get_user_data_List();
                              }
                              if (index == controller.LocalList.length) {
                                if (controller.error.value) {
                                  return Center(
                                      child: errorDialog(size: 15)
                                  );
                                } else {
                                  return const Center(
                                      child: Padding(
                                        padding: EdgeInsets.all(8),
                                        child: CupertinoActivityIndicator(),
                                      ));
                                }
                              }
                              return
                                Padding(
                                  padding: EdgeInsets.all(20),
                                child:  Container(
                                    height: MediaQuery.of(context).size.height/1.6,
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
                                                          text: "${controller.LocalList[index].name}",
                                                          fontsize: 18.0,
                                                          fontWeight: FontWeight.bold,
                                                          color: ColorValues.BLACK,
                                                        ),

                                                      ),
                                                      Padding(
                                                        padding: EdgeInsets.only(top: 10),
                                                        child: TextFieldShow(
                                                          textAlign: TextAlign.center,
                                                          text: "${controller.LocalList[index].email}",
                                                          fontsize: 16.0,
                                                          fontWeight: FontWeight.normal,
                                                          color: ColorValues.BLACK,
                                                        ),

                                                      ),

                                                      Padding(
                                                        padding: EdgeInsets.only(top: 10),
                                                        child: TextFieldShow(
                                                          textAlign: TextAlign.center,
                                                          text: "${controller.LocalList[index].location}",
                                                          fontsize: 18.0,
                                                          fontWeight: FontWeight.normal,
                                                          color: ColorValues.BLACK,
                                                        ),

                                                      ),

                                                      GestureDetector(
                                                        onTap: (){
                                                          var data={
                                                            "userid": controller.LocalList[index].id.toString(),
                                                          };
                                                          Get.toNamed(Routes.PROFILE,parameters: data);
                                                        },
                                                        child: Padding(
                                                            padding: EdgeInsets.only(top: 10,bottom: 10),
                                                            child:
                                                            Card(
                                                              clipBehavior: Clip.antiAlias,
                                                              shape: RoundedRectangleBorder(
                                                                borderRadius: BorderRadius.circular(12.0),
                                                              ),
                                                              elevation: 10,
                                                              child:  Container(
                                                                height: 40,
                                                                width: 200,
                                                                decoration: BoxDecoration(
                                                                  //borderRadius: BorderRadius.circular(12),
                                                                    gradient: LinearGradient(
                                                                      begin: Alignment.centerLeft,
                                                                      end: Alignment.centerRight,
                                                                      colors:[
                                                                        Color(0xFF7F69D4),
                                                                        Color(0xFFC685B0)
                                                                      ],
                                                                    )
                                                                ),
                                                                child: Center(
                                                                  child: TextFieldShow(
                                                                    height: 1.5,
                                                                    textAlign: TextAlign.center,
                                                                    text: "View Profile",
                                                                    fontsize: 14.0,
                                                                    fontWeight: FontWeight.bold,
                                                                    color: Colors.white,
                                                                  ),
                                                                ),
                                                              ),
                                                            )
                                                        ),
                                                      )
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
                              );
                              },
                            padding: EdgeInsets.all(2.0),
                          ),
                        ),
                        // Obx(
                        //   () => Container(
                        //     height: 170,
                        //     child: ListView.builder(
                        //       physics: ClampingScrollPhysics(),
                        //       shrinkWrap: true,
                        //       scrollDirection: Axis.horizontal,
                        //       itemCount: 3,
                        //       itemBuilder: (BuildContext context, int index) {
                        //         return Container(
                        //             height: 160,
                        //             width: 135,
                        //             color: Colors.transparent,
                        //             child: Container(
                        //
                        //
                        //             )
                        //
                        //         );
                        //       },
                        //       padding: EdgeInsets.all(2.0),
                        //     ),
                        //   ),
                        // ),

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
  Widget errorDialog({required double size}){
    return SizedBox(
      height: 180,
      width: 200,
      child:  Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('An error occurred when fetching the posts.',
            style: TextStyle(
                fontSize: size,
                fontWeight: FontWeight.w500,
                color: Colors.black
            ),
          ),
          const SizedBox(height: 10,),
          FlatButton(
              onPressed:  ()  {
                controller.isloder(true);
                controller.error.value=false;
                controller.get_user_data_List();
              },
              child: const Text("Retry", style: TextStyle(fontSize: 20, color: ColorValues.TEXT_COLOR1),)),
        ],
      ),
    );
  }
}
