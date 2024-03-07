import 'package:sokosellers/util/app_config.dart';
import 'package:http/http.dart' as http;
import 'package:sokosellers/data/data_model/category_response.dart';

class CategoryRepository {

  Future<CategoryResponse> getCategories({parent_id = 0}) async {
    Uri url = Uri.parse("${AppConfig.BASE_URL}/categories?parent_id=${parent_id}");
    final response =
    await http.get(url,headers: {
      "App-Language": AppConfig.mobile_app_code,
    });
    // print("${AppConfig.BASE_URL}/categories?parent_id=${parent_id}");
    // print(response.body.toString());
    return categoryResponseFromJson(response.body);
  }

  Future<CategoryResponse> getFeturedCategories() async {
    Uri url = Uri.parse("${AppConfig.BASE_URL}/categories/featured");
    final response =
        await http.get(url,headers: {
          "App-Language": AppConfig.mobile_app_code,
        });
    //print(response.body.toString());
    //print("--featured cat--");
    return categoryResponseFromJson(response.body);
  }

  Future<CategoryResponse> getTopCategories() async {
    Uri url = Uri.parse("${AppConfig.BASE_URL}/categories/top");
    final response =
    await http.get(url,headers: {
      "App-Language": AppConfig.mobile_app_code,
    });
    return categoryResponseFromJson(response.body);
  }

  Future<CategoryResponse> getFilterPageCategories() async {
    Uri url = Uri.parse("${AppConfig.BASE_URL}/filter/categories");
    final response =
    await http.get(url,headers: {
      "App-Language": AppConfig.mobile_app_code,
    });
    return categoryResponseFromJson(response.body);
  }


}
