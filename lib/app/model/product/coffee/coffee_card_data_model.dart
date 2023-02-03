List<CoffeeCardModel> coffeeCardFromJson(dynamic str) =>
    List<CoffeeCardModel>.from((str).map((x) => CoffeeCardModel.fromJson(x)));

class CoffeeCardModel {
  String? title;
  String? brand;
  int? price;
  String? imagePath;

  CoffeeCardModel(
    this.title,
    this.brand,
    this.price,
    this.imagePath,
  );

  CoffeeCardModel.fromJson(Map<String, dynamic> json) {
    title = json['card_title'];
    brand = json['card_brand'];
    price = json['card_price'];
    imagePath = json['image_path'];
  }
}
