import 'package:sokosellers/util/app_config.dart';
import 'package:http/http.dart' as http;
import 'package:sokosellers/data/data_model/wishlist_check_response.dart';
import 'package:sokosellers/data/data_model/wishlist_delete_response.dart';
import 'package:sokosellers/data/data_model/wishlist_response.dart';
import 'package:flutter/foundation.dart';

class WishListRepository {
  Future<WishlistResponse> getUserWishlist() async {
    Uri url = Uri.parse("${AppConfig.BASE_URL}/wishlists");
    final response = await http.get(
      url,
      headers: {
        "Authorization": "Bearer ${AppConfig.bToken}",
        "App-Language": AppConfig.mobile_app_code,
      },
    );
    return wishlistResponseFromJson(response.body);
  }

  Future<WishlistDeleteResponse> delete({
    @required int wishlist_id = 0,
  }) async {
    Uri url = Uri.parse("${AppConfig.BASE_URL}/wishlists/${wishlist_id}");
    final response = await http.delete(
      url,
      headers: {
        "Authorization": "Bearer ${AppConfig.bToken}",
        "App-Language": AppConfig.mobile_app_code,
      },
    );
    return wishlistDeleteResponseFromJson(response.body);
  }

  Future<WishListChekResponse> isProductInUserWishList(
      {@required product_id = 0}) async {
    Uri url = Uri.parse(
        "${AppConfig.BASE_URL}/wishlists-check-product?product_id=${product_id}");
    final response = await http.get(
      url,
      headers: {
        "Authorization": "Bearer ${AppConfig.bToken}",
        "App-Language": AppConfig.mobile_app_code,
      },
    );
    return wishListChekResponseFromJson(response.body);
  }

  Future<WishListChekResponse> add({@required product_id = 0}) async {
    Uri url = Uri.parse(
        "${AppConfig.BASE_URL}/wishlists-add-product?product_id=${product_id}");

    print(url.toString());
    final response = await http.get(
      url,
      headers: {
        "Authorization": "Bearer ${AppConfig.bToken}",
        "App-Language": AppConfig.mobile_app_code,
      },
    );

    return wishListChekResponseFromJson(response.body);
  }

  Future<WishListChekResponse> remove({@required product_id = 0}) async {
    Uri url = Uri.parse(
        "${AppConfig.BASE_URL}/wishlists-remove-product?product_id=${product_id}");
    final response = await http.get(
      url,
      headers: {
        "Authorization": "Bearer ${AppConfig.bToken}",
        "App-Language": AppConfig.mobile_app_code,
      },
    );
    return wishListChekResponseFromJson(response.body);
  }
}
