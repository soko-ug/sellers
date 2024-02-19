import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sokosellers/util/app_constants.dart';
import 'package:sokosellers/util/dimensions.dart';
import 'package:sokosellers/util/styles.dart';

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
