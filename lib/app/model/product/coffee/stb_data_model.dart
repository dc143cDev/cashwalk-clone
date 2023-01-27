List<StbProductModel> productFromJson(dynamic str) =>
    List<StbProductModel>.from((str).map((x) => StbProductModel.fromJson(x)));

class StbProductModel {
  int? productId;
  String? productName;
  String? productBrand;
  String? productPrice;
  String? productImagePath;

  StbProductModel(this.productId, this.productName, this.productBrand,
      this.productPrice, this.productImagePath);

  StbProductModel.fromJson(Map<String, dynamic> json) {
    productId = json['product_stb_id'];
    productName = json['name'];
    productBrand = json['brand'];
    productPrice = json['price'];
    productImagePath = json['image_path'];
  }

  Map<String, dynamic> toJson() => {
        "product_stb_id": productId.toString(),
        "name": productName,
        "brand": productBrand,
        "price": productPrice,
        "image_path": productImagePath
      };
}
