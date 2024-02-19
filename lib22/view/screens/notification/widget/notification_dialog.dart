import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../lib22/controller/splash_controller.dart';
import '../../../../../lib22/data/model/response/notification_model.dart';
import '../../../../../lib22/util/dimensions.dart';
import '../../../../../lib22/util/images.dart';
import '../../../../../lib22/util/styles.dart';
import '../../../../../lib22/view/base/custom_image.dart';

class NotificationDialog extends StatelessWidget {
  final Notifications notificationModel;
  const NotificationDialog({Key? key, required this.notificationModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10.0))),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [

          Align(
            alignment: Alignment.centerRight,
            child: IconButton(
              icon: const Icon(Icons.close),
              onPressed: () => Navigator.of(context).pop(),
            ),
          ),

          Container(
            height: MediaQuery.of(context).size.width-130, width: MediaQuery.of(context).size.width,
            margin: const EdgeInsets.symmetric(horizontal: Dimensions.paddingSizeLarge),
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: Theme.of(context).primaryColor.withOpacity(0.20)),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: CustomImage(
                placeholder: Images.placeholder,
                image: '${Get.find<SplashController>().configModel!.baseUrls!.notificationImageUrl}/${notificationModel.image}',
                height: MediaQuery.of(context).size.width-130, width: MediaQuery.of(context).size.width, fit: BoxFit.cover,

              ),
            ),
          ),
          const SizedBox(height: Dimensions.paddingSizeLarge),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: Dimensions.paddingSizeLarge),
            child: Text(notificationModel.title!, textAlign: TextAlign.center, style: rubikMedium.copyWith(color: Theme.of(context).primaryColor, fontSize: Dimensions.fontSizeLarge))),

          Padding(
            padding: const EdgeInsets.fromLTRB(20, 10, 20, 20),
            child: Text(notificationModel.description!, textAlign: TextAlign.center, style: rubikRegular)),

        ],
      ),
    );
  }
}
