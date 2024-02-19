
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sokosellers/controller/notification_controller.dart';
import 'package:sokosellers/controller/splash_controller.dart';
import 'package:sokosellers/util/color_resources.dart';
import 'package:sokosellers/util/dimensions.dart';
import 'package:sokosellers/util/images.dart';
import 'package:sokosellers/util/styles.dart';
import 'package:sokosellers/view/base/appbar_home_element.dart';
import 'package:sokosellers/view/base/custom_image.dart';
import 'package:sokosellers/view/base/custom_ink_well.dart';
import 'package:sokosellers/view/base/no_data_screen.dart';
import 'package:sokosellers/view/screens/notification/widget/notification_dialog.dart';
import 'package:sokosellers/view/screens/notification/widget/notification_shimmer.dart';
class NotificationScreen extends StatefulWidget {
  const NotificationScreen({ Key? key }) : super(key: key);

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}


class _NotificationScreenState extends State<NotificationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppbarHomeElement(title: 'notification'.tr),
      body: RefreshIndicator(
        onRefresh: () async{
          await Get.find<NotificationController>().getNotificationList(true, isUpdate: true);
        },
        child: GetBuilder<NotificationController>(
          builder: (notification) {
            return notification.notificationList == null ? const NotificationShimmer() :  notification.notificationList!.isNotEmpty ?  ListView.builder(
              itemCount: notification.notificationList!.length,
              padding: const EdgeInsets.symmetric(vertical: Dimensions.paddingSizeSmall),
              itemBuilder: (context, index) {
                return Container(
                  color: Theme.of(context).cardColor,
                  margin: const EdgeInsets.symmetric(vertical: 5),
                  child: CustomInkWell(
                    onTap: (){
                      showDialog(context: context, builder: (context) => NotificationDialog(notificationModel: notification.notificationList![index]));
                    },
                    highlightColor: Theme.of(context).primaryColor.withOpacity(0.1),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: Dimensions.paddingSizeSmall,horizontal:  Dimensions.paddingSizeExtraLarge),
                      child: Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(notification.notificationList![index].title!, style: rubikSemiBold.copyWith(fontSize: Dimensions.fontSizeDefault, color: ColorResources.getTextColor())),
                              const SizedBox(height: Dimensions.paddingSizeSmall,),
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.6,
                                child: Text(notification.notificationList![index].description!, maxLines: 2, overflow: TextOverflow.ellipsis, style: rubikRegular.copyWith(fontSize: Dimensions.fontSizeDefault, color: ColorResources.getTextColor())),
                              ),

                            ],
                          ),

                          const Spacer(),
                          SizedBox(
                            height: 64.0,
                            width: 64.0,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(Dimensions.radiusSizeExtraSmall),
                              child: CustomImage(
                                placeholder: Images.placeholder, height: 50, width: 50, fit: BoxFit.cover,
                                image: '${Get.find<SplashController>().configModel!.baseUrls!.notificationImageUrl
                                }/${notification.notificationList![index].image}',
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                );

              },
            ) : const NoDataFoundScreen();
          },
        ),
      ),
    );
  }
}
