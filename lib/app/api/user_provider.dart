import 'dart:convert';

import 'package:get/get.dart';

import '../model/user/user_data_model.dart';

class UserProvider extends GetConnect implements GetxService {
  Future<List<UserModel>?> getUserData() async {
    final response = await get('http://localhost:8000/getUserRanking');
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
    //
    // httpClient
    //   ..baseUrl = 'http://localhost:8000/get'
    //   ..defaultContentType = 'application/json'
    //   ..timeout = const Duration(seconds: 10)
    //   ..addRequestModifier<dynamic>((request) {
    //     request.headers['Authorization'] = '';
    //     return request;
    //   });
  }
}
