import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:http/http.dart' as http;
import 'package:sokosellers/controller/banner_controller.dart';
import 'dart:convert';

import 'package:sokosellers/data/data_model/product_mini_response.dart';

// class Product {
//   final int id;
//   final String name;
//   final String thumbnailImage;

//   Product({required this.id, required this.name, required this.thumbnailImage});

//   factory Product.fromJson(Map<String, dynamic> json) {
//     return Product(
//       id: json['id'],
//       name: json['name'],
//       thumbnailImage: json['thumbnail_image'],
//     );
//   }
// }

class ProductGridScreen extends StatefulWidget {
  @override
  _ProductGridScreenState createState() => _ProductGridScreenState();
}

class _ProductGridScreenState extends State<ProductGridScreen> {
  List<Product> _allProducts = [];

  // @override
  // void initState() {
  //   super.initState();
  //   // fe
  //   // tchProducts();
  // }
  ScrollController _scrollController = ScrollController();

  @override
    void initState() {
      super.initState();
      _scrollController.addListener(() {
        if (_scrollController.position.pixels ==
            _scrollController.position.maxScrollExtent) {
          // Fetch more data when reaching the bottom
          _fetchMoreData();
        }
      });
    }

    Future<void> _fetchMoreData() async {
  // Fetch the next page of products
  // Update the _allProducts list with the newly fetched data
  // Update the UI by calling setState or using a state management solution
}



  Future<void> fetchProducts() async {
    final response = await http.get(Uri.parse('https://soko.ug/api/v2/products'));

    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      final List<dynamic> data = jsonData['data'];

      setState(() {
        _allProducts = data.map((item) => Product.fromJson(item)).toList();
      });
    } else {
      throw Exception('Failed to load products');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Product Grid'),
      ),
      body:_getAllProducts()
    );
  }
  
  @override
    void dispose() {
      _scrollController.dispose();
      super.dispose();
    }



 Widget _getAllProducts() {

  return GetBuilder<BannerController>(builder: (Controller) {
        
       return  Controller.allProducts != null ? Container(
          // height: Get.height /4,
          color: Colors.grey[300],
          margin: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),

          child: MasonryGridView.count(
          crossAxisCount: 2,
          mainAxisSpacing: 14,
          crossAxisSpacing: 14,
          itemCount: Controller.allProducts!.length,
          shrinkWrap: true,
          padding: EdgeInsets.only(top: 20.0, bottom: 10, left: 18, right: 18),
          physics: NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
             Product brand = Controller.allProducts![index];
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
            // return ProductCard(
            //     id: _allProductList[index].id,
            //     image: _allProductList[index].thumbnail_image,
            //     name: _allProductList[index].name,
            //     main_price: _allProductList[index].main_price,
            //     stroked_price: _allProductList[index].stroked_price,
            //     has_discount: _allProductList[index].has_discount,
            //   discount: _allProductList[index].discount,
            // );
          }
          
          )
          
          
          
        //    Container(
        //   height: 450, // Adjust height as needed
        //   child: Container(
        //   height: 350, // Adjust height as needed
        //   child: Column(
        //     children: List.generate(Controller.allProducts!.length, (index) {
        //     Product brand = Controller.allProducts![index];
        //       return Padding(
        //         padding: EdgeInsets.all(8.0),
        //         child: Column(
        //           crossAxisAlignment: CrossAxisAlignment.center,
        //           children: <Widget>[
                    
        //             Container(
        //               height: 300,
        //               width:300 ,
        //               child: Image(image: NetworkImage(brand.thumbnail_image))),
        //             SizedBox(height: 8),
        //             Text(
        //               brand.name,
        //               style: TextStyle(fontSize: 16),
        //             ),
        //           ],
        //         ),
        //       );
        //     }),
        //   ),
        // )
        // )
        )
        : Container(height: 100.0);
  });
 

  
}
}