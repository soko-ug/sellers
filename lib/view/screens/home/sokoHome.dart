import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:sokosellers/controller/auth_controller.dart';
import 'package:sokosellers/controller/banner_controller.dart';
import 'package:sokosellers/controller/home_controller.dart';
import 'package:sokosellers/controller/menu_controller.dart';
import 'package:sokosellers/util/app_constants.dart';
import 'package:sokosellers/util/color_resources.dart';
import 'package:sokosellers/util/dimensions.dart';
import 'package:sokosellers/util/images.dart';
import 'package:sokosellers/view/base/animated_custom_dialog.dart';
import 'package:sokosellers/view/base/logout_dialog.dart';
import 'package:sokosellers/view/screens/auth/selfie_capture/camera_screen.dart';
import 'package:sokosellers/view/screens/deshboard/widget/unicorn_outline_button.dart';
import 'package:sokosellers/view/screens/splash/splash_screen.dart';
import 'package:sokosellers/view/sokoScreens/base/bottomNav.dart';

class SokoHome extends StatefulWidget {
  const SokoHome({Key? key}) : super(key: key);

  @override
  State<SokoHome> createState() => _SokoHomeState();
}

class _SokoHomeState extends State<SokoHome> {
  final PageStorageBucket bucket = PageStorageBucket();

  @override
  void initState() {
    super.initState();
   
    // loadData(true);
  }


static Future<void> loadData(bool reload) async {
          // Get.find<BannerController>().getBannerList(reload);
          Get.find<MenuItemController>().selectHomePage(isUpdate: false);
          Get.find<BannerController>().getBrandsList(reload);
          Get.find<BannerController>().getTopBrandsList(reload);
          Get.find<BannerController>().getFeaturedCategoriesList(reload);
          Get.find<BannerController>().getFeaturedProductsList(reload);
          Get.find<BannerController>().getBestSellingProductsList(reload);
          // Get.find<BannerController>().getCategoryProductsList(reload);
          // Get.find<BannerController>().getShopProductsList(reload);
          Get.find<BannerController>().getCategoriesList(reload);
          Get.find<BannerController>().getSliderList(reload);
          // Get.find<BannerController>().getTopBrandsList(reload);
          // Get.find<BannerController>().getTopBrandsList(reload);
          // Get.find<BannerController>().getTopBrandsList(reload);

  }

  @override
  Widget build(BuildContext context) {
    
    return GetBuilder<MenuItemController>(builder: (menuController) {
      return Scaffold(
        backgroundColor: Theme.of(context).bottomNavigationBarTheme.selectedItemColor,
        body: PageStorage(bucket: bucket, child: menuController.currentScreen),
    
        
    
        // floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    
        bottomNavigationBar: Container(
         margin: const EdgeInsets.all(10.0), // Adds 16 pixels margin to all sides

          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                height: 60,
                width: Get.width - 100,
                decoration: BoxDecoration(
                  color: Theme.of(context).bottomNavigationBarTheme.backgroundColor,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(5),
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(5),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: ColorResources.getBlackAndWhite().withOpacity(0.14),
                      blurRadius: 80, offset: const Offset(0, 20),
                    ),
                    BoxShadow(
                      color: ColorResources.getBlackAndWhite().withOpacity(0.20),
                      blurRadius: 0.5, offset: const Offset(0, 0),
                    ),
                  ],
                ),
                  
                child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    customBottomItem(
                      tap: () => menuController.selectHomePage(),
                      icon: menuController.currentTab == 0
                          ? Images.homeIconBold : Images.homeIcon,
                      name: 'home'.tr,
                      selectIndex: 0,
                    ),
                  
                    customBottomItem(
                      tap: () => menuController.selectOrdersPage(),
                      icon: menuController.currentTab == 1
                          ? Images.clockIconBold : Images.clockIcon,
                      name: 'Cart'.tr, selectIndex: 1,
                    ),
                  
                    customBottomItem(
                      tap: () => menuController.selectShopPage(),
                      icon: menuController.currentTab == 2
                          ? Images.notificationIconBold : Images.notificationIcon,
                      name: 'shops'.tr, selectIndex: 2,
                    ),
                  
                    
                  ],
                ),
              ),
           
           
           Container(
                height: 60,
                width: 60,


                decoration: BoxDecoration(
                  color: Theme.of(context).bottomNavigationBarTheme.backgroundColor,
                  borderRadius: const BorderRadius.only(
                   topLeft: Radius.circular(5),
                    topRight: Radius.circular(20),
                    bottomLeft: Radius.circular(5),
                    bottomRight: Radius.circular(20),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: ColorResources.getBlackAndWhite().withOpacity(0.14),
                      blurRadius: 80, offset: const Offset(0, 20),
                    ),
                    BoxShadow(
                      color: ColorResources.getBlackAndWhite().withOpacity(0.20),
                      blurRadius: 0.5, offset: const Offset(0, 0),
                    ),
                  ],
                ),
                  
                child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    
                  
                    customBottomItem(
                      tap: () => menuController.selectHubPage(),
                      icon: menuController.currentTab == 3
                          ? Images.profileIconBold : Images.profileIcon,
                      name: 'hub'.tr,
                      selectIndex: 3,
                    ),
                  ],
                ),
              ),
           
            ],
          ),
        ),
      );
    });


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