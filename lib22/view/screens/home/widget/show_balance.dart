import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../lib22/controller/profile_screen_controller.dart';
import '../../../../../lib22/helper/price_converter.dart';
import '../../../../../lib22/util/dimensions.dart';
import '../../../../../lib22/util/styles.dart';

class ShowBalance extends StatelessWidget {
  final ProfileController? profileController;
  const ShowBalance({Key? key, this.profileController}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, mainAxisSize: MainAxisSize.min,
      children: [
        profileController!.userInfo != null
        ?Text(PriceConverter.balanceWithSymbol(balance: profileController!.userInfo!.balance.toString()),
            style: rubikMedium.copyWith(color: Colors.white, fontSize: Dimensions.fontSizeExtraLarge,))
        :Text(PriceConverter.balanceWithSymbol(balance: '0.0'),
            style: rubikMedium.copyWith(color: Colors.white, fontSize: Dimensions.fontSizeExtraLarge,)
          ),
        const SizedBox(
          height: Dimensions.paddingSizeExtraSmall,
        ),
        Text('available_balance'.tr,
            style: rubikLight.copyWith(fontSize: Dimensions.fontSizeDefault, color: Colors.white)),

        const SizedBox(height: Dimensions.paddingSizeExtraSmall,),

        profileController!.userInfo != null?
        Text('(${'sent'.tr} ${PriceConverter.balanceWithSymbol(balance: profileController!.userInfo!.pendingBalance.toString())} ${'withdraw_req'.tr})',
            style: rubikMedium.copyWith(color: Colors.white, fontSize: Dimensions.fontSizeSmall,)):const SizedBox(),

      ],
    );
  }
}
