// import 'package:active_flutter_delivery_app/app_config.dart';
// import 'package:active_flutter_delivery_app/data_model/common_response.dart';
// import 'package:active_flutter_delivery_app/helpers/aiz_route.dart';
// import 'package:active_flutter_delivery_app/helpers/api_request.dart';
// import 'package:active_flutter_delivery_app/data_model/login_response.dart';
// import 'package:active_flutter_delivery_app/data_model/logout_response.dart';
// import 'package:active_flutter_delivery_app/data_model/user_by_token.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sokosellers/data/api/api_client.dart';
import 'package:sokosellers/data/model/response/logout_response.dart';
import 'dart:convert';

import 'package:sokosellers/data/repository/login_response.dart';
import 'package:sokosellers/util/app_constants.dart';
// import 'package:active_flutter_delivery_app/helpers/shared_value_helper.dart';

class AuthRepository {
  

  // LOG IN
    Future<LoginResponse> getLoginResponse(
       String? email,  String password,String loginBy) async {
    var post_body = jsonEncode({"user_type": "seller","email": "${email}", "password": "$password",
      "login_by": loginBy});
        final response = await ApiClient.postSoko(url: ("${AppConstants.baseUrl}auth/login"),
            headers: {"Content-Type": "application/json","X-Requested-With":"XMLApiClientRequest"}, body: post_body);
        print(response.body);
        
        return loginResponseFromJson(response.body);
      }




// LOG OUT
  Future<LogoutResponse> getLogoutResponse() async {


   final sharedPreferences = await SharedPreferences.getInstance();
   final String? access_token = sharedPreferences.getString('access_token');


    final response = await ApiClient.sokoGet(url:
      ( "${AppConstants.baseUrl}/auth/logout")
     ,
      headers: {
        "Authorization": "Bearer ${access_token}"
      },
    );



    return logoutResponseFromJson(response.body);
  }


// GET USER BY TOKEN
  Future<LoginResponse> getUserByTokenResponse() async {

  final sharedPreferences = await SharedPreferences.getInstance();
  final String? access_token = sharedPreferences.getString('access_token');


    var post_body = jsonEncode({"access_token": "${access_token}"});

    final response = await ApiClient.postSoko(url:
      ("${AppConstants.baseUrl}/auth/info")
        ,
        headers: {"Content-Type": "application/json"},
        body: post_body);

    return loginResponseFromJson(response.body);
  }




  // Future<CommonResponse> getAccountDeleteResponse() async {
  //   String url = ("${AppConstants.baseUrl}/auth/account-deletion");

  //   print(url.toString());

  //   print("Bearer ${access_token.$}");
  //   final response = await ApiClient.get(
  //     url: url,
  //     headers: {
  //       "Authorization": "Bearer ${access_token.$}",
  //       "App-Language": app_language.$!,
  //     },
  //   );
  //   print(response.body);
  //   return commonResponseFromJson(response.body);
  // }

}
