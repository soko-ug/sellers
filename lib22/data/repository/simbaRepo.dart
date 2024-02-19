import 'package:get/get_connect/http/src/response/response.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../lib22/data/api/api_client.dart';
import '../../../lib22/util/app_constants.dart';

class SimbaRepo {
  late ApiClient apiClient;
  late final SharedPreferences sharedPreferences;
  
  SimbaRepo({required this.sharedPreferences, required this.apiClient});

  
Future<Response> getProfilesData() async{
  return await apiClient.getData(AppConstants.getAllProfile);
}


 Future<Response> getBannerList() async {
    return await apiClient.getData(AppConstants.customerBanner);
  }


// late final ApiClient apiClient;

//   Future<Response> getProfilesData() async{
//     return await apiClient.getData('getallusers');
//   }

//    Future<Response> updateZone() async {
//     return await apiClient.getData(AppConstants.updateZoneUri);
//   }
}



class SimbaProfileRepo{
  
  
}