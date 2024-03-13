// import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:sokosellers/data/api/api_checker.dart';
import 'package:sokosellers/data/data_model/brand_response.dart';
import 'package:sokosellers/data/data_model/category_response.dart';
import 'package:sokosellers/data/data_model/product_details_response.dart';
import 'package:sokosellers/data/data_model/product_mini_response.dart';
import 'package:sokosellers/data/data_model/slider_response.dart';
import 'package:sokosellers/data/model/banner_model.dart';
import 'package:sokosellers/data/repository/banner_repo.dart';
import 'package:get/get.dart';
import 'package:sokosellers/data/repository/repositories/brand_repository.dart';
import 'dart:convert' as convert;

import 'package:sokosellers/view/sokoScreens/pages/widget/featuringProducts.dart';

class BannerController extends GetxController implements GetxService {
  final BannerRepo bannerRepo;
  BannerController({required this.bannerRepo});

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  var id = '0'.obs;
  var page = '1'.obs;
  var name = ''.obs;
  var CurrentPage = '1'.obs;
  final _currentPage = 1.obs;



final _allSokoProducts = <Product>[].obs;
List<Product> get allSokoProducts => _allSokoProducts.toList();

final _newlyLoadedProducts = <Product>[].obs;
final ScrollController scrollController = ScrollController();

  
  // @override
  // void onInit() {
  //   super.onInit();
  //   // Fetch initial products
  //   fetchProducts();
  // }


  @override
  void onInit() {
    super.onInit();
    fetchAllProducts();

    scrollController.addListener(() {
      if (scrollController.position.pixels ==
          scrollController.position.maxScrollExtent) {
        fetchMoreProducts();
      }
    });
  }


  void fetchAllProducts() async {
    if (!_isLoading) {
      _isLoading = true;
      var response = await GetConnect().get('https://your_api_url/products?page=${_currentPage.value}');
      if (response.statusCode == 200) {
        var productResponse = ProductMiniResponse.fromJson(response.body);
        _newlyLoadedProducts.assignAll(productResponse.products);
        _currentPage.value++;
      } else {
        // Handle error
        print('Failed to load products: ${response.statusText}');
      }
      _isLoading = false;
    }
  }

  Future<void> fetchMoreProducts() async {
    if (_isLoading) {
      return;
    }
    _isLoading = true;
    try {
      final Response response = await bannerRepo.getAllProductsList(_currentPage);
      if (response.statusCode == 200) {
        final ProductMiniResponse productResponse = ProductMiniResponse.fromJson(response.body);
        _newlyLoadedProducts.assignAll(productResponse.products);
        _allSokoProducts.addAll(_newlyLoadedProducts);
        _currentPage.value++;
      } else {
        // Handle error
      }
    } finally {
      _isLoading = false;
    }
  }

  void addNewProductsToAll() {
    _allSokoProducts.addAll(_newlyLoadedProducts);
    _newlyLoadedProducts.clear();
  }

  List<BannerModel>? _bannerList;
  List<BannerModel>? get bannerList => _bannerList;

  // get all Brands List
  List<Brands>? _allBrandStrings;
  List<Brands>? get allBrandStrings => _allBrandStrings;


// get all products
  List<Product>?  _allProducts;

  List<Product>? get allProducts => _allProducts;

  Future getallProductsList(bool reload, {bool isUpdate = true}) async{
    if(_allProducts == null || reload) {
      _isLoading = true;
      _allProducts = null;
      if (isUpdate) {
        update();
      }
    }
    
    if (_allProducts == null) {
      Response response = await bannerRepo.getAllProductsList(CurrentPage);
      if (response.statusCode == 200) {
        // _allProducts = [];
  
        ProductMiniResponse productResponse = ProductMiniResponse.fromJson(response.body);
        List<Product> product = productResponse.products;
        product.forEach((products) {
          _allProducts!.add(products);
        });

update();


      } else {
        _allProducts = [];
        ApiChecker.checkApi(response);
      }
      _isLoading = false;
      update();
    }
    return _allProducts;
  }



