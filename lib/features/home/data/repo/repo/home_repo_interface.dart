import 'package:shopping_app/core/network/api_result.dart';
import 'package:shopping_app/features/home/data/models/catrgories_list_model.dart';
import 'package:shopping_app/features/home/data/models/product_list_model.dart';

abstract class HomeRepoInterface {
  Future<ApiResult<CatrgoriesList>> getAllCatregories();
  Future<ApiResult<ProductList>> getAllProduct();
}
