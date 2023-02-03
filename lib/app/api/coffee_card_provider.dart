import 'package:cashwalkclone/app/api/url_controller.dart';
import 'package:get/get.dart';

import '../model/product/coffee/coffee_card_data_model.dart';

class CoffeeCardProvider extends GetConnect implements GetxService {
  String url = 'https://localhost:3001/';

  UrlController urlController = UrlController();

  Future<List<CoffeeCardModel>?> getCoffeeCardData() async {
    final response = await get('${urlController.baseUrl}getCoffeeCard');
    print(response.body);
    if (response.status.hasError) {
      return Future.error({response.statusText});
    } else {
      return coffeeCardFromJson(response.body);
    }
  }
}
