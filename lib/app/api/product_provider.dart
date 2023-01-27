import 'package:get/get.dart';

import '../model/product/coffee/stb_data_model.dart';

class ProductProvider extends GetConnect implements GetxService {
  Future<List<StbProductModel>?> getStbProductData() async {
    final response = await get('http://localhost:8000/getStbCoffee');
    print(response.body);
    if (response.status.hasError) {
      return Future.error({response.statusText});
    } else {
      return productFromJson(response.body);
    }
  }

  @override
  void onInit() {
    super.onInit();
  }
}
