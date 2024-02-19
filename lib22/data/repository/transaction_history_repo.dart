
import 'package:get/get_connect/http/src/response/response.dart';
import '../../../lib22/data/api/api_client.dart';
import '../../../lib22/util/app_constants.dart';

class TransactionHistoryRepo{
  final ApiClient apiClient;

  TransactionHistoryRepo({required this.apiClient});

  Future<Response> getTransactionHistory(int offset) async {
    return await apiClient.getData('${AppConstants.customerTransactionHistory}?limit=1000&offset=$offset');
  }
}