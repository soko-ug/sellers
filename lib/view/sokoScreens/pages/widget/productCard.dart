import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:http/http.dart' as http;
import 'package:sokosellers/controller/banner_controller.dart';
import 'dart:convert';

import 'package:sokosellers/data/data_model/product_mini_response.dart';

class ProductGridScreen extends StatelessWidget {
   ProductGridScreen({super.key});
  
  final BannerController controller = Get.put(BannerController(bannerRepo: Get.find()));


   @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:_getAllProducts()
    );
  }

   Widget _getAllProducts() {

  return GetBuilder<BannerController>(builder: (Controller) {
        
       return  Controller.allSokoProducts != null ? 
       Container(
          // height: Get.height /4,
          color: Colors.grey[300],
          margin: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),

          child: MasonryGridView.count(
          crossAxisCount: 2,
          mainAxisSpacing: 14,
          crossAxisSpacing: 14,
          itemCount: Controller.allSokoProducts!.length,
          shrinkWrap: true,
          padding: EdgeInsets.only(top: 20.0, bottom: 10, left: 18, right: 18),
          physics: NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
             Product brand = Controller.allSokoProducts![index];
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
           
          }
          
          ) )
        : Container(height: 400.0);
  });
 

  
}
  
}