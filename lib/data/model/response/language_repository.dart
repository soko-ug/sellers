// // import 'package:active_flutter_delivery_app/app_config.dart';
// // import 'package:active_flutter_delivery_app/data_model/language_list_response.dart';
// // import 'package:active_flutter_delivery_app/helpers/api_request.dart';
// // import 'package:active_flutter_delivery_app/helpers/shared_value_helper.dart';



// import 'package:sokosellers/data/model/language_list_response.dart';

// class LanguageRepository {
//   Future<LanguageListResponse> getLanguageList() async {
//     String url = ( "${AppConfig.BASE_URL}/languages");
//     final response = await ApiRequest.get(url: url,headers: {
//       "App-Language": AppConfig.mobile_app_code!,
//     }
//     );
//     //print(response.body.toString());
//     return languageListResponseFromJson(response.body);
//   }


// }
