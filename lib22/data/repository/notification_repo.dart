import 'package:get/get_connect/http/src/response/response.dart';
import '../../../lib22/data/api/api_client.dart';
import '../../../lib22/util/app_constants.dart';

class NotificationRepo{
  final ApiClient apiClient;

  NotificationRepo({required this.apiClient});

  Future<Response> getNotificationList() async {
    return await apiClient.getData(AppConstants.notificationUri);
  }
}