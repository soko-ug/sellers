import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../lib22/helper/price_converter.dart';
import '../../../../../lib22/util/color_resources.dart';
import '../../../../../lib22/util/dimensions.dart';
import '../../../../../lib22/util/images.dart';
import '../../../../../lib22/util/styles.dart';

class ShowAmountView extends StatelessWidget {
  const ShowAmountView({ Key? key, required this.amountText, this.onTap, this.title }) : super(key: key);
  final String amountText;
  final String? title;
  final Function? onTap;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: Dimensions.paddingSizeLarge),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: Dimensions.paddingSizeDefault),
            child: Text(title != null ? title! : 'amount'.tr, style: rubikMedium.copyWith(
              fontSize: Dimensions.fontSizeLarge,
              color: ColorResources.getGreyBaseGray1(),
            )),
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(PriceConverter.balanceWithSymbol(balance: amountText), style: rubikMedium.copyWith(fontSize: Dimensions.fontSizeLarge)),
              if(onTap != null) InkWell(
                onTap: onTap as void Function()?,
                child: Image.asset(Images.editIcon, height: Dimensions.radiusSizeExtraLarge,width: Dimensions.radiusSizeExtraLarge)
              )
            ]
          )
        ],
      ),
    );
  }
}