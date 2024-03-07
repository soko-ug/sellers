import 'package:sokosellers/util/app_config.dart';
import 'package:http/http.dart' as http;
import 'package:sokosellers/data/data_model/brand_response.dart';

class BrandRepository {

  Future<BrandResponse> getFilterPageBrands() async {
    Uri url = Uri.parse("${AppConfig.BASE_URL}/filter/brands");
    final response =
    await http.get(url,headers: {
      "App-Language":   AppConfig.mobile_app_code,
    });
    return brandResponseFromJson(response.body);
  }

  Future<BrandResponse> getBrands({name = "", page = 1}) async {
    Uri url = Uri.parse("${AppConfig.BASE_URL}/brands"+
        "?page=${page}&name=${name}");
    final response =
    await http.get(url,headers: {
      "App-Language": AppConfig.mobile_app_code,
    });
    return brandResponseFromJson(response.body);
  }



}
