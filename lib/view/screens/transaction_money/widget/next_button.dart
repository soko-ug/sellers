import 'package:sokosellers/util/color_resources.dart';
import 'package:sokosellers/util/dimensions.dart';
import 'package:flutter/material.dart';
import 'package:sokosellers/view/base/custom_ink_well.dart';

class NextButton extends StatelessWidget {
  final VoidCallback? onTap;
  final bool isSubmittable;
  const NextButton({Key? key, required this.isSubmittable, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomInkWell(
      onTap: onTap,
      radius:  Dimensions.radiusProfileAvatar,
      child: CircleAvatar(
        maxRadius: Dimensions.radiusProfileAvatar,
        backgroundColor:isSubmittable ?  Theme.of(context).secondaryHeaderColor: ColorResources.getGreyBaseGray6(),
        child: Icon(Icons.arrow_forward, color: ColorResources.blackColor)),
    );
  }
}