  Future getBrandsList(bool reload, {bool isUpdate = true}) async{
          if(reload){
            _isLoading = true;
            _allBrandStrings = null;
            if(isUpdate){
              update();
          }

          if(_allBrandStrings == null){


          var response = await bannerRepo.getBrandsList();
          
          if (response.statusCode == 200) {
              BrandResponse jsonResponse = BrandResponse.fromJson(response.body);
              _allBrandStrings = [];
              List<Brands> itemCount = jsonResponse.brands;

              itemCount.forEach((brand) {
                    _allBrandStrings!.add(brand);
                  });
                  update();

              print('Number ---------------${_allBrandStrings!.length} -----------');
            
            _allBrandStrings!.forEach((brand) {
              var id = brand.id;
              print("--------------------------------$id");
            });
        
          } 
          else {
              print('Request failed with status: ${response.statusCode}.');
          }

      }

      
      }
    }


 // get all top Brands List
  List<Brands>? _allTopBrandStrings;
  List<Brands>? get allTopBrandStrings => _allTopBrandStrings;
  
  Future getTopBrandsList(bool reload, {bool isUpdate = true}) 
  async{
          if(reload){
            _isLoading = true;
            _allTopBrandStrings = null;
            if(isUpdate){
              update();
          }

          if(_allTopBrandStrings == null){


          var response = await bannerRepo.getTopBrandsList();
          
          if (response.statusCode == 200) {
              BrandResponse jsonResponse = BrandResponse.fromJson(response.body);
              _allTopBrandStrings = [];

              List<Brands> itemCount = jsonResponse.brands;
              itemCount.forEach((brand) {
                    _allTopBrandStrings!.add(brand);
              });
              
              update();
              print('Number ---------------${_allTopBrandStrings!.length} -----------');
            
            // _allTopBrandStrings!.forEach((brand) {
            //   var id = brand.id;
            //   print("--------------------------------$id");
            // });
        
          } 
          else {
              print('Request failed with status: ${response.statusCode}.');
          }
        update();
      }

      
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

              // _allCategories
              //  CategoryResponse categoryResponse = CategoryResponse.fromJson(response.body);
              //   List<Category> categories = categoryResponse.categories;
              //   categories.forEach((categories) {
              //     _allCategories!.add(categories);
              //   });

update();
            } else {
              _bannerList = [];
              ApiChecker.checkApi(response);
            }
            _isLoading = false;
            update();
          }
          }

// Categories section

 // get all top Categories List
  List<Category>? _allCategories;
  List<Category>? get allCategories => _allCategories;

  Future getCategoriesList(bool reload, {bool isUpdate = true}) async{
    if(_allCategories == null || reload) {
      _isLoading = true;
      _allCategories = null;
      if (isUpdate) {
        update();
      }
    }
    
    if (_allCategories == null) {
      Response response = await bannerRepo.getCategoryList();
      if (response.statusCode == 200) {
        _allCategories = [];
        // response.body.forEach((category) {
        //   _allCategories!.add(Category.fromJson(category));
        // });
      
      CategoryResponse categoryResponse = CategoryResponse.fromJson(response.body);
        List<Category> categories = categoryResponse.categories;
        categories.forEach((categories) {
          _allCategories!.add(categories);
        });
update();
      } else {
        _allCategories = [];
        ApiChecker.checkApi(response);
      }
      _isLoading = false;
      update();
    }
    return _allCategories;
  }
  
  // get featured categories
  List<Category>? _featuredCategories;
  List<Category>? get featuredCategories => _featuredCategories;

  Future getFeaturedCategoriesList(bool reload, {bool isUpdate = true}) async{
    if(_featuredCategories == null || reload) {
      _isLoading = true;
      _featuredCategories = null;
      if (isUpdate) {
        update();
      }
    }
    
    if (_featuredCategories == null) {
      Response response = await bannerRepo.getFeatureCategoryList();
      if (response.statusCode == 200) {
        _featuredCategories = [];
     
        CategoryResponse categoryResponse = CategoryResponse.fromJson(response.body);
        List<Category> categories = categoryResponse.categories;
        categories.forEach((categories) {
          _featuredCategories!.add(categories);
        });


//  SliderResponse sliders = SliderResponse.fromJson(response.body);
//        List<Slider> sliderItems = sliders.sliders;

        // sliderItems.forEach((slideritems) {
        //   _slider!.add(slideritems);
        // });



update();
      } else {
        _featuredCategories = [];
        ApiChecker.checkApi(response);
      }
      _isLoading = false;
      update();
    }
    return _featuredCategories;
  }

// Products Section

