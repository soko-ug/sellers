import 'package:get/get_connect/http/src/response/response.dart';
import '../../../lib22/data/api/api_client.dart';
import '../../../lib22/util/app_constants.dart';

class BannerRepo{
  final ApiClient apiClient;

  BannerRepo({required this.apiClient});

  Future<Response> getBannerList() async {
    return await apiClient.getData(AppConstants.customerBanner);
  }
}