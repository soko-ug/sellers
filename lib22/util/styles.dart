import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../lib22/util/app_constants.dart';
import '../../lib22/util/dimensions.dart';

const textColorLight = Color.fromARGB(255, 140, 143, 142);
const rubikLight = TextStyle(
  fontFamily: 'Rubik',
  fontWeight: FontWeight.w300,
);

const rubikRegular = TextStyle(
  fontFamily: 'Rubik',
  fontWeight: FontWeight.w400,
);

const rubikMedium = TextStyle(
  fontFamily: 'Rubik',
  fontWeight: FontWeight.w500,
);

const rubikSemiBold = TextStyle(
  fontFamily: 'Rubik',
  fontWeight: FontWeight.w600,
);

final robotoRegular = const TextStyle(
  fontFamily: AppConstants.fontFamily,
  fontWeight: FontWeight.w400,
  fontSize: Dimensions.fontSizeDefault,
);

final robotoMedium = const TextStyle(
  fontFamily: AppConstants.fontFamily,
  fontWeight: FontWeight.w500,
  fontSize: Dimensions.fontSizeDefault,
);

final robotoBold = const TextStyle(
  fontFamily: AppConstants.fontFamily,
  fontWeight: FontWeight.w700,
  fontSize: Dimensions.fontSizeDefault,
);

final robotoBlack = const TextStyle(
  fontFamily: AppConstants.fontFamily,
  fontWeight: FontWeight.w900,
  fontSize: Dimensions.fontSizeDefault,
);

final BoxDecoration riderContainerDecoration = BoxDecoration(
  borderRadius: const BorderRadius.all(Radius.circular(Dimensions.radiusSmall)),
  color: Theme.of(Get.context!).primaryColor.withOpacity(0.1), shape: BoxShape.rectangle,
);

