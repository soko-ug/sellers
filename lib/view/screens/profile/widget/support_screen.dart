import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:sokosellers/controller/splash_controller.dart';
import 'package:sokosellers/util/color_resources.dart';
import 'package:sokosellers/util/dimensions.dart';
import 'package:sokosellers/util/images.dart';
import 'package:sokosellers/util/styles.dart';
import 'package:sokosellers/view/base/custom_app_bar.dart';
import 'package:url_launcher/url_launcher.dart';

class SupportScreen extends StatelessWidget {
  const SupportScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final splashController =  Get.find<SplashController>();
    return Scaffold(
      appBar: CustomAppbar(title: '24_support'.tr),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(Dimensions.paddingSizeExtraOverLarge),
              child: Image.asset(Images.supportImage),
            ),

            Text('need_any_help'.tr, style: rubikMedium.copyWith(fontSize: Dimensions.fontSizeOverOverLarge, color: ColorResources.getSupportScreenTextColor())),

            Padding(
              padding: const EdgeInsets.symmetric(vertical: Dimensions.paddingSizeDefault),
              child: Text('feel_free_to_contact'.tr, style: rubikRegular.copyWith(fontSize: Dimensions.fontSizeLarge, color: ColorResources.getSupportScreenTextColor()), textAlign: TextAlign.center),
            ),


            if(splashController.configModel!.companyPhone != null)  Padding(
              padding: const EdgeInsets.only(left: Dimensions.paddingSizeLarge, right: Dimensions.paddingSizeLarge, top: Dimensions.paddingSizeOverLarge, bottom: Dimensions.paddingSizeLarge),
              child: InkWell(
                highlightColor: Theme.of(context).secondaryHeaderColor,
                onTap: () async => await launchUrl(Uri.parse('tel://${splashController.configModel!.companyPhone}')),
                child: Container(
                  padding: const EdgeInsets.all(Dimensions.paddingSizeSmall),
                   // height: Dimensions.PADDING_SIZE_EXTRA_OVER_LARGE,
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(Dimensions.radiusSizeExtraSmall), border: Border.all(color: Theme.of(context).secondaryHeaderColor, width: Dimensions.dividerSizeMedium), ),
                  child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                    const Icon(Icons.phone), Padding(
                      padding: const EdgeInsets.symmetric(horizontal: Dimensions.paddingSizeSmall),
                      child: Text('make_call'.tr, style: rubikRegular.copyWith(fontSize: Dimensions.fontSizeLarge)),
                    )
                  ])),
              ),
            ),

            if(splashController.configModel!.companyEmail != null) Padding(
              padding: const EdgeInsets.symmetric(horizontal: Dimensions.paddingSizeLarge),
              child: InkWell(
                highlightColor: Theme.of(context).secondaryHeaderColor,
                onTap: () async {
                  final Uri params = Uri(scheme: 'mailto', path: splashController.configModel!.companyEmail); String  url = params.toString();
                  if (await canLaunchUrl(Uri.parse(url))) {
                    await launchUrl(Uri.parse(url));
                  }
                },
                child: Container(
                    padding: const EdgeInsets.all(Dimensions.paddingSizeSmall),
                   // height: Dimensions.PADDING_SIZE_EXTRA_OVER_LARGE,
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(Dimensions.radiusSizeExtraSmall), color: Theme.of(context).secondaryHeaderColor),
                  child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [const Icon(Icons.email), Padding(
                    padding: const EdgeInsets.symmetric(horizontal: Dimensions.paddingSizeSmall),
                    child: Text('send_email'.tr, style: rubikRegular.copyWith(fontSize: Dimensions.fontSizeLarge)),
                  )],)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
