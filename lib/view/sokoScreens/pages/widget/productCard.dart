// import 'package:active_ecommerce_flutter/custom/box_decorations.dart';
// import 'package:active_ecommerce_flutter/my_theme.dart';
import 'package:flutter/material.dart';
import 'package:sokosellers/util/box_decorations.dart';
import 'package:sokosellers/util/my_theme.dart';


class ProductCard extends StatelessWidget {

  int? id;
  String? image;
  String? name;
  String? main_price;
  String? stroked_price;
  // bool? has_discount;
//  String?  discount;

  ProductCard(
    {Key? key, id, image, name, main_price, stroked_price, }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print((MediaQuery.of(context).size.width - 48 ) / 2);
    return InkWell(
      onTap: () {
        // Navigator.push(context, MaterialPageRoute(builder: (context) {
          // return ProductDetails(id: id,);
        // }));
      },
      child: Container(
        decoration: BoxDecorations.buildBoxDecoration_1().copyWith(

        ),
        child: Stack(
          children: [
            Column(
                children: <Widget>[
                  AspectRatio(
                    aspectRatio: 1,
                    child: Container(
                        width: double.infinity,
                        //height: 158,
                        child: ClipRRect(
                          clipBehavior: Clip.hardEdge,
                            borderRadius: BorderRadius.vertical(
                                top: Radius.circular(6), bottom: Radius.zero),
                            child: FadeInImage.assetNetwork(
                              placeholder: 'assets/placeholder.png',
                              image:  image!,
                              fit: BoxFit.cover,
                            ))),
                  ),
                  Container(
                    width: double.infinity,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.fromLTRB(16, 8, 16, 0),
                          child: Text(
                            name!,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                            style: TextStyle(
                                color: MyTheme.font_grey,
                                fontSize: 14,
                                height: 1.2,
                                fontWeight: FontWeight.w400),
                          ),
                        ),
                        // has_discount! ? Padding(
                        //   padding: EdgeInsets.fromLTRB(16, 8, 16, 0),
                        //   child: Text(
                        //     stroked_price!,
                        //     textAlign: TextAlign.left,
                        //     overflow: TextOverflow.ellipsis,
                        //     maxLines: 1,
                        //     style: TextStyle(
                        //         decoration:TextDecoration.lineThrough,
                        //         color: MyTheme.medium_grey,
                        //         fontSize: 12,
                        //         fontWeight: FontWeight.w400),
                        //   ),
                        // ):Container(height: 8.0,),
                        Padding(
                          padding: EdgeInsets.fromLTRB(16, 0, 16, 16),
                          child: Text(
                            main_price!,
                            textAlign: TextAlign.left,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                            style: TextStyle(
                                color: MyTheme.accent_color,
                                fontSize: 16,
                                fontWeight: FontWeight.w700),
                          ),
                        ),
                      ],
                    ),
                  ),
                ]),

            ],
        ),
      ),
    );
  }
}
