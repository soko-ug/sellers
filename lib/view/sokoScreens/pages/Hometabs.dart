import 'dart:math';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sokosellers/controller/banner_controller.dart';
import 'package:sokosellers/data/data_model/brand_response.dart';
import 'package:sokosellers/data/data_model/category_response.dart';
// import 'package:sokosellers/data/data_model/flash_deal_response.dart';
import 'package:sokosellers/view/sokoScreens/pages/filter.dart';
import 'package:sokosellers/data/data_model/product_mini_response.dart';
import 'package:masonry_list_view_grid/masonry_list_view_grid.dart';
import 'package:sokosellers/view/sokoScreens/pages/widget/productCard.dart';

class HomeTab extends StatelessWidget {
  const HomeTab({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar:buildAppBar2(), //buildAppBar(60, context) ,
        body: Container(
          child: HomeWidgets(),
        ),
      ),
    );
  }


   
Widget  buildHomeCarouselSlider(context) {
    
    if ( Get.find<BannerController>().slider == null) {
      return Padding(
          padding:
              const EdgeInsets.only(left: 18, right: 18, top: 0, bottom: 20),
          child: Container(
          height: Get.height /4,
          color: Colors.grey[300],
          margin: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        ));
         //ShimmerHelper().buildBasicShimmer(height: 120));



        


    } 
    else if (Get.find<BannerController>().slider != null) 
    {
      return CarouselSlider(
        options: CarouselOptions(
            aspectRatio: 338 / 140,
            viewportFraction: 1,
            initialPage: 0,
            enableInfiniteScroll: true,
            reverse: false,
            autoPlay: true,
            autoPlayInterval: Duration(seconds: 5),
            autoPlayAnimationDuration: Duration(milliseconds: 1000),
            autoPlayCurve: Curves.easeInExpo,
            enlargeCenterPage: false,
            scrollDirection: Axis.horizontal,
            onPageChanged: (index, reason) {
              
            }),
        items: Get.find<BannerController>().slider!.map((i) {
          return Builder(
            builder: (BuildContext context) {
              return Padding(
                padding: const EdgeInsets.only(
                    left: 18, right: 18, top: 0, bottom: 20),
                child: Stack(
                  children: <Widget>[
                    Container(
                      //color: Colors.amber,
                        width: double.infinity,
                        // decoration: BoxDecorations.buildBoxDecoration_1(),
                        child: ClipRRect(
                            borderRadius: BorderRadius.all(Radius.circular(6)),
                            child: FadeInImage.assetNetwork(
                              placeholder: 'assets/placeholder_rectangle.png',
                              image: "i",
                              height: 140,
                              fit: BoxFit.cover,
                            ))),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Row(
                        // mainAxisAlignment: MainAxisAlignment.center,
                        // children: _carouselImageList.map((url) {
                        //   int index = _carouselImageList.indexOf(url);
                        //   return Container(
                        //     width: 7.0,
                        //     height: 7.0,
                        //     margin: EdgeInsets.symmetric(
                        //         vertical: 10.0, horizontal: 4.0),
                        //     decoration: BoxDecoration(
                        //       shape: BoxShape.circle,
                        //       color: _current_slider == index
                        //           ? MyTheme.white
                        //           : Color.fromRGBO(112, 112, 112, .3),
                        //     ),
                        //   );
                        // }).toList(),
                      ),
                    ),
                  ],
                ),
              );
            },
          );
        }).toList(),
      );
    }
    else {
      return Container();
    } 
    
  }

// buildAppBar(statusBarHeight, context),
  
  AppBar buildAppBar(double statusBarHeight, BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      // Don't show the leading button
      backgroundColor: Colors.white,
      centerTitle: false,
      elevation: 0,
      flexibleSpace: Padding(
          // padding:
          //     const EdgeInsets.only(top: 40.0, bottom: 22, left: 18, right: 18),
          padding:
          const EdgeInsets.only(top: 20.0, bottom: 22, left: 18, right: 18),
          child: GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return Filter();
                }));
              },
              child: buildHomeSearchBox(context))),
    );
  }

