import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:sokosellers/controller/localization_controller.dart';
import 'package:sokosellers/controller/profile_screen_controller.dart';
import 'package:sokosellers/controller/splash_controller.dart';
import 'package:sokosellers/controller/transaction_controller.dart';
import 'package:sokosellers/data/model/purpose_models.dart';
import 'package:sokosellers/helper/currency_text_input_formatter.dart';
import 'package:sokosellers/helper/price_converter.dart';
import 'package:sokosellers/helper/transaction_type.dart';
import 'package:sokosellers/util/app_constants.dart';
import 'package:sokosellers/util/dimensions.dart';
import 'package:sokosellers/util/images.dart';
import 'package:sokosellers/util/styles.dart';
import 'package:sokosellers/view/base/custom_image.dart';
import 'package:sokosellers/view/base/input_field_shimmer.dart';

class InputBoxView extends StatelessWidget {
  final TextEditingController inputAmountController;
  final FocusNode? focusNode;
  final String? transactionType;

  const InputBoxView({
    Key? key,
    required this.inputAmountController, this.focusNode, this.transactionType,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<TransactionMoneyController>(
        builder: (transactionMoneyController) {
          return  transactionMoneyController.isLoading ?
          const InputFieldShimmer() :  Column(children: [
            Stack(children: [

              Container(color: Theme.of(context).cardColor,
                child: Column(
                  children: [ Container( width: context.width * 0.6,
                    padding: const EdgeInsets.symmetric(vertical: Dimensions.paddingSizeLarge),
                    child: TextField(inputFormatters: <TextInputFormatter>[
                      LengthLimitingTextInputFormatter(
                        Get.find<SplashController>().configModel!.currencyPosition == 'left' ?
                        AppConstants.balanceInputLen + (AppConstants.balanceInputLen / 3).floor(
                        ) + Get.find<SplashController>().configModel!.currencySymbol!.length :

                        AppConstants.balanceInputLen + (AppConstants.balanceInputLen / 3).ceil(
                        ) + Get.find<SplashController>().configModel!.currencySymbol!.length,

                      ),

                      CurrencyTextInputFormatter(
                        decimalDigits: 0,
                        locale: Get.find<SplashController>().configModel!.currencyPosition == 'left' ? 'en' : 'fr',
                        symbol:'${Get.find<SplashController>().configModel!.currencySymbol}',
                      ),
                    ],
                      keyboardType: const TextInputType.numberWithOptions(decimal: true),
                      controller: inputAmountController,
                      focusNode: focusNode,
                      textAlignVertical: TextAlignVertical.center,
                      textAlign: TextAlign.center,
                      style: rubikMedium.copyWith(fontSize: 34, color: Theme.of(context).textTheme.titleLarge!.color),
                      decoration: InputDecoration(
                        isCollapsed : true,
                        hintText:PriceConverter.balanceInputHint(),
                        border : InputBorder.none, focusedBorder: const UnderlineInputBorder(),
                        hintStyle: rubikMedium.copyWith(
                          fontSize: 34, color: Theme.of(context).textTheme.titleLarge!.color!.withOpacity(0.7),
                        ),

                      ),

                    ),
                  ),

                    Center( child: GetBuilder<ProfileController>(
                      builder: (profController)=> profController.isLoading ? Center(
                        child: CircularProgressIndicator(color: Theme.of(context).textTheme.titleLarge!.color),
                      ) :
                      Text(
                        '${'available_balance'.tr} ${PriceConverter.availableBalance()}',
                        style: rubikRegular.copyWith(
                          fontSize: Dimensions.fontSizeLarge,
                          color: Theme.of(context).textTheme.bodyLarge!.color!.withOpacity(0.3),
                        ),
                      ),
                    ),),
                    const SizedBox(height: Dimensions.paddingSizeDefault,),


                  ],
                ),
              ),

              if(transactionType == TransactionType.sendMoney) Positioned(
                left: Get.find<LocalizationController>().isLtr ? Dimensions.paddingSizeLarge : null,
                bottom: Get.find<LocalizationController>().isLtr ? Dimensions.paddingSizeExtraLarge : null,
                right:  Get.find<LocalizationController>().isLtr ? null : Dimensions.paddingSizeLarge,
                child: CustomImage(
                  image:'${Get.find<SplashController>().configModel!.baseUrls!.purposeImageUrl
                  }/${transactionMoneyController.purposeList!.isEmpty ? Purpose().logo :
                  transactionMoneyController.purposeList?[transactionMoneyController.selectedItem].logo}',
                  height: 50, width: 50, fit: BoxFit.cover,
                  placeholder: Images.sendMoneyLogo,
                ),
              ),

            ],),

            Container(
              height: Dimensions.dividerSizeMedium,
              color: Theme.of(context).dividerColor,
            ),
          ],
          );
        }
    );
  }
}
