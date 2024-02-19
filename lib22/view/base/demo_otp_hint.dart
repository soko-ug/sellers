import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../lib22/util/app_constants.dart';
import '../../../lib22/util/dimensions.dart';
import '../../../lib22/util/styles.dart';

class DemoOtpHint extends StatelessWidget {
  const DemoOtpHint({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppConstants.demo ? Padding(
      padding: const EdgeInsets.symmetric(vertical: Dimensions.paddingSizeSmall),
      child: Text(
        'for_demo_1234'.tr,
        style: rubikMedium.copyWith(fontSize: Dimensions.fontSizeSmall, color: Theme.of(context).highlightColor),
      ),
    ) : const SizedBox();
  }
}
