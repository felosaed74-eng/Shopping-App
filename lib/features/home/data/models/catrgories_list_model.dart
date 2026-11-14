class CatrgoriesList {
  List<CategoryModel>? list;

  CatrgoriesList({this.list});

  CatrgoriesList.fromJson(Map<String, dynamic> json) {
    if (json['list'] != null) {
      list = <CategoryModel>[];
      json['list'].forEach((v) {
        list!.add(new CategoryModel.fromJson(v));
      });
    }
  }
}

class CategoryModel {
  String? slug;
  String? name;

  CategoryModel({this.slug, this.name});

  CategoryModel.fromJson(Map<String, dynamic> json) {
    slug = json['slug'];
    name = json['name'];
  }
}