// featured products
  List<Product>? _featuredProducts;
  List<Product>? get featuredProducts => _featuredProducts;

  Future getFeaturedProductsList(bool reload, {bool isUpdate = true}) async{
    if(_featuredProducts == null || reload) {
      _isLoading = true;
      _featuredProducts = null;
      if (isUpdate) {
        update();
      }
    }
    
    if (_featuredProducts == null) {
      Response response = await bannerRepo.getFeatureProductsList();
      if (response.statusCode == 200) {
        _featuredProducts = [];
        
       
         
        ProductMiniResponse productResponse = ProductMiniResponse.fromJson(response.body);
        List<Product> product = productResponse.products;
        product.forEach((products) {
          _featuredProducts!.add(products);
        });

update();


      } else {
        _featuredProducts = [];
        ApiChecker.checkApi(response);
      }
      _isLoading = false;
      update();
    }
    return _featuredProducts;
  }
// best selling
  List<Product>? _bestSellingProducts;
  List<Product>? get bestSellingProducts => _bestSellingProducts;

  Future getBestSellingProductsList(bool reload, {bool isUpdate = true}) async{
    if(_bestSellingProducts == null || reload) {
      _isLoading = true;
      _bestSellingProducts = null;
      if (isUpdate) {
        update();
      }
    }
    
    if (_bestSellingProducts == null) {
      Response response = await bannerRepo.getBestSellingProductsList();
      if (response.statusCode == 200) {
        _bestSellingProducts = [];
        
       

   
        ProductMiniResponse productResponse = ProductMiniResponse.fromJson(response.body);
        List<Product> product = productResponse.products;
        product.forEach((products) {
          _bestSellingProducts!.add(products);
        }); update();



      } else {
        _bestSellingProducts = [];
        ApiChecker.checkApi(response);
      }
      _isLoading = false;
      update();
    }
    return _bestSellingProducts;
  }

// category products
  List<Product>? _categoryProducts;
  List<Product>? get categoryProducts => _categoryProducts;

  Future getCategoryProductsList(bool reload, {bool isUpdate = true}) async{
    if(_categoryProducts == null || reload) {
      _isLoading = true;
      _categoryProducts = null;
      if (isUpdate) {
        update();
      }
    }
    
    if (_categoryProducts == null) {
      Response response = await bannerRepo.getCategoryProductsList(id,page ,name );
      if (response.statusCode == 200) {
        _categoryProducts = [];
        
        ProductMiniResponse productResponse = ProductMiniResponse.fromJson(response.body);
        List<Product> product = productResponse.products;
        product.forEach((products) {
          _categoryProducts!.add(products);
        }); update();
        
      } else {
        _categoryProducts = [];
        ApiChecker.checkApi(response);
      }
      _isLoading = false;
      update();
    }
    return _categoryProducts;
  }


// get shop products
  List<Product>? _shopProducts;
  List<Product>? get shopProducts => _shopProducts;

  Future getShopProductsList(bool reload, {bool isUpdate = true}) async{
    if(_shopProducts == null || reload) {
      _isLoading = true;
      _shopProducts = null;
      if (isUpdate) {
        update();
      }
    }
    
    if (_shopProducts == null) {
      Response response = await bannerRepo.getShopProductsList(id , name , page);
      if (response.statusCode == 200) {
        _shopProducts = [];
        // response.body.forEach((product) {
        //   _shopProducts!.add(Product.fromJson(product));
        // });

      ProductMiniResponse productResponse = ProductMiniResponse.fromJson(response.body);
        List<Product> product = productResponse.products;
        product.forEach((products) {
          _shopProducts!.add(products);
        });

        update();
      } else {
        _shopProducts = [];
        ApiChecker.checkApi(response);
      }
      _isLoading = false;
      update();
    }
    return _shopProducts;
  }


// brands products
  List<Product>? _brandsProducts;
  List<Product>? get brandsProducts => _brandsProducts;

  Future getBrandsProductsList(bool reload, {bool isUpdate = true}) async{
    if(_brandsProducts == null || reload) {
      _isLoading = true;
      _brandsProducts = null;
      if (isUpdate) {
        update();
      }
    }
    
    if (_brandsProducts == null) {
      Response response = await bannerRepo.getBrandsProductsList(id, name, page);
      if (response.statusCode == 200) {
        _brandsProducts = [];
        // response.body.forEach((product) {
        //   _brandsProducts!.add(Product.fromJson(product));
        // });

      ProductMiniResponse productResponse = ProductMiniResponse.fromJson(response.body);
        List<Product> product = productResponse.products;
        product.forEach((products) {
          _brandsProducts!.add(products);
        });

update();
      } else {
        _brandsProducts = [];
        ApiChecker.checkApi(response);
      }
      _isLoading = false;
      update();
    }
    return _brandsProducts;
  }

