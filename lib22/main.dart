import 'dart:async';

import 'package:camera/camera.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';
import '../lib22/controller/localization_controller.dart';
import '../lib22/controller/theme_controller.dart';
import '../lib22/helper/notification_helper.dart';
import '../lib22/helper/route_helper.dart';
import '../lib22/theme/dark_theme.dart';
import '../lib22/theme/light_theme.dart';
import '../lib22/util/app_constants.dart';
import '../lib22/util/messages.dart';
import '../lib22/controller/theme_controller.dart';
import 'package:url_strategy/url_strategy.dart';

import 'helper/get_di.dart' as di;
import 'package:get_storage/get_storage.dart';

import 'dart:async';
import 'dart:io' show Platform, sleep;

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
// import 'package:flutter_nfc_kit/flutter_nfc_kit.dart';
import 'package:logging/logging.dart';
import 'package:ndef/ndef.dart' as ndef;
import 'package:ndef/utilities.dart';



final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
 late List<CameraDescription> cameras;

Future<void> main() async {
  setPathUrlStrategy();
  WidgetsFlutterBinding.ensureInitialized();
  if(kIsWeb && GetPlatform.isAndroid){
    await Permission.notification.isDenied.then((value) {
      if (value) {
        Permission.notification.request();
      }
    });
  }


  await Firebase.initializeApp();
  await GetStorage.init();

  cameras =await availableCameras();

  Map<String, Map<String, String>> languages = await di.init();
  Logger.root.level = Level.ALL; // defaults to Level.INFO
  Logger.root.onRecord.listen((record) {
    print('${record.level.name}: ${record.time}: ${record.message}');
  });  
  int? orderID;
   SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight
    ]);
  runApp(MyApp(languages: languages, orderID: orderID));

}

class MyApp extends StatelessWidget {
  final Map<String, Map<String, String>>? languages;
  final int? orderID;
  const MyApp({Key? key, required this.languages, required this.orderID}) : super(key: key);

  @override
  Widget build(BuildContext context) { 
    return GetBuilder<ThemeController>(builder: (themeController) {
      return GetBuilder<LocalizationController>(builder: (localizeController) {
        return GetMaterialApp(
          navigatorObservers: [FlutterSmartDialog.observer],
          builder: FlutterSmartDialog.init(),
          title: AppConstants.appName,        
          debugShowCheckedModeBanner: false,
          navigatorKey: Get.key,
          theme: themeController.darkTheme ? dark : light,
          locale: localizeController.locale,
          translations: Messages(languages: languages),
          fallbackLocale: Locale(AppConstants.languages[0].languageCode!, AppConstants.languages[0].countryCode),
          initialRoute: RouteHelper.getSplashRoute(),
          getPages: RouteHelper.routes,
          defaultTransition: Transition.topLevel,
          transitionDuration: const Duration(milliseconds: 500),
        );
      },      
      );
    },
    );
  }
}