AppBar buildAppBar2() {
    return AppBar(
            title: Text(
        'SOKO',
        style: GoogleFonts.montserrat(
          textStyle: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20, // You can adjust the font size as needed
          ),
        ),
      ),
            automaticallyImplyLeading: false,
            actions: <Widget>[
              IconButton(
                icon: Icon(Icons.search),
                onPressed: () {
                  // Add your search action here
                },
              ),
              IconButton(
                icon: Icon(Icons.notifications),
                onPressed: () {
                  // Add your notifications action here
                },
              ),
            ],
          );
  }
  
buildHomeSearchBox(BuildContext context) {}



}


class HomeWidgets extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSliders(),
           
            _buildSectionTitle('Brands'),
            _getBrands(),
             // Placeholder for brands

             // Placeholder for featuring products
            _buildSectionTitle('Featuring Products'),
            _getFeaturedProducts(), 
            
            
            _buildSectionTitle('New Products'),
            _getBestSellingProducts(), // Placeholder for new products
           
           
            _buildSectionTitle('Category-wise Products'),
            _getCategories(), // Placeholder for category-wise products

            _buildSectionTitle('More Products'),
            _getAllProducts(),
 
          ],
        ),
      ),
    );
  }

   Widget _buildSliders() {
    return GetBuilder<BannerController>(builder: (slidersController) {
        
       return  slidersController.slider != null ? Container(
          height: Get.height /4,
          color: Colors.grey[300],
          margin: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),

          child:  Container(
          child: CarouselSlider(
          options: CarouselOptions(),
          items: slidersController.slider!.map((item) => Container(
                  child: Center(
                      child:
                          Image.network(item.photo, fit: BoxFit.cover, width: Get.width)),
                ))
            .toList(),
      )),
    ) :  _buildPlaceholder(height: 200.0);

      });
  }

// brands
Widget _getBrands(){
  return GetBuilder<BannerController>(builder: (Controller) {
        
       return  Controller.allBrandStrings != null ? Container(
          // height: Get.height /4,
          color: Colors.grey[100],
          margin: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),

      child:  Container(
          height: 150, // Adjust height as needed
          child: Container(
          height: 150, // Adjust height as needed
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: List.generate(Controller.allBrandStrings!.length, (index) {
              Brands brand = Controller.allBrandStrings![index];
                return Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      CircleAvatar(
                        backgroundImage: NetworkImage(brand.logo),
                        radius: 30,
                      ),
                      SizedBox(height: 8),
                      Text(
                        brand.name,
                        style: TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                );
              }),
            ),
          ),
        )
        ))
        : _buildPlaceholder(height: 100.0);
    });
    }


// brands
Widget _getCategories(){
  return GetBuilder<BannerController>(builder: (Controller) {
        
       return  Controller.featuredCategories != null ? Container(
          // height: Get.height /4,
          color: Colors.grey[100],
          margin: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),

      child:  Container(
          height: 150, // Adjust height as needed
          child: Container(
          height: 150, // Adjust height as needed
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: List.generate(Controller.featuredCategories!.length, (index) {
              Category brand = Controller.featuredCategories![index];
                return Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      CircleAvatar(
                        backgroundImage: NetworkImage(brand.icon),
                        radius: 30,
                      ),
                      SizedBox(height: 8),
                      Text(
                        brand.name,
                        style: TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                );
              }),
            ),
          ),
        )
        ))
        : _buildPlaceholder(height: 100.0);
    });
    }


    // Featured Products
Widget _getFeaturedProducts(){
  return GetBuilder<BannerController>(builder: (Controller) {
        
       return  Controller.featuredProducts != null ? Container(
          // height: Get.height /4,
          color: Colors.grey[300],
          margin: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),

      child:  Container(
          height: 350, // Adjust height as needed
          child: Container(
          height: 350, // Adjust height as needed
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: List.generate(Controller.featuredProducts!.length, (index) {
              Product brand = Controller.featuredProducts![index];
                return Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      
                      Container(
                        height: 300,
                        width:300 ,
                        child: Image(image: NetworkImage(brand.thumbnail_image))),
                      SizedBox(height: 8),
                      Text(
                        brand.name,
                        style: TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                );
              }),
            ),
          ),
        )
        ))
        : _buildPlaceholder(height: 100.0);
    });
    }


   // Best Products
