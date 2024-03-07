import 'dart:convert';
import 'package:sokosellers/util/app_config.dart';
import 'package:sokosellers/data/data_model/offline_wallet_recharge_response.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class OfflineWalletRechargeRepository{

 Future<OfflineWalletRechargeResponse> getOfflineWalletRechargeResponse({ String? amount,
   String? name,
   String? trx_id,
   int? photo})async{


    var post_body = jsonEncode({
      "amount": "$amount",
      "payment_option": "Offline Payment",
      "trx_id": "$trx_id",
      "photo": "$photo",
    });
    Uri url = Uri.parse("${AppConfig.BASE_URL}/wallet/offline-recharge");
    final response = await http.post(url,
        headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer ${AppConfig.bToken}",
          "App-Language": AppConfig.mobile_app_code
        },
        body: post_body);
     print("hello Offline wallet recharge" + response.body.toString());
     return offlineWalletRechargeResponseFromJson(response.body);
  }
}