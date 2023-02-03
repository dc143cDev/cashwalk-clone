import 'package:cashwalkclone/app/modules/home/views/home_view.dart';
import 'package:cashwalkclone/app/modules/login/views/login_view.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class LoadingController extends GetxController {
  var isLogin = false.obs;

  var userCMLoad = ''.obs;

  GetStorage storage = GetStorage();
  @override
  void onInit() {
    super.onInit();

    print('user CM: ${storage.read('userCM')}');
    if (storage.read('userCM') == 0) {
      isLogin.value = false;
    } else {
      isLogin.value = true;
    }
    Future.delayed(Duration(seconds: 3), () {
      print('is login? : ${isLogin.value}/${storage.read('userCM')}');
      if (isLogin.value == false) {
        Get.off(LoginView());
      } else if (isLogin.value == true) {
        Get.off(HomeView());
      }
    });
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
