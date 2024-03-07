// import 'package:flutter/material.dart';

// class BottomNav extends StatelessWidget {
//   const BottomNav({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Container();
//   }
// }
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:sokosellers/controller/auth_controller.dart';
import 'package:sokosellers/controller/menu_controller.dart';
import 'package:sokosellers/util/color_resources.dart';
import 'package:sokosellers/util/dimensions.dart';
import 'package:sokosellers/util/images.dart';
import 'package:sokosellers/view/base/animated_custom_dialog.dart';
import 'package:sokosellers/view/base/logout_dialog.dart';
import 'package:sokosellers/view/screens/auth/selfie_capture/camera_screen.dart';
import 'package:sokosellers/view/screens/deshboard/widget/unicorn_outline_button.dart';
import 'package:sokosellers/view/screens/splash/splash_screen.dart';

class BottomNav extends StatefulWidget {
  const BottomNav({Key? key}) : super(key: key);

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  final PageStorageBucket bucket = PageStorageBucket();

  @override
  void initState() {
    super.initState();
    Get.find<MenuItemController>().selectHomePage(isUpdate: false);

    Get.find<AuthController>().checkBiometricWithPin();
  }

  @override
  Widget build(BuildContext context) {
    // ignore: deprecated_member_use
    return WillPopScope(
          onWillPop: () => _onWillPop(context),
          child: GetBuilder<MenuItemController>(builder: (menuController) {
            return Scaffold(
              backgroundColor: Theme.of(context).bottomNavigationBarTheme.selectedItemColor,
              body: PageStorage(bucket: bucket, child: menuController.currentScreen),

              floatingActionButton: UnicornOutlineButton(
                strokeWidth: 1.5,
                radius: 50,
                gradient: LinearGradient(
                  colors: [
                    ColorResources.gradientColor,
                    ColorResources.gradientColor.withOpacity(0.5),
                    ColorResources.secondaryColor.withOpacity(0.3),
                    ColorResources.gradientColor.withOpacity(0.05),
                    ColorResources.gradientColor.withOpacity(0),
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
                child: FloatingActionButton(
                  backgroundColor: Theme.of(context).secondaryHeaderColor,
                  elevation: 1,
                  onPressed: ()=> Get.to(()=> const CameraScreen(
                    fromEditProfile: false, isBarCodeScan: true, isHome: true,
                  )),
                  child: Padding(
                    padding: const EdgeInsets.all(Dimensions.paddingSizeDefault),
                    child: Image.asset(Images.scannerIcon),
                  ),
                ),
              ),

              floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,

               );
          }),
        );


  }

  Future<bool> _onWillPop(BuildContext context) async {
    showAnimatedDialog(context,
        CustomDialog(
          icon: Icons.exit_to_app_rounded, title: 'exit'.tr, description: 'do_you_want_to_exit_the_app'.tr, onTapFalse:() => Navigator.of(context).pop(false),
          onTapTrue:() {
            SystemNavigator.pop().then((value) => Get.offAll(()=> const SplashScreen()));

            },
          onTapTrueText: 'yes'.tr, onTapFalseText: 'no'.tr,
        ),
        dismissible: false,
        isFlip: true);
    return true;
  }

  Widget customBottomItem({required String icon, required String name, VoidCallback? tap, int? selectIndex}) {
    return InkWell(onTap: tap, child: Column(mainAxisSize: MainAxisSize.min, children: [
      SizedBox(
        height: 20,
        width: Dimensions.fontSizeExtraLarge,
        child: Image.asset(
          icon, fit: BoxFit.contain,
          color: Get.find<MenuItemController>().currentTab == selectIndex
              ? Theme.of(context).textTheme.titleLarge!.color : ColorResources.nevDefaultColor,
        ),
      ),
      const SizedBox(height: 6.0),

      Text(name, style: TextStyle(
        color: Get.find<MenuItemController>().currentTab == selectIndex
            ? Theme.of(context).textTheme.titleLarge!.color : ColorResources.nevDefaultColor,
        fontSize: Dimensions.fontSizeSmall, fontWeight: FontWeight.w400,
      ))

    ]));
  }
}
