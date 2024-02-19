
import 'package:flutter/material.dart';
import '../../../lib22/util/images.dart';

class CustomLogo extends StatelessWidget {
  final double? height,width;
  const CustomLogo({Key? key, 
    this.height,this.width
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: Image.asset(Images.logo),

    );
  }
}
