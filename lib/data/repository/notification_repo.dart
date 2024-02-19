import 'package:get/get_connect/http/src/response/response.dart';
import 'package:sokosellers/data/api/api_client.dart';
import 'package:sokosellers/util/app_constants.dart';

class NotificationRepo{
  final ApiClient apiClient;

  NotificationRepo({required this.apiClient});

  Future<Response> getNotificationList() async {
    return await apiClient.getData(AppConstants.notificationUri);
  }
}