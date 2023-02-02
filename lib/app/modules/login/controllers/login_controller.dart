import 'package:cashwalkclone/app/api/url_controller.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

class LoginController extends GetxController {
  var formKey = GlobalKey<FormState>();

  var emailController = TextEditingController();
  var passwordController = TextEditingController();

  UrlController urlController = UrlController();

  //로그인 버튼 클릭
  //발리데이터 데이터를 확인하고, 올바른 데이터일시 로그인 쿼리 날림.
  isLoginBtnClicked() {
    if (formKey.currentState!.validate()) {
      getEmailData() async {
        var url = "${urlController.baseUrl}";
      }

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
