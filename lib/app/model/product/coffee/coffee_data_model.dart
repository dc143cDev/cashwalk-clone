List<CoffeeProductModel> productFromJson(dynamic str) =>
    List<CoffeeProductModel>.from(
        (str).map((x) => CoffeeProductModel.fromJson(x)));

//데이터 모델.
//데이터베이스의 구조에 맞추어 변수에 데이터베이스에서 가져온 데이터를 담아줌.
//동일한 구조를 사용하는 테이블은 하나로 묶어 하나의 데이터 모델을 거쳐감.
class CoffeeProductModel {
  int? productId;
  String? productName;
  String? productBrand;
  String? productPrice;
  String? productImagePath;

  CoffeeProductModel(this.productId, this.productName, this.productBrand,
      this.productPrice, this.productImagePath);

  CoffeeProductModel.fromJson(Map<String, dynamic> json) {
    productId = json['product_id'];
    productName = json['name'];
    productBrand = json['brand'];
    productPrice = json['price'];
    productImagePath = json['image_path'];
  }

  Map<String, dynamic> toJson() => {
        "product_id": productId.toString(),
        "name": productName,
        "brand": productBrand,
        "price": productPrice,
        "image_path": productImagePath
      };
}
