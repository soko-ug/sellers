import 'package:sokosellers/util/app_config.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/foundation.dart';
import 'package:sokosellers/data/data_model/order_mini_response.dart';
import 'package:sokosellers/data/data_model/order_detail_response.dart';
import 'package:sokosellers/data/data_model/order_item_response.dart';

class OrderRepository {
  Future<OrderMiniResponse> getOrderList(
      {page = 1, payment_status = "", delivery_status = ""}) async {
    Uri url = Uri.parse("${AppConfig.BASE_URL}/purchase-history" +
        "?page=${page}&payment_status=${payment_status}&delivery_status=${delivery_status}");
    print("url:" +url.toString());
    print("token:" +AppConfig.bToken);
    final response = await http.get(url,headers: {
      "Authorization": "Bearer ${AppConfig.bToken}",
      "App-Language": AppConfig.mobile_app_code,
        });

    print("res:${response.body}");
    return orderMiniResponseFromJson(response.body);
  }

  Future<OrderDetailResponse> getOrderDetails({@required int id = 0}) async {
    Uri url = Uri.parse(
        "${AppConfig.BASE_URL}/purchase-history-details/" + id.toString());

    final response = await http.get(url,headers: {
      "Authorization": "Bearer ${AppConfig.bToken}",
          "App-Language": AppConfig.mobile_app_code,
        });
    //print("url:" +url.toString());
    print(response.body);
    return orderDetailResponseFromJson(response.body);
  }

  Future<OrderItemResponse> getOrderItems({@required int id = 0}) async {
    Uri url = Uri.parse(
        "${AppConfig.BASE_URL}/purchase-history-items/" + id.toString());
    final response = await http.get(url,headers: {
      "Authorization": "Bearer ${AppConfig.bToken}",
      "App-Language": AppConfig.mobile_app_code,
        });

    return orderItemlResponseFromJson(response.body);
  }
}
