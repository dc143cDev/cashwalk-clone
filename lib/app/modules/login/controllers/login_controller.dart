import 'package:cashwalkclone/app/api/url_controller.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

class LoginController extends GetxController {
  var formKey = GlobalKey<FormState>();

  var cmController = TextEditingController();
  var weightController = TextEditingController();

  GetStorage storage = GetStorage();

  UrlController urlController = UrlController();

  //로그인 버튼 클릭
  //발리데이터 데이터를 확인하고, 올바른 데이터일시 로그인 쿼리 날림.
  isLoginBtnClicked() {
    if (formKey.currentState!.validate()) {
      print('cmC text:${cmController.text}');
      storage.write('userCM', cmController.text);
      storage.write('userWeight', weightController.text);
      print(storage.read('userCM'));

      Get.offNamed('/home');
    }
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
