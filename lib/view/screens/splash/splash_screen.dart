import 'dart:async';
import 'dart:io';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sokosellers/controller/auth_controller.dart';
import 'package:sokosellers/data/api/api_checker.dart';
import 'package:sokosellers/util/images.dart';
import 'package:sokosellers/view/base/custom_snackbar.dart';
import 'package:sokosellers/view/screens/auth/login/sokoLogoin.dart';
import 'package:sokosellers/view/screens/home/sokoHome.dart';

// import 'package:sokosellers/controller/auth_controller.dart';
// import 'package:sokosellers/controller/splash_controller.dart';
// import 'package:sokosellers/controller/transaction_controller.dart';
// import 'package:sokosellers/data/api/api_checker.dart';
// import 'package:sokosellers/data/model/response/user_data.dart';
// import 'package:sokosellers/helper/route_helper.dart';
// import 'package:sokosellers/util/images.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:sokosellers/view/base/custom_snackbar.dart';
// import 'package:sokosellers/view/screens/auth/login/login_screen.dart';
// import 'package:sokosellers/view/screens/auth/login/sokoLogoin.dart';
// import 'package:sokosellers/view/screens/home/sokoHome.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with WidgetsBindingObserver {
  late StreamSubscription<ConnectivityResult> _onConnectivityChanged;
  final Connectivity _connectivity = Connectivity();

  @override
  void initState() {
    super.initState();

    _onConnectivityChanged = _connectivity.onConnectivityChanged.listen((ConnectivityResult result) async {
      if(await ApiChecker.isVpnActive()) {
        showCustomSnackBar('you are using vpn', isVpn: true, duration: const Duration(minutes: 10));
      }
      await _route();

    });

  }


  @override
  void dispose() {
    super.dispose();
    _onConnectivityChanged.cancel();
  }

  Future<void> _route() async {
    
    
    await Future.delayed(const Duration(seconds: 4));
    
    
    
    // Simulate some initialization delay
    // if (Platform.isAndroid || Platform.isIOS) {
    //   Get.offNamed(RouteHelper.getMobileHome());
    // } else if (Platform.isMacOS || Platform.isWindows || Platform.isLinux) {
    //   Get.offNamed(RouteHelper.getDesktopHome());
    // } else {
    //   Get.offNamed(RouteHelper.getDesktopHome());
    // }
    // await  Get.find<TransactionMoneyController>().fetchContact().then((_){
    //   Get.find<SplashController>().getConfigData().then((value) {
    //     if(value.isOk) {
    //       Timer(const Duration(seconds: 1), () async {
    //         Get.find<SplashController>().initSharedData().then((value) {
    //           UserData? userData = Get.find<AuthController>().getUserData();

    //           if(userData != null && (Get.find<SplashController>().configModel!.companyName != null)){
    //             Get.offNamed(RouteHelper.getLoginRoute(
    //               countryCode: userData.countryCode,phoneNumber: userData.phone,
    //             ));
    //           }else{
    //             Get.offNamed(RouteHelper.getChoseLoginRegRoute());
    //           }
    //         });

    //       });
    //     }
    //   });

    // });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TimerWidget(
            function: () async {
                // final sharedPreferences = await SharedPreferences.getInstance();
final sharedPreferences = await SharedPreferences.getInstance();

     
    final bool? isLoggedIn = sharedPreferences.getBool('isSokoLoggedIn');
  

    print("-------islogin----is---${Get.find<AuthController>().isLoggedIn()}-----------------");
// Get.find<AuthController>().getAuthToken


    if(Get.find<AuthController>().isLoggedIn() ==  false)
    { 
      // SokoHome().launch(context);
      SokoLoginScreen().launch(context);
                            //  Get.to(   SokoLoginScreen());
    } else{ 
      // SokoLoginScreen().launch(context); 
      SokoHome().launch(context);
      };
    
    },
            duration: GetNumUtils(10).seconds,
            child:   Center(
               child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Image.asset(Images.logo, height: 175),

            /// Timer widget
          
          ],
        ),
      ),
          ),
      
      
     
    );
  }
}
