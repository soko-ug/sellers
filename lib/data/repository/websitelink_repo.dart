import 'package:get/get_connect/http/src/response/response.dart';
import 'package:sokosellers/data/api/api_client.dart';
import 'package:sokosellers/util/app_constants.dart';

class WebsiteLinkRepo{
  final ApiClient apiClient;

  WebsiteLinkRepo({required this.apiClient});

  Future<Response> getWebsiteListApi() async {
    return await apiClient.getData(AppConstants.customerLinkedWebsite);
  }
}