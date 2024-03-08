import 'package:sokosellers/data/api/api_checker.dart';
import 'package:sokosellers/data/data_model/brand_response.dart';
import 'package:sokosellers/data/model/banner_model.dart';
import 'package:sokosellers/data/repository/banner_repo.dart';
import 'package:get/get.dart';

class BannerController extends GetxController implements GetxService {
  final BannerRepo bannerRepo;
  BannerController({required this.bannerRepo});

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  List<BannerModel>? _bannerList;
  List<BannerModel>? get bannerList => _bannerList;

  // getBrandsList
  List<Brands>? _allBrandStrings;
  List<Brands>? get allBrandStrings => _allBrandStrings;

  Future getBrandsList(bool reload, {bool isUpdate = true}) async{
    if(reload){
      _isLoading = true;
      _allBrandStrings = null;
      if(isUpdate){
        update();
    }

    if(_allBrandStrings == null){

      Response response = await bannerRepo.getBrandsList();
      _allBrandStrings = [];
       

      _allBrandStrings!.addAll(brandResponseFromJson(response.body).brands);
      
      print("--------------the data-------------${_allBrandStrings!}");
    }

  }


  Future getBannerList(bool reload, {bool isUpdate = true})async{
    if(_bannerList == null || reload) {
      _isLoading = true;
      _bannerList = null;
      if (isUpdate) {
        update();
      }
    }
    
    if (_bannerList == null) {
      Response response = await bannerRepo.getBannerList();
      if (response.statusCode == 200) {
        _bannerList = [];
        response.body.forEach((banner) {
          _bannerList!.add(BannerModel.fromJson(banner));
        });
      } else {
        _bannerList = [];
        ApiChecker.checkApi(response);
      }
      _isLoading = false;
      update();
    }
  }
}}