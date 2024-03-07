import 'package:sokosellers/util/app_config.dart';
import 'package:http/http.dart' as http;
import 'package:sokosellers/data/data_model/slider_response.dart';
class SlidersRepository {
  Future<SliderResponse> getSliders() async {

    Uri url =  Uri.parse("${AppConfig.BASE_URL}/sliders");
    final response =
        await http.get(url,
          headers: {
            "App-Language": AppConfig.mobile_app_code,
          },);
    /*print(response.body.toString());
    print("sliders");*/
    return sliderResponseFromJson(response.body);
  }

  Future<SliderResponse> getBannerOneImages() async {

    Uri url =  Uri.parse("${AppConfig.BASE_URL}/banners-one");
    final response =
    await http.get(url,
      headers: {
        "App-Language": AppConfig.mobile_app_code,
      },);
    /*print(response.body.toString());
    print("sliders");*/
    return sliderResponseFromJson(response.body);
  }

  Future<SliderResponse> getBannerTwoImages() async {

    Uri url =  Uri.parse("${AppConfig.BASE_URL}/banners-two");
    final response =
    await http.get(url,
      headers: {
        "App-Language": AppConfig.mobile_app_code,
      },);
    /*print(response.body.toString());
    print("sliders");*/
    return sliderResponseFromJson(response.body);
  }

  Future<SliderResponse> getBannerThreeImages() async {

    Uri url =  Uri.parse("${AppConfig.BASE_URL}/banners-three");
    final response =
    await http.get(url,
      headers: {
        "App-Language": AppConfig.mobile_app_code,
      },);
    /*print(response.body.toString());
    print("sliders");*/
    return sliderResponseFromJson(response.body);
  }
}
