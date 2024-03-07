import 'package:sokosellers/util/app_config.dart';
import 'package:http/http.dart' as http;
import 'package:sokosellers/data/data_model/wallet_balance_response.dart';
import 'package:sokosellers/data/data_model/wallet_recharge_response.dart';

class WalletRepository {
  Future<WalletBalanceResponse> getBalance() async {
    Uri url = Uri.parse("${AppConfig.BASE_URL}/wallet/balance");
    final response = await http.get(
      url,
      headers: {
        "Authorization": "Bearer ${AppConfig.bToken}",
        "App-Language": AppConfig.mobile_app_code,
      },
    );
    //print("wallet token ${AppConfig.bToken}");

    //print("wallet ${response.body.toString()}");
    return walletBalanceResponseFromJson(response.body);
  }

  Future<WalletRechargeResponse> getRechargeList({int page = 1}) async {
    Uri url = Uri.parse(
        "${AppConfig.BASE_URL}/wallet/history?page=${page}");

    final response = await http.get(
      url,
      headers: {
        "Authorization": "Bearer ${AppConfig.bToken}",
        "App-Language": AppConfig.mobile_app_code,
      },
    );

    //print("url:" +url.toString());
    //print(response.body);
    return walletRechargeResponseFromJson(response.body);
  }
}
