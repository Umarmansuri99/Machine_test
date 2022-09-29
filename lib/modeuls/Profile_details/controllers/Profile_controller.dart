import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:umar_machine_bytecipher/model/All_user_data_model.dart';
import '../../../model/Get_profile_model.dart';
import '../../../utils/api_service.dart';
import '../../../utils/shared_prefrence/shared_prefrences_constant.dart';
import '../../../utils/toast.dart';

class Profile_controller extends GetxController {
  final count = 0.obs;

  final isloder = false.obs;
  late SharedPreferences prefs;
  final PageController pageController = new PageController(
    // viewportFraction: 1,
      initialPage: 2
  );
  final pCount = 0.obs;
  final itemCount = 9.obs;
  final id = 0.obs;
  final t = "".obs;
  final name = ''.obs;
  final email = ''.obs;
  final profilepicture = ''.obs;
  final location = ''.obs;
  final createdat = ''.obs;


  //
  // void pagination() {
  //   if ((pageController.position.pixels ==
  //       pageController.position.maxScrollExtent) && (countlist < total)) {
  //
  //      // isLoading = true;
  //       pCount.value += 1;
  //       //add api for load the more data according to new page
  //
  //   }
  // }


  @override
  void onInit() {
    //pageController.addListener(pagination);
    super.onInit();
    get_user_data_List();
    Get_image(0,10);
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

  void increment() => count.value++;

  void get_user_data_List() async {
    isloder(true);
    print('==========${Get.parameters['userid'].toString()}');
    String? userid = Get.parameters['userid'].toString();
    prefs = await SharedPreferences.getInstance();

    print('=====${prefs.getString(SDConstant.token).toString()}');

    var response = await ApiService()
        .All_user_data_single(
        prefs.getString(SDConstant.token).toString(), userid);
    print(response);

    id.value = response['id'];
    name.value = response['name'];
    email.value = response['email'];
    print('=====$email');
    profilepicture.value = response['profilepicture'];
    location.value = response['location'];
    createdat.value = response['createdat'];


    isloder(false);
  }

  final profilelist = <Get_profile_model>[].obs;

  final countlist = 0.0.obs;
  final pindex = 0.obs;
  final local_profile = [].obs;


  Pagination(int i) {


  }

  void Get_image(int index,lenth) async {
    profilelist.clear();
    isloder(true);


    var response = await ApiService()
        .Get_profile();
    print(response);

    List dataList = response.toList();

    print("============${dataList.length}");

    countlist.value = dataList.length / 9;


    profilelist.value =
        dataList.map((json) => Get_profile_model.fromJson(json)).toList();


    // int? lenth=10;
   // int? i;

    //
    // if(i!=null){
    //   if(pindex<=index){
    //     for (int i = 0; i <profilelist.length; i++){
    //       local_profile.add(profilelist[i]);
    //       print("=================$local_profile");
    //     }
    //     i+9;
    //   }else if(pindex>=index){
    //     for (int i = 0; i <profilelist.length; i++){
    //       local_profile.add(profilelist[i]);
    //       print("=================$local_profile");
    //     }
    //    i-9;
    //   }
    // }else{
    //   int i=10;
    //   if(pindex<=index){
    //     for (int i = 0; i <profilelist.length; i++){
    //       local_profile.add(profilelist[i]);
    //       print("=================$local_profile");
    //     }
    //     i+9;
    //   }else if(pindex>=index){
    //     for (int i = 0; i <profilelist.length; i++){
    //       local_profile.add(profilelist[i]);
    //       print("=================$local_profile");
    //     }
    //     i-9;
    //   }
    // }




    // pindex.value=index;
    // print("pindex=======$pindex");



    isloder(false);

  }
}
