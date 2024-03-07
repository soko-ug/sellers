import 'package:sokosellers/util/app_config.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:sokosellers/data/data_model/language_list_response.dart';

class LanguageRepository {
  Future<LanguageListResponse> getLanguageList() async {
    Uri url = Uri.parse(
        "${AppConfig.BASE_URL}/languages");
    final response = await http.get(url,headers: {
      "App-Language": AppConfig.mobile_app_code,
    }
    );
    //print(response.body.toString());
    return languageListResponseFromJson(response.body);
  }


}
