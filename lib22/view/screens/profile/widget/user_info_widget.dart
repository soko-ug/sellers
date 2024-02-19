import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../../../../../lib22/controller/profile_screen_controller.dart';
import '../../../../../lib22/controller/splash_controller.dart';
import '../../../../../lib22/data/model/response/user_info.dart';
import '../../../../../lib22/util/dimensions.dart';
import '../../../../../lib22/util/images.dart';
import '../../../../../lib22/util/styles.dart';
import '../../../../../lib22/view/base/custom_image.dart';
import '../../../../../lib22/view/base/custom_ink_well.dart';
import '../../../../../lib22/view/screens/kyc_verify/kyc_verify_screen.dart';
import '../../../../../lib22/view/screens/profile/widget/bootom_sheet.dart';

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
