import 'package:sokosellers/util/app_config.dart';
import 'package:sokosellers/data/data_model/carriers_response.dart';
import 'package:sokosellers/data/data_model/delivery_info_response.dart';
import 'package:http/http.dart' as http;

class ShippingRepository{
  Future<List<DeliveryInfoResponse>> getDeliveryInfo() async {
    Uri url =
    Uri.parse("${AppConfig.BASE_URL}/delivery-info");
    final response = await http.get(
      url,
      headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer ${AppConfig.bToken}",
        "App-Language": AppConfig.mobile_app_code,
      },
    );
    print("response.body.toString()${response.body.toString()}");

    return deliveryInfoResponseFromJson(response.body);
  }

}