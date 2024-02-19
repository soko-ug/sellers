import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../lib22/controller/forget_password_controller.dart';
import '../../../../../lib22/util/dimensions.dart';
import '../../../../../lib22/util/styles.dart';
import '../../../../../lib22/view/base/custom_password_field.dart';
class PinFieldView extends StatefulWidget {
  final TextEditingController newPassController, confirmPassController;

  const PinFieldView({Key? key,required this.newPassController,required this.confirmPassController}) : super(key: key);

  @override
  State<PinFieldView> createState() => _PinFieldViewState();
}

class _PinFieldViewState extends State<PinFieldView> {
  final FocusNode confirmFocus = FocusNode();

   @override
  Widget build(BuildContext context) {
    return GetBuilder<ForgetPassController>(builder: (controller){
      return Container(
        margin: const EdgeInsets.only(
        ),
        padding: const EdgeInsets.symmetric(
          horizontal: Dimensions.paddingSizeExtraExtraLarge,
          vertical: Dimensions.paddingSizeExtraExtraLarge,
        ),
        width: double.infinity,
        decoration: BoxDecoration(
          color: Theme.of(context).cardColor,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(Dimensions.radiusSizeExtraExtraLarge),
            topRight: Radius.circular(Dimensions.radiusSizeExtraExtraLarge),
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: Dimensions.radiusSizeExtraExtraLarge),
                child: Text(
                  'Set_new_4_digit_pin'.tr,
                  textAlign: TextAlign.center,
                  style: rubikMedium.copyWith(
                    color: Theme.of(context).textTheme.titleLarge!.color,
                    fontSize: Dimensions.fontSizeExtraOverLarge,
                  ),
                ),
              ),
              const SizedBox(
                height: Dimensions.paddingSizeExtraOverLarge,
              ),
              CustomPasswordField(
                controller: widget.newPassController,
                nextFocus: confirmFocus,
                isPassword: true,
                isShowSuffixIcon: true,
                isIcon: false,
                hint: 'pin'.tr,

                letterSpacing: 10.0,
                fontSize: 24.0,
              ),
              const SizedBox(
                height: Dimensions.paddingSizeExtraLarge,
              ),
              CustomPasswordField(
                controller: widget.confirmPassController,
                focusNode: confirmFocus,
                hint: 'Confirm_Password'.tr,
                isShowSuffixIcon: true,
                isPassword: true,
                isIcon: false,
                textAlign: TextAlign.start,
              ),
              const SizedBox(height: Dimensions.paddingSizeExtraOverLarge),

            ],
          ),
        ),
      );
    });
  }
}
