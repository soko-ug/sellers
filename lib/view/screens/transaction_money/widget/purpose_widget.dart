import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:sokosellers/controller/localization_controller.dart';
import 'package:sokosellers/controller/transaction_controller.dart';
import 'package:sokosellers/helper/hexa_color.dart';
import 'package:sokosellers/util/dimensions.dart';
import 'package:sokosellers/util/images.dart';
import 'package:sokosellers/util/styles.dart';
import 'package:sokosellers/view/base/custom_loader.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:sokosellers/view/screens/transaction_money/widget/purpose_item.dart';

class PurposeWidget extends StatelessWidget {
  const PurposeWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final localizationController = Get.find<LocalizationController>();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: Dimensions.paddingSizeLarge,vertical: Dimensions.paddingSizeSmall),
          child: Text('select_your_purpose'.tr,style: rubikRegular.copyWith(fontSize: Dimensions.fontSizeLarge),),
        ),
    GetBuilder<TransactionMoneyController>(
      builder: (controller) {
        return controller.purposeList == null ? CustomLoader(color: Theme.of(context).primaryColor) : Container(
          height: 150,padding: localizationController.isLtr ?  const EdgeInsets.only(left: Dimensions.paddingSizeDefault) : const EdgeInsets.only(right: Dimensions.paddingSizeDefault),
          child: ListView.builder(
            physics: const BouncingScrollPhysics(),
            itemCount: controller.purposeList!.length,scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return Stack(
                children: [
                  PurposeItem(
                    onTap: ()=> controller.itemSelect(index: index),
                    image: controller.purposeList![index].logo,
                    title: controller.purposeList![index].title,
                    color: HexColor(controller.purposeList![index].color!),
                  ),

                  Visibility(
                    visible: controller.selectedItem == index ? true : false,
                    child: Positioned(
                      top: Dimensions.paddingSizeDefault,
                      right: Dimensions.paddingSizeDefault,
                      child: Image.asset(Images.onSelect, height: 12,width: 12),
                    ),
                  ),
                ],
              );},
          ),
        );
      }
    )



      ],
    );
  }
}