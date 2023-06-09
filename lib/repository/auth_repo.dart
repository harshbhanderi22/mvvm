import 'package:mvvm/data/network/base_api_service.dart';
import 'package:mvvm/data/network/network_api_service.dart';
import 'package:mvvm/utils/app_urls.dart';

class AuthRepository {
  
  final BaseApiService _apiService = NetworkApiService();

  Future loginApi(dynamic data) async {
    try {
      dynamic response = await _apiService.postApi(AppUrls.loginUrl, data);
      return response;
    } catch (e) {
      rethrow;
    }
  }
}