// Product Details
  List<DetailedProduct>? _productDetails;
  List<DetailedProduct>? get productDetails => _productDetails;

  Future getProductDetailsList(bool reload,int productId, {bool isUpdate = true}) async{
    if(_productDetails == null || reload) {
      _isLoading = true;
      _productDetails = null;
      if (isUpdate) {
        update();
      }
    }
    
    if (_productDetails == null) {
      Response response = await bannerRepo.getProductDetails(productId);
      if (response.statusCode == 200) {
        _productDetails = [];
        // response.body.forEach((product) {
        //   _productDetails!.add(DetailedProduct.fromJson(product));
        // });

// ProductDetailsResponse
        ProductDetailsResponse productResponse = ProductDetailsResponse.fromJson(response.body);
        List<DetailedProduct> product = productResponse.detailed_products;
        product.forEach((products) {
          _productDetails!.add(products);
        });


update();

      } else {
        _productDetails = [];
        ApiChecker.checkApi(response);
      }
      _isLoading = false;
      update();
    }
    return _productDetails;
  }



// related products
  List<Product>? _relatedProducts;
  List<Product>? get relatedProducts => _relatedProducts;

  Future getRelatedProductsList(bool reload,int productId, {bool isUpdate = true}) async{
    if(_relatedProducts == null || reload) {
      _isLoading = true;
      _relatedProducts = null;
      if (isUpdate) {
        update();
      }
    }
    
    if (_relatedProducts == null) {
      Response response = await bannerRepo.getRelatedProductsList(productId);
      if (response.statusCode == 200) {
        _relatedProducts = [];
        // response.body.forEach((product) {
        //   _relatedProducts!.add(Product.fromJson(product));
        // });



        ProductMiniResponse productResponse = ProductMiniResponse.fromJson(response.body);
        List<Product> product = productResponse.products;
        product.forEach((products) {
          _relatedProducts!.add(products);
        });

update();
      } else {
        _relatedProducts = [];
        ApiChecker.checkApi(response);
      }
      _isLoading = false;
      update();
    }
    return _relatedProducts;
  }





// top from sellers
  List<Product>? _topFromSellers;
  List<Product>? get topFromSellers => _topFromSellers;
  Future getTopFromSellersList(bool reload, {bool isUpdate = true}) async{
    if(_topFromSellers == null || reload) {
      _isLoading = true;
      _topFromSellers = null;
      if (isUpdate) {
        update();
      }
    }
    
    if (_topFromSellers == null) {
      Response response = await bannerRepo.getTopSellerProductsList();
      if (response.statusCode == 200) {
        _topFromSellers = [];
        // response.body.forEach((product) {
        //   _topFromSellers!.add(Product.fromJson(product));
        // });

        ProductMiniResponse productResponse = ProductMiniResponse.fromJson(response.body);
        List<Product> product = productResponse.products;
        product.forEach((products) {
          _topFromSellers!.add(products);
        });
        update();
      } else {
        _topFromSellers = [];
        ApiChecker.checkApi(response);
      }
      _isLoading = false;
      update();
    }
    return _topFromSellers;
  }


// get all products


// slider section
  List<Slider>? _slider;
  List<Slider>? get slider => _slider;

  Future getSliderList(bool reload, {bool isUpdate = true}) async{
    if(_slider == null || reload) {
      _isLoading = true;
      _slider = null;
      if (isUpdate) {
        update();
      }
    }
    
    if (_slider == null) {
      Response response = await bannerRepo.getSlidersList();
      if (response.statusCode == 200) {
        _slider = [];

       SliderResponse sliders = SliderResponse.fromJson(response.body);
       List<Slider> sliderItems = sliders.sliders;

        sliderItems.forEach((slideritems) {
          _slider!.add(slideritems);
        });
        update();
      } else {
        _slider = [];
        ApiChecker.checkApi(response);
      }
      _isLoading = false;
      update();
    }
    // update();
    return _slider;
  }



Future? resetEverything(){
  _allCategories = [];
  _featuredCategories = [];
  _bestSellingProducts = [];
  _categoryProducts = [];
  _shopProducts = [];
  _brandsProducts = [];
  _productDetails = [];
  _relatedProducts = [];
  _topFromSellers = [];
  _isLoading = false;

  _slider!.clear();
  update();
  return null;
}



}