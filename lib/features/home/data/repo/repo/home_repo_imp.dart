import 'package:shopping_app/core/network/api_result.dart';
import 'package:shopping_app/features/home/data/models/catrgories_list_model.dart';
import 'package:shopping_app/features/home/data/models/product_list_model.dart';
import 'package:shopping_app/features/home/data/repo/data_source/home_data_source_interface.dart';
import 'package:shopping_app/features/home/data/repo/repo/home_repo_interface.dart';

class HomeRepoImp implements HomeRepoInterface {
  final HomeDataSourceInterface dataSource;
  HomeRepoImp(this.dataSource);

  @override
  Future<ApiResult<CatrgoriesList>> getAllCatregories() async {
    return await dataSource.getAllCatregories();
  }

  @override
  Future<ApiResult<ProductList>> getAllProduct() async {
    return await dataSource.getAllProduct();
  }
}
