import 'package:sokosellers/util/app_config.dart';
import 'package:http/http.dart' as http;
import 'package:sokosellers/data/data_model/flash_deal_response.dart';

class FlashDealRepository {
  Future<FlashDealResponse> getFlashDeals() async {

    Uri url = Uri.parse("${AppConfig.BASE_URL}/flash-deals");
    print(url.toString());
    final response =
        await http.get(url,
            headers: {
          "App-Language": AppConfig.mobile_app_code,
        },
        );
    print(response.body.toString());

    return flashDealResponseFromJson(response.body.toString());
  }
}
