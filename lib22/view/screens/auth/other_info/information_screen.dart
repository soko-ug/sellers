import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../lib22/controller/auth_controller.dart';
import '../../../../../lib22/controller/profile_screen_controller.dart';
import '../../../../../lib22/controller/camera_screen_controller.dart';
import '../../../../../lib22/data/model/body/signup_body.dart';
import '../../../../../lib22/helper/email_checker.dart';
import '../../../../../lib22/helper/route_helper.dart';
import '../../../../../lib22/util/dimensions.dart';
import '../../../../../lib22/view/base/animated_custom_dialog.dart';
import '../../../../../lib22/view/base/custom_app_bar.dart';
import '../../../../../lib22/view/base/custom_large_button.dart';
import '../../../../../lib22/view/base/custom_snackbar.dart';
import '../../../../../lib22/view/base/my_dialog.dart';
import '../../../../../lib22/view/screens/auth/other_info/widget/gender_view.dart';
import '../../../../../lib22/view/screens/auth/other_info/widget/input_section.dart';

class InformationScreen extends StatefulWidget {
  const InformationScreen({Key? key}) : super(key: key);

  @override
  State<InformationScreen> createState() => _InformationScreenState();
}

class _InformationScreenState extends State<InformationScreen> {
  TextEditingController occupationTextController = TextEditingController();
  TextEditingController fNameTextController = TextEditingController();
  TextEditingController lNameTextController = TextEditingController();
  TextEditingController emailTextController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        return _onWillPop(context).then((value) => value as bool);
      },
      child: Scaffold(
        appBar: CustomAppbar(title: 'information'.tr, onTap: ()=> _onWillPop(context)),

        body: Column(children: [
          Expanded(flex: 10, child: SingleChildScrollView(child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const GenderView(),
              const SizedBox(height: Dimensions.paddingSizeLarge),

              InputSection(
                occupationController: occupationTextController,
                fNameController: fNameTextController,
                lNameController: lNameTextController,
                emailController: emailTextController,
              ),
              const SizedBox(height: Dimensions.paddingSizeExtraOverLarge),

            ],
          ))),

          GetBuilder<ProfileController>(builder: (getController) {
            return SizedBox(height: 110, child: CustomLargeButton(
              backgroundColor: Theme.of(context).secondaryHeaderColor,
              text: 'proceed'.tr,
              onTap: () {
                if (fNameTextController.text == '' || lNameTextController.text == '') {
                  showCustomSnackBar('first_name_or_last_name'.tr);
                }
                else {
                  if(emailTextController.text != ''){
                    if(EmailChecker.isNotValid(emailTextController.text)){
                      showCustomSnackBar('please_provide_valid_email'.tr,);
                    }
                    else{
                      Get.toNamed(RouteHelper.getPinSetRoute(
                        signUpBody: SignUpBody(
                          fName: fNameTextController.text,
                          lName: lNameTextController.text,
                          email: emailTextController.text,
                          occupation: occupationTextController.text,
                        ),
                      ));
                    }
                  }
                  else{
                    Get.toNamed(RouteHelper.getPinSetRoute(
                      signUpBody: SignUpBody(
                        fName: fNameTextController.text,
                        lName: lNameTextController.text,
                        email: emailTextController.text,
                        occupation: occupationTextController.text,
                      ),
                    ));
                  }
                }
              },
            ));
          })
        ]),
      ),
    );
  }

  Future _onWillPop(BuildContext context) async {
    showAnimatedDialog(context, MyDialog(
        icon: Icons.clear,
        title: 'alert'.tr,
        description: 'your_information_will_remove'.tr,
        isFailed: true,
        showTwoBtn: true,
        onTap: (){
          Get.find<CameraScreenController>().removeImage();
          Get.find<AuthController>().change(0);
          return Get.offAllNamed(RouteHelper.getSplashRoute());
        }),
      dismissible: false,
      isFlip: true,
    );
  }
}
