class ProductList {
  List<ProductModel>? list;
  int? total;
  int? skip;
  int? limit;

  ProductList({this.list, this.total, this.skip, this.limit});

  ProductList.fromJson(Map<String, dynamic> json) {
    if (json['list'] != null) {
      list = <ProductModel>[];
      json['list'].forEach((v) {
        list!.add(ProductModel.fromJson(v));
      });
    }
  }
}

class ProductModel {
  int? id;
  String? title;
  double? price;
  double? discountPercentage;
  double? rating;
  int? stock;

  List<String>? image;

  ProductModel({
    this.id,
    this.title,
    this.price,
    this.discountPercentage,
    this.rating,
    this.stock,
    this.image,
  });

  ProductModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    price = json['price'];
    discountPercentage = json['discountPercentage'];
    rating = json['rating'];
    stock = json['stock'];
    image = json['image'];
  }
}
