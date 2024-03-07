import 'package:sokosellers/util/app_config.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:sokosellers/data/data_model/refund_request_response.dart';
import 'package:sokosellers/data/data_model/refund_request_send_response.dart';

class RefundRequestRepository {

  Future<RefundRequestResponse> getRefundRequestListResponse({@required page = 1}) async {

    Uri url = Uri.parse("${AppConfig.BASE_URL}/refund-request/get-list");
    final response = await http.get(
      url,
      headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer ${AppConfig.bToken}",
        "App-Language": AppConfig.mobile_app_code,
      },
    );
    //print(response.body.toString());
    return refundRequestResponseFromJson(response.body);
  }

  Future<RefundRequestSendResponse> getRefundRequestSendResponse({ int? id,@required String? reason}
      ) async {
    var post_body = jsonEncode({
      "id": "${id}",
      "reason": "${reason}",
    });

    Uri url = Uri.parse("${AppConfig.BASE_URL}/refund-request/send");
    final response =
    await http.post(url,
        headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer ${AppConfig.bToken}","App-Language": AppConfig.mobile_app_code,
        },
        body: post_body);

    return refundRequestSendResponseFromJson(response.body);
  }

}