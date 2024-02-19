import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../lib22/controller/localization_controller.dart';
import '../../../lib22/helper/route_helper.dart';
import '../../../lib22/util/app_constants.dart';
import '../../../lib22/util/dimensions.dart';
import '../../../lib22/view/base/custom_logo.dart';
import '../../../lib22/view/base/rounded_button.dart';

class AppbarStackView extends StatelessWidget {
  const AppbarStackView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final String languageText = AppConstants.languages[Get.find<LocalizationController>().selectedIndex].languageName!;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: Dimensions.paddingSizeDefault),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const CustomLogo(height: 50.0, width: 50.0),

          RoundedButton(
            buttonText: languageText,
            onTap: AppConstants.languages.length > 1 ? (){
              Get.toNamed(RouteHelper.getChoseLanguageRoute());
            } : null,
          ),
        ],
      ),
    );
  }
}



