import 'package:expandable_bottom_sheet/expandable_bottom_sheet.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:sokosellers/data/data_model/brand_response.dart';
import 'package:sokosellers/data/data_model/product_details_response.dart';
import 'package:sokosellers/data/repository/repositories/brand_repository.dart';
import 'package:sokosellers/util/app_config.dart';
import 'package:sokosellers/view/base/custom_snackbar.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:http/http.dart' as http;


class HomeController extends GetxController implements GetxService{


// sliders
// brands
List<BrandResponse>? _allBrands;
List<BrandResponse>? get allBrands => _allBrands;

List<Brands>? _allBrandStrings;
List<Brands>? get allBrandStrings => _allBrandStrings;

RxList<Brand> brands = <Brand>[].obs;

List<dynamic> _brandList = [];
List<dynamic> get brandList => _brandList;

fetchBrandData() async {
    var brandResponse =  await BrandRepository().getBrands();
    print(brandResponse.brands);
    _brandList.addAll(brandResponse.brands);
    // _isBrandInitial = false;
    // _totalBrandData = brandResponse.meta.total;
    // _showBrandLoadingContainer = false;
    // setState(() {});
    update();

    // print(brandList);
  }


Future<void> getAllBrandStrings() async {
  if(_allBrandStrings == null){
     Uri url = Uri.parse("${AppConfig.BASE_URL}/brands");
    final response = await http.get(url,headers: {
      "App-Language": AppConfig.mobile_app_code,
    });
    _allBrandStrings = [];
    _allBrandStrings!.addAll(brandResponseFromJson(response.body).brands);
  print(_allBrandStrings);
  }
}



  // Future<void> getAllProducts(bool reload, bool notify) async {
  //   if(reload){
  //     _listAllProducts = [];
  //   }

  //   if(notify){
  //     update();
  //   }
  //   if(_listAllProducts == null || reload) {
  //     Response response = await productsRepo.getProductsList22();
  //     if (response.statusCode == 200) {
  //       _listAllProducts = [];
  //       _listAllProducts!.addAll(ProductMiniResponse.fromJson(response.body).products);
  //       _isLoading = false;
  //     } else {
  //       ApiChecker.checkApi(response);
  //     }
  //     update();
  //   }



 Future<void> getBrands2() async {
    Uri url = Uri.parse("${AppConfig.BASE_URL}/brands");
    
    final response = await http.get(url,headers: {
      "App-Language": AppConfig.mobile_app_code,
    });

    
    if (response.statusCode == 200) {
          final brandResponse = brandResponseFromJson(response.body);
          brands.value = brandResponse as List<Brand>;
        } else {
          throw Exception('Failed to load brands');
    }

print(brands.value);
    //  brands.value = brandResponse.data;
    // return brandResponseFromJson(response.body);
  }

  Future<void> fetchBrands() async {
    try {
      final url = Uri.parse("${AppConfig.BASE_URL}/filter/brands");
      final response = await http.get(
        url,
        headers: {"App-Language": AppConfig.mobile_app_code},
      );

      if (response.statusCode == 200) {
        final brandResponse = brandResponseFromJson(response.body);
        brands.value = brandResponse.brands.cast<Brand>();
      } else {
        throw Exception('Failed to load brands');
      }
      print(brands.value);
    } catch (e) {
      print('Error fetching brands: $e');
    }
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


Future<void> getAllBrands() async{
  _allBrands = null;
  var brandResponse =await BrandRepository().getBrands();
  // _allBrands = await Get.find<BrandService>().getAllBrands();
  _allBrands!.addAll(brandResponse.brands as Iterable<BrandResponse>);
  print(_allBrands);
  update();
}


// featuring products
// new products
// best selling products
// category-wise products









  ///Hero tag
   final String _heroShowQr = 'show-qr-hero';
   String get heroShowQr => _heroShowQr;

   ///Greetings

   String greetingMessage(){

     var timeNow = DateTime.now().hour;

     if (timeNow <= 12) {
       return 'good_morning'.tr;
     } else if ((timeNow > 12) && (timeNow <= 16)) {
       return 'good_afternoon'.tr;
     } else if ((timeNow > 16) && (timeNow < 20)) {
       return 'good_evening'.tr;
     } else {
       return 'good_night'.tr;
     }
   }


  /// For web site
  String _webSiteLink = '';
  String get webSiteLink => _webSiteLink;
  setWebLink(String link){
    _webSiteLink = '';
    _webSiteLink = link;
    update();
  }
   void launchURL(String url) async {
     if (await canLaunchUrl(Uri.parse(url))) {
       await launchUrl(Uri.parse(url), webOnlyWindowName: 'web');
     } else {
       showCustomSnackBar('Could not launch $url', isError: true);
     }
   }

  /// Sliding Banner
  int _activeIndicator = 0;
  int get activeIndicator => _activeIndicator;

  indicateIndex(int index) {
    _activeIndicator = index;
    update();
  }

  ///controlling bottom sheet
  GlobalKey<ExpandableBottomSheetState> expadedKey = GlobalKey();
  bool _isExpanded = false;
  bool get isExpanded => _isExpanded;
  expanded(bool state){
    _isExpanded = state;
  }


  int? _selectItem = 0;

  int? get selectedItem => _selectItem;

  itemSelect({int? index}){
    _selectItem = index;
    update();
  }


}