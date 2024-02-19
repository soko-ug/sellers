import 'package:get/get_connect/http/src/response/response.dart';
import 'package:sokosellers/data/api/api_client.dart';
import 'package:sokosellers/util/app_constants.dart';

class BannerRepo{
  final ApiClient apiClient;

  BannerRepo({required this.apiClient});

  Future<Response> getBannerList() async {
    return await apiClient.getData(AppConstants.customerBanner);
  }
}