Widget _getBestSellingProducts(){
  return GetBuilder<BannerController>(builder: (Controller) {
        
       return  Controller.bestSellingProducts != null ? Container(
          // height: Get.height /4,
          color: Colors.grey[300],
          margin: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),

      child:  Container(
          height: 350, // Adjust height as needed
          child: Container(
          height: 350, // Adjust height as needed
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: List.generate(Controller.bestSellingProducts!.length, (index) {
              Product brand = Controller.bestSellingProducts![index];
                return Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      
                      Container(
                        height: 300,
                        width:300 ,
                        child: Image(image: NetworkImage(brand.thumbnail_image))),
                      SizedBox(height: 8),
                      Text(
                        brand.name,
                        style: TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                );
              }),
            ),
          ),
        )
        ))
        : _buildPlaceholder(height: 100.0);
    });
    }


  // Widget buildHomeAllProducts2(context) {
  //   if (_isAllProductInitial && _allProductList.length == 0) {
  //     return SingleChildScrollView(
  //         child: ShimmerHelper().buildProductGridShimmer(
  //             scontroller: _allProductScrollController));
  //   } else if (_allProductList.length > 0) {
  //     return MasonryGridView.count(
  //         crossAxisCount: 2,
  //         mainAxisSpacing: 14,
  //         crossAxisSpacing: 14,
  //         itemCount: controller.bestSellingProducts!.length,
  //         shrinkWrap: true,
  //         padding: EdgeInsets.only(top: 20.0, bottom: 10, left: 18, right: 18),
  //         physics: NeverScrollableScrollPhysics(),
  //         itemBuilder: (context, index) {
  //           return ProductCard(
  //               id: product.id,
  //               image: product.thumbnail_image,
  //               name: product.name,
  //               main_price: product.main_price,
  //               stroked_price: product.stroked_price,
  //               has_discount: product.has_discount,
  //             discount: product.discount,
  //           );
  //         }
  //         );
  //   } else if (_totalAllProductData == 0) {
  //     return Center(
  //         child: Text(
  //             AppLocalizations.of(context).common_no_product_is_available));
  //   } else {
  //     return Container(); // should never be happening
  //   }
  // }



// _getAllProducts
    Widget _getAllProducts() {
  return GetBuilder<BannerController>(builder: (controller) {
     List<Product>? product = controller.allProducts;

    return controller.allProducts != null
        ? Container(
            margin: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: MasonryListViewGrid(
    column: 2,
    padding: const EdgeInsets.all(8.0),
    children: List.generate(
        100,
        (index) => Container(
            decoration: BoxDecoration(
                color: Color((Random().nextDouble() * 0xFFFFFF).toInt())
                    .withOpacity(0.5),
            ),
            height: (150 + (index % 3 == 0 ? 50 : 0)).toDouble(),
            child: Center(
                    child: Text('Child ${index + 1}'),
            ),
        ),
    ),
),
            
            // MasonryGridView.count(
            //           crossAxisCount: 2,
            //           mainAxisSpacing: 14,
            //           crossAxisSpacing: 14,
            //           itemCount: controller.allProducts!.length,
            //           shrinkWrap: true,
            //           padding: EdgeInsets.only(top: 20.0, bottom: 10, left: 18, right: 18),
            //           physics: NeverScrollableScrollPhysics(),
                      
            //           itemBuilder: (context, index) {
            //             // Product product = controller.allProducts![index];
            //             return ProductCard(
            //   id: product![index].id,
            //   image: product[index].thumbnail_image,
            //   name: product[index].name,
            //   main_price: product[index].main_price,
            //   stroked_price: product[index].stroked_price,
            // //   has_discount: product.has_discount,
            // // discount: product.discount,
            //             );
            //           }
            //           ),
          )
        : _buildPlaceholder(height: 100.0);
  });
}

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 20.0,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _buildPlaceholder({double? height}) {
    return Container(
      height: height,
      color: Colors.grey[300],
      margin: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
    );
  }
}