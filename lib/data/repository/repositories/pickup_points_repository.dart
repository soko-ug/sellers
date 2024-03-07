import 'package:sokosellers/util/app_config.dart';
import 'package:sokosellers/data/data_model/pickup_points_response.dart';
import 'package:http/http.dart' as http;

class PickupPointRepository{
  Future<PickupPointListResponse> getPickupPointListResponse()async{
    Uri url = Uri.parse('${AppConfig.BASE_URL}/pickup-list');

    final response = await http.get(url);

    //print("response ${response.body}");

    return pickupPointListResponseFromJson(response.body);
  }
}