import 'package:http/http.dart' as http;
import 'package:shopping_app/core/constants/api_constants.dart';
import 'package:shopping_app/features/auth/data/models/register_request_model.dart';

abstract class AuthApi {
  register(RegisterRequestModel request) {
    Uri url = Uri.parse("${ApiConstants.baseUrl}${ApiConstants.register}");
    http.post(url);
  }
}
