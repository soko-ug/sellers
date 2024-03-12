import 'package:get/get_connect/http/src/response/response.dart';
import 'package:sokosellers/data/api/api_client.dart';
import 'package:sokosellers/util/app_constants.dart';
import 'package:http/http.dart' as http;

class BannerRepo{
  final ApiClient apiClient;

  BannerRepo({required this.apiClient});

  Future<Response> getBannerList() async {
    return await apiClient.getData(AppConstants.customerBanner);
  }

  Future<Response> getBrandsList() async {
    return await apiClient.getData("brands");
  }

  // top brands
   Future<Response> getTopBrandsList() async {
    return await apiClient.getData("brands/top");
  }



//  categories categories?parent_id=0
  Future<Response> getCategoryList() async {
    return await apiClient.getData("categories?parent_id=0");
  }

  // top categories
   Future<Response> getTopCategoryList() async {
    return await apiClient.getData("categories/top");
  }

  // featured categories
   Future<Response> getFeatureCategoryList() async {
    return await apiClient.getData("categories/featured");
  }

// Products Secions

// featured products
 Future<Response> getFeatureProductsList({page = 1}) async {
    return await apiClient.getData("products/featured?page=$page");
 }

 // Best selling products
 Future<Response> getBestSellingProductsList() async {
    return await apiClient.getData("products/best-seller");
 }

  // Best Category products
 Future<Response> getCategoryProductsList( id ,  page, name ) async {
    return await apiClient.getData("products/category/$id?page=$page&name=$name");
 }

//  shop Products
 Future<Response> getShopProductsList(id , name , page ) async {
    return await apiClient.getData("products/seller/$id?page=$page&name=$name");
 }

//  brands Products
 Future<Response> getBrandsProductsList(id , name , page ) async {
    return await apiClient.getData("products/brands/$id?page=$page&name=$name");
 }

// Produc Details
 Future<Response> getProductDetails(int id) async {
    return await apiClient.getData("products/$id");
 }

//   related Products this is a list of products
 Future<Response> getRelatedProductsList(int id ) async {
    return await apiClient.getData("products/related/$id");
 }

//  get top from seller
 Future<Response> getTopSellerProductsList({int id = 0,}) async {
    return await apiClient.getData("products/top-from-seller/$id");
 }

//  filtered products
 Future<Response> getFilteredProductsList(id,name ,
      sort_key ,page ,brands ,categories ,min ,max  ) async {
    return await apiClient.getData("products/filter/$id?page=$page&name=$name");
 }

//  all products
 Future<Response> getAllProductsList(  ) async {
    return await apiClient.getData("products");
 }


//  sliders
 Future<Response> getSlidersList() async {
    return await apiClient.getData("sliders");
 }
}



