
import 'package:expandable_bottom_sheet/expandable_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../lib22/controller/banner_controller.dart';
import '../../../../lib22/controller/home_controller.dart';
import '../../../../lib22/controller/notification_controller.dart';
import '../../../../lib22/controller/profile_screen_controller.dart';
import '../../../../lib22/controller/requested_money_controller.dart';
import '../../../../lib22/controller/splash_controller.dart';
import '../../../../lib22/controller/transaction_controller.dart';
import '../../../../lib22/controller/transaction_history_controller.dart';
import '../../../../lib22/controller/websitelink_controller.dart';
import '../../../../lib22/util/dimensions.dart';
import '../../../../lib22/view/screens/home/widget/app_bar_base.dart';
import '../../../../lib22/view/screens/home/widget/bottom_sheet/expandable_content.dart';
import '../../../../lib22/view/screens/home/widget/bottom_sheet/persistent_header.dart';
import '../../../../lib22/view/screens/home/widget/first_card_portion.dart';
import '../../../../lib22/view/screens/home/widget/linked_website.dart';
import '../../../../lib22/view/screens/home/widget/secend_card_portion.dart';
import '../../../../lib22/view/screens/home/widget/third_card_portion.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Future<void> _loadData(BuildContext context, bool reload) async {
    if(reload){
      Get.find<SplashController>().getConfigData();
    }

    Get.find<ProfileController>().profileData(reload: reload);
    Get.find<BannerController>().getBannerList(reload);
    Get.find<RequestedMoneyController>().getRequestedMoneyList(reload, isUpdate: reload);
    Get.find<RequestedMoneyController>().getOwnRequestedMoneyList(reload, isUpdate: reload);
    Get.find<TransactionHistoryController>().getTransactionData(1, reload: reload);
    Get.find<WebsiteLinkController>().getWebsiteList(reload, isUpdate: reload);
    Get.find<NotificationController>().getNotificationList(reload, isUpdate: reload);
    Get.find<TransactionMoneyController>().getPurposeList(reload,  isUpdate: reload);
    Get.find<TransactionMoneyController>().getWithdrawMethods(isReload: reload);
    Get.find<RequestedMoneyController>().getWithdrawHistoryList(reload: false);




  }
  @override
  void initState() {

    _loadData(context, false);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return  GetBuilder<HomeController>(
        builder: (controller) {
          return Scaffold(
            appBar: const AppBarBase(),
            body: ExpandableBottomSheet(
                enableToggle: true,
                background: RefreshIndicator(
                  onRefresh: () async => await _loadData(context, true),
                  child: SingleChildScrollView(
                    physics: const AlwaysScrollableScrollPhysics(),
                    child: GetBuilder<SplashController>(builder: (splashController) {
                      int themeIndex = splashController.configModel!.themeIndex ?? 1;
                      return Column(children: [

                        themeIndex == 1 ?  const FirstCardPortion() :
                        themeIndex == 2 ? const SecondCardPortion() :
                        themeIndex == 3 ? const ThirdCardPortion() :
                        const FirstCardPortion(),


                        const SizedBox(height: Dimensions.paddingSizeDefault),

                        const LinkedWebsite(),
                        const SizedBox(height: 80),

                      ]);
                    }),
                  ),
                ),
                persistentContentHeight: 70,
                persistentHeader: const CustomPersistentHeader(),
                expandableContent: const CustomExpandableContent()
            ),
          );
        });
  }

}

