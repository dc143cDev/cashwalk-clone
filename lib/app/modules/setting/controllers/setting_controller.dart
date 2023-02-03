import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../walk/controllers/walk_controller.dart';

class SettingController extends GetxController {
  WalkController walkController = WalkController();

  GetStorage storage = GetStorage();

  is10kUpBtnClicked() {
    walkController.cashCount.value += 10000;
    print(walkController.cashCount.value);
    storage.write('currentCash', walkController.cashCount.value);
    storage.save();
  }

  @override
  void onInit() {
    super.onInit();
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
