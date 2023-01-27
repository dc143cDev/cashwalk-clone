import 'package:get/get.dart';

import '../model/product/coffee/coffee_data_model.dart';

//데이터 프로바이더.

//사이클.

//api 를 호출하는 프로바이더를 이곳에 선언 ->
//각 UI 의 컨트롤러에서 프로바이더의 원하는 프로바이더를 호출 ->
//프로바이더는 productFromJson 으로 데이터 모델에 데이터를 넘겨
//flutter UI 에서 활용할수 있도록 바꿔줌 ->
//최종 유저가 사용할 UI 에서 빌더를 사용해 UI 모델에 데이터 값을 하나씩 담아줌. 완성.
class ProductProvider extends GetConnect implements GetxService {
  //api get 호출 메소드.
  Future<List<CoffeeProductModel>?> getStbProductData() async {
    final response = await get('http://localhost:8000/getStbCoffee');
    print(response.body);
    if (response.status.hasError) {
      return Future.error({response.statusText});
    } else {
      return productFromJson(response.body);
    }
  }

  Future<List<CoffeeProductModel>?> getTwsProductData() async {
    final response = await get('http://localhost:8000/getTwsCoffee');
    print(response.body);
    if (response.status.hasError) {
      return Future.error({response.statusText});
    } else {
      return productFromJson(response.body);
    }
  }

  Future<List<CoffeeProductModel>?> getYdyProductData() async {
    final response = await get('http://localhost:8000/getYdyCoffee');
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
