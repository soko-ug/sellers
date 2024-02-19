import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:sokosellers/controller/profile_screen_controller.dart';
import 'package:sokosellers/controller/splash_controller.dart';
import 'package:sokosellers/data/model/response/user_info.dart';
import 'package:sokosellers/util/dimensions.dart';
import 'package:sokosellers/util/images.dart';
import 'package:sokosellers/util/styles.dart';
import 'package:sokosellers/view/base/custom_image.dart';
import 'package:sokosellers/view/base/custom_ink_well.dart';
import 'package:sokosellers/view/screens/kyc_verify/kyc_verify_screen.dart';
import 'package:sokosellers/view/screens/profile/widget/bootom_sheet.dart';

import 'profile_shimmer.dart';

class UserInfoWidget extends StatelessWidget {
  const UserInfoWidget({Key? key,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  GetBuilder<ProfileController>(
      builder: (profileController) =>
      profileController.isLoading ? const ProfileShimmer() :
      Container(
        color: Theme.of(context).cardColor,
        padding: const EdgeInsets.symmetric(
          horizontal: Dimensions.paddingSizeLarge,
          vertical: Dimensions.paddingSizeLarge,
        ), 
        child: Text("hello"), ),
    );
  }
}
