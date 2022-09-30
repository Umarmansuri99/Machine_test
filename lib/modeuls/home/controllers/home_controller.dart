import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:umar_machine_bytecipher/model/All_user_data_model.dart';
import '../../../utils/api_service.dart';
import '../../../utils/shared_prefrence/shared_prefrences_constant.dart';
import '../../../utils/toast.dart';

class HomeController extends GetxController {
  final count = 0.obs;
  final base_url = "".obs;
  final isloder=false.obs;
  final items = <All_user_data_list>[].obs;
  late SharedPreferences prefs;

  @override
  void onInit() {
    super.onInit();
    LocalList.clear();
    get_user_data_List();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

  void increment() => count.value++;
  final pageNumber = 1.obs;
  final nextPageTrigger = 3.obs;

  final posts = [].obs;
  final LocalList = <dynamic>[].obs;
  final isLastPage = false.obs;
  final error = false.obs;


  final numberOfPostsPerRequest = 10.obs;

  void get_user_data_List() async {
    items.clear();
    isloder(true);
    prefs = await SharedPreferences.getInstance();

    print('=====${prefs.getString(SDConstant.token).toString()}');

    var response = await ApiService()
        .all_user_data(prefs.getString(SDConstant.token).toString(), pageNumber.toString());
    print(response);

        List dataList = response['data'].toList();
        items.value = dataList.map((json) => All_user_data_list.fromJson(json)).toList();


        for(int i=0;i<items.length;i++)
        LocalList.add(items.value[i]);
        print("================$LocalList");


        isLastPage.value = LocalList.length < numberOfPostsPerRequest.value;
        pageNumber.value = pageNumber.value + 1;

        isloder(false);
  }
}
