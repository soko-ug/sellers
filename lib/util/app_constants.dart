import 'package:get/get.dart';
import 'package:sokosellers/data/model/response/language_model.dart';
import 'package:sokosellers/data/model/response/on_boarding_model.dart';

import 'images.dart';

class AppConstants {
  static const String appName = 'soko sellers';
  static const String baseUrl =  'https://soko.ug/'; //'https://finmicro.sanaa.co';atic 192.168.11.101
  static const String mainUrls = "https://soko.ug/"; // http://159.89.80.33:8080/   //getallusers http://127.0.0.1:8080/ 159.89.80.33 
  static const bool demo = false;
   static const double appVersion = 1.0;
   static const String fontFamily = 'Roboto';


  static const String getAllProfile = '/getallusers';
  static const String customerPhoneCheckUri = '/api/v2/customer/auth/check-phone';
  static const String customerPhoneVerifyUri = '/api/v2/customer/auth/verify-phone';
  static const String customerRegistrationUri = '/api/v2/customer/auth/register';
  static const String customerUpdateProfile = '/api/v2/customer/update-profile';
  static const String sokoLoginUri = '/api/v2/auth/login';
  static const String customerLogoutUri = '/api/v2/customer/logout';
  static const String customerForgetPassOtpUri = '/api/v2/customer/auth/forgot-password';
  static const String customerForgetPassVerification = '/api/v2/customer/auth/verify-token';
  static const String customerForgetPassReset = '/api/v2/customer/auth/reset-password';
  static const String customerLinkedWebsite= '/api/v2/customer/linked-website';
  static const String customerBanner= '/api/v2/customer/get-banner';
  static const String customerTransactionHistory= '/api/v2/customer/transaction-history';
  static const String customerPurposeUrl = '/api/v2/customer/get-purpose';
  static const String configUri = '/api/v2/config';
  static const String imageConfigUrlApiNeed = '/storage/app/public/purpose/';
  static const String customerProfileInfo = '/api/v2/customer/get-customer';
  static const String customerCheckOtp = '/api/v2/customer/check-otp';
  static const String customerVerifyOtp = '/api/v2/customer/verify-otp';
  static const String customerChangePin = '/api/v2/customer/change-pin';
  static const String customerUpdateTwoFactor = '/api/v2/customer/update-two-factor';
  static const String customerSendMoney = '/api/v2/customer/send-money';
  static const String customerRequestMoney = '/api/v2/customer/request-money';
  static const String customerCashOut = '/api/v2/customer/cash-out';
  static const String customerPinVerify = '/api/v2/customer/verify-pin';
  static const String customerAddMoney = '/api/v2/customer/add-money';
  static const String faqUri = '/api/v2/faq';
  static const String notificationUri = '/api/v2/customer/get-notification';
  static const String transactionHistoryUri = '/api/v2/customer/transaction-history';
  static const String requestedMoneyUri = '/api/v2/customer/get-requested-money';
  static const String acceptedRequestedMoneyUri = '/api/v2/customer/request-money/approve';
  static const String deniedRequestedMoneyUri = '/api/v2/customer/request-money/deny';
  static const String tokenUri = '/api/v2/customer/update-fcm-token';
  static const String checkCustomerUri = '/api/v2/check-customer';
  static const String checkAgentUri = '/api/v2/check-agent';
  static const String wonRequestedMoney = '/api/v2/customer/get-own-requested-money';
  static const String customerRemove = '/api/v2/customer/remove-account';
  static const String updateKycInformation = '/api/v2/customer/update-kyc-information';
  static const String withdrawMethodList = '/api/v2/customer/withdrawal-methods';
  static const String withdrawRequest = '/api/v2/customer/withdraw';
  static const String getWithdrawalRequest = '/api/v2/customer/withdrawal-requests';


  static const String default_language = "en";
    static const String mobile_app_code = "en";


  // Shared Key
  static const String theme = 'theme';
  static const String token = 'token';
  static const String customerCountryCode = 'customer_country_code';//not in project
  static const String languageCode = 'language_code';
  static const String topic = 'notify';
  static const String sendMoneySuggestList = 'send_money_suggest';
  static const String requestMoneySuggestList = 'request_money_suggest';
  static const String recentAgentList = 'recent_agent_list';

  static const String pending = 'pending';
  static const String approved = 'approved';
  static const String denied = 'denied';
  static const String cashIn = 'cash_in';
  static const String cashOut = 'cash_out';
  static const String sendMoney = 'send_money';
  static const String receivedMoney = 'received_money';
  static const String adminCharge = 'admin_charge';
  static const String addMoney = 'add_money';
  static const String withdraw = 'withdraw';
  static const String payment = 'payment';

  static const String biometricAuth = 'biometric_auth';
  static const String biometricPin = 'biometric';
  static const String contactPermission = '';
  static const String userData = 'user';



  //topic
  static const String all = 'all';
  static const String users = 'customers';

  // App Theme
  static const String theme1 = 'theme_1';
  static const String theme2 = 'theme_2';
  static const String theme3 = 'theme_3';

  //input balance digit length
  static const int balanceInputLen = 10;

  static List<LanguageModel> languages = [
    LanguageModel(imageUrl: Images.english, languageName: 'English', countryCode: 'US', languageCode: 'en'),
    LanguageModel(imageUrl: Images.saudi, languageName: 'Arabic', countryCode: 'SA', languageCode: 'ar'),

  ];

  static  List<OnboardModel> onboardList = [
    OnboardModel(
      Images.onboardImage1,
      Images.onboardBackground1,
      'on_boarding_title_1'.tr,
      '${'send_money_from'.tr} $appName ${'easily_at_anytime'.tr}',
    ),

    OnboardModel(
      Images.onboardImage2, Images.onboardBackground2,
      'on_boarding_title_2'.tr,
      'withdraw_money_is_even_more'.tr,
    ),
    OnboardModel(
      Images.onboardImage3,
      Images.onboardBackground3,
      'on_boarding_title_3'.tr,
      '${'request_for_money_using'.tr} $appName ${'account_to_any_friend'.tr}',
    ),
  ];
}
