import 'package:sokosellers/util/app_config.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:sokosellers/data/data_model/review_response.dart';
import 'package:sokosellers/data/data_model/review_submit_response.dart';

import 'package:flutter/foundation.dart';

class ReviewRepository {
  Future<ReviewResponse> getReviewResponse(@required int product_id,{page = 1}) async {

    Uri url = Uri.parse("${AppConfig.BASE_URL}/reviews/product/${product_id}?page=${page}");
    final response = await http.get(
      url,
      headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer ${AppConfig.bToken}","App-Language": AppConfig.mobile_app_code,
      },
    );
    return reviewResponseFromJson(response.body);
  }

  Future<ReviewSubmitResponse> getReviewSubmitResponse(
      @required int product_id,
      @required int rating,
      @required String comment,
      ) async {
    var post_body = jsonEncode({
      "product_id": "${product_id}",
      "user_id": "${AppConfig.user_id}",
      "rating": "$rating",
      "comment": "$comment"
    });

    Uri url = Uri.parse("${AppConfig.BASE_URL}/reviews/submit");
    final response =
    await http.post(url,
        headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer ${AppConfig.bToken}","App-Language": AppConfig.mobile_app_code,
        },
        body: post_body);

    return reviewSubmitResponseFromJson(response.body);
  }


}