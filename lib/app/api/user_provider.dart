import 'dart:convert';

import 'package:cashwalkclone/app/api/url_controller.dart';
import 'package:get/get.dart';

import '../model/user/user_data_model.dart';

class UserProvider extends GetConnect implements GetxService {
  String url = 'https://localhost:3001/';

  UrlController urlController = UrlController();

  Future<List<UserModel>?> getUserData() async {
    final response = await get('${urlController.baseUrl}getUserRanking');
    print('url controller: ${urlController.baseUrl}');
    print(response.body);

    if (response.status.hasError) {
      return Future.error({response.statusText});
    } else {
      return usersFromJson(response.body);
    }
  }

  @override
  void onInit() {
    super.onInit();
  }
}
