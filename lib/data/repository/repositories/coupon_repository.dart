import 'package:sokosellers/util/app_config.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/foundation.dart';
import 'dart:convert';

import 'package:sokosellers/data/data_model/coupon_apply_response.dart';
import 'package:sokosellers/data/data_model/coupon_remove_response.dart';

class CouponRepository {
  Future<CouponApplyResponse> getCouponApplyResponse(
      @required String coupon_code) async {
    var post_body =
        jsonEncode({"user_id": "${AppConfig.user_id}", "coupon_code": "$coupon_code"});

    Uri url = Uri.parse("${AppConfig.BASE_URL}/coupon-apply");
    final response = await http.post(url,
        headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer ${AppConfig.bToken}",
          "App-Language": AppConfig.mobile_app_code
        },
        body: post_body);

    return couponApplyResponseFromJson(response.body);
  }

  Future<CouponRemoveResponse> getCouponRemoveResponse() async {
    var post_body = jsonEncode({"user_id": "${AppConfig.user_id}"});

    Uri url = Uri.parse("${AppConfig.BASE_URL}/coupon-remove");
    final response = await http.post(url,
        headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer ${AppConfig.bToken}",
          "App-Language": AppConfig.mobile_app_code
        },
        body: post_body);

    return couponRemoveResponseFromJson(response.body);
  }
}
