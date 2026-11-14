import 'package:shopping_app/core/network/api_result.dart';
import 'package:shopping_app/features/home/data/api/home_api.dart';
import 'package:shopping_app/features/home/data/models/catrgories_list_model.dart';
import 'package:shopping_app/features/home/data/repo/data_source/home_data_source_interface.dart';

class HomeDataSourceImp implements HomeDataSourceInterface {
  @override
  Future<ApiResult<CatrgoriesList>> getAllCatregories() async =>
      HomeApi.getAllCatregories();
}
