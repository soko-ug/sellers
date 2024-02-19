import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../lib22/controller/splash_controller.dart';
import '../../../../lib22/controller/transaction_controller.dart';
import '../../../../lib22/data/model/response/contact_model.dart';
import '../../../../lib22/helper/transaction_type.dart';
import '../../../../lib22/util/color_resources.dart';
import '../../../../lib22/util/dimensions.dart';
import '../../../../lib22/util/images.dart';
import '../../../../lib22/util/styles.dart';
import '../../../../lib22/view/base/contact_view.dart';
import '../../../../lib22/view/base/custom_app_bar.dart';
import '../../../../lib22/view/base/custom_country_code_picker.dart';
import '../../../../lib22/view/base/custom_image.dart';
import '../../../../lib22/view/base/custom_ink_well.dart';
import '../../../../lib22/view/base/custom_snackbar.dart';
import '../../../../lib22/view/screens/transaction_money/transaction_money_balance_input.dart';
import '../../../../lib22/view/screens/transaction_money/widget/scan_button.dart';

import '../auth/selfie_capture/camera_screen.dart';

class TransactionMoneyScreen extends StatefulWidget {
  final bool? fromEdit;
  final String? phoneNumber;
  final String? transactionType;
  const TransactionMoneyScreen({Key? key, this.fromEdit, this.phoneNumber, this.transactionType}) : super(key: key);

  @override
  State<TransactionMoneyScreen> createState() => _TransactionMoneyScreenState();
}

class _TransactionMoneyScreenState extends State<TransactionMoneyScreen> {
  String? customerImageBaseUrl = Get.find<SplashController>().configModel!.baseUrls!.customerImageUrl;

  String? agentImageBaseUrl = Get.find<SplashController>().configModel!.baseUrls!.agentImageUrl;
  final ScrollController _scrollController = ScrollController();
  String? _countryCode;

  @override
  void initState() {
    super.initState();

    _countryCode = CountryCode.fromCountryCode(Get.find<SplashController>().configModel!.country!).dialCode;
    Get.find<TransactionMoneyController>().getSuggestList(type: widget.transactionType);
    Get.find<TransactionMoneyController>().searchContact(searchTerm: '');

  }

  @override
  Widget build(BuildContext context) {
     final TextEditingController searchController = TextEditingController();
     widget.fromEdit!? searchController.text = widget.phoneNumber!: const SizedBox();
     final transactionMoneyController = Get.find<TransactionMoneyController>();

    return Scaffold(
      appBar:  CustomAppbar(title: widget.transactionType!.tr),

      body: CustomScrollView(
         controller: _scrollController,
        slivers: [
          SliverPersistentHeader(
            pinned: true,
            delegate: SliverDelegate(
                child: Column(children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: Dimensions.paddingSizeDefault), color: ColorResources.getGreyBaseGray3(),
                    child: Row(
                        children: [
                          Expanded(
                            child: TextField(
                              controller: searchController,
                              onChanged: (inputText) => transactionMoneyController.searchContact(
                                searchTerm: inputText.toLowerCase(),
                              ),
                              keyboardType: widget.transactionType == TransactionType.cashOut
                                  ? TextInputType.phone : TextInputType.name,
                              decoration: InputDecoration(
                                border: InputBorder.none, contentPadding: const EdgeInsets.only(top: Dimensions.paddingSizeDefault),
                                hintText: widget.transactionType == TransactionType.cashOut
                                    ? 'enter_agent_number'.tr : 'enter_name_or_number'.tr,
                                hintStyle: rubikRegular.copyWith(
                                  fontSize: Dimensions.fontSizeLarge,
                                  color: ColorResources.getGreyBaseGray1(),
                                ),
                                prefixIcon: CustomCountryCodePiker(
                                  onChanged: (countryCode) => _countryCode = countryCode.dialCode!,
                                ),
                              ),
                            ),),

                          Icon(Icons.search, color: ColorResources.getGreyBaseGray1()),
                        ]),
                  ),
                  Divider(height: Dimensions.dividerSizeSmall, color: Theme.of(context).cardColor),

                  Container(
                    color: Theme.of(context).cardColor,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: Dimensions.paddingSizeLarge, vertical: Dimensions.paddingSizeSmall),
                      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          ScanButton(onTap: ()=> Get.to(()=> CameraScreen(
                            fromEditProfile: false,
                            isBarCodeScan: true,
                            transactionType: widget.transactionType,
                          ))),

                          InkWell(
                            onTap: () {
                              if(searchController.text.isEmpty){
                                showCustomSnackBar('input_field_is_empty'.tr,isError: true);
                              }else {
                                String phoneNumber = '$_countryCode${searchController.text.trim()}';
                                if (widget.transactionType == "cash_out") {
                                  Get.find<TransactionMoneyController>().checkAgentNumber(phoneNumber: phoneNumber).then((value) {
                                    if (value.isOk) {
                                      String? agentName = value.body['data']['name'];
                                      String? agentImage = value.body['data']['image'];
                                      Get.to(() => TransactionMoneyBalanceInput(transactionType: widget.transactionType,
                                          contactModel: ContactModel(
                                              phoneNumber: '$_countryCode${searchController.text.trim()}',
                                              name: agentName,
                                              avatarImage: agentImage))
                                      );
                                    }
                                  });
                                } else {
                                  Get.find<TransactionMoneyController>().checkCustomerNumber(phoneNumber: phoneNumber).then((value) {
                                    if (value!.isOk) {
                                      String? customerName = value.body['data']['name'];
                                      String? customerImage = value.body['data']['image'];
                                      Get.to(() =>  TransactionMoneyBalanceInput(
                                          transactionType: widget.transactionType,
                                          contactModel: ContactModel(
                                              phoneNumber:'$_countryCode${searchController.text.trim()}',
                                              name: customerName,
                                              avatarImage: customerImage))
                                      );
                                    }
                                  });
                                }
                              }

                            },

                            child: GetBuilder<TransactionMoneyController>(
                                builder: (checkController) {
                                  return checkController.isButtonClick ? SizedBox(
                                      width: Dimensions.radiusSizeOverLarge,height:  Dimensions.radiusSizeOverLarge,
                                      child: Center(child: CircularProgressIndicator(color: Theme.of(context).textTheme.titleLarge!.color)))
                                      : Container(width: Dimensions.radiusSizeOverLarge,height:  Dimensions.radiusSizeOverLarge,
                                      decoration: BoxDecoration(shape: BoxShape.circle, color: Theme.of(context).secondaryHeaderColor),
                                      child: Icon(Icons.arrow_forward, color: ColorResources.blackColor));
                                }
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
                )
            ),
          ),

          SliverToBoxAdapter(
            child: Column( children: [
              transactionMoneyController.sendMoneySuggestList.isNotEmpty &&  widget.transactionType == 'send_money'?
              GetBuilder<TransactionMoneyController>(builder: (sendMoneyController) {
                return  Padding(
                  padding: const EdgeInsets.symmetric(vertical: Dimensions.paddingSizeSmall, horizontal: Dimensions.paddingSizeLarge),
                  child: Column(mainAxisAlignment: MainAxisAlignment.start, crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(padding: const EdgeInsets.only(bottom: Dimensions.paddingSizeSmall),
                        child: Text('suggested'.tr, style: rubikMedium.copyWith(fontSize: Dimensions.fontSizeLarge)),
                      ),
                      SizedBox(height: 80.0,
                        child: ListView.builder(itemCount: sendMoneyController.sendMoneySuggestList.length, scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index)=> CustomInkWell(
                              radius : Dimensions.radiusSizeVerySmall,
                              highlightColor: Theme.of(context).textTheme.titleLarge!.color!.withOpacity(0.3),
                              onTap: () {
                                sendMoneyController.suggestOnTap(index, widget.transactionType);
                              },
                              child: Container(
                                margin: const EdgeInsets.only(right: Dimensions.paddingSizeSmall),
                                child: Column(children: [
                                  SizedBox(
                                    height: Dimensions.radiusSizeExtraExtraLarge,width:Dimensions.radiusSizeExtraExtraLarge,
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(Dimensions.radiusSizeOverLarge),
                                      child: CustomImage(
                                        fit: BoxFit.cover,
                                        image: "$customerImageBaseUrl/${sendMoneyController.sendMoneySuggestList[index].avatarImage.toString()}",
                                        placeholder: Images.avatar,
                                      ),
                                    ),
                                  ), Padding(padding: const EdgeInsets.only(top: Dimensions.paddingSizeSmall),
                                    child: Text(sendMoneyController.sendMoneySuggestList[index].name == null ? sendMoneyController.sendMoneySuggestList[index].phoneNumber! : sendMoneyController.sendMoneySuggestList[index].name! ,
                                        style: sendMoneyController.sendMoneySuggestList[index].name == null ? rubikLight.copyWith(fontSize: Dimensions.fontSizeSmall) : rubikRegular.copyWith(fontSize: Dimensions.fontSizeDefault)),
                                  )
                                ],
                                ),
                              ),
                            )
                        ),
                      ),
                    ],
                  ),
                );
              }
              ) :
              ((transactionMoneyController.requestMoneySuggestList.isNotEmpty) && widget.transactionType == 'request_money') ?
              GetBuilder<TransactionMoneyController>(builder: (requestMoneyController) {
                return requestMoneyController.isLoading ? const Center(child: CircularProgressIndicator()) : Padding(
                  padding: const EdgeInsets.symmetric(vertical: Dimensions.paddingSizeSmall, horizontal: Dimensions.paddingSizeLarge),
                  child: Column(mainAxisAlignment: MainAxisAlignment.start, crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(padding: const EdgeInsets.only(bottom: Dimensions.paddingSizeSmall),
                        child: Text('suggested'.tr, style: rubikMedium.copyWith(fontSize: Dimensions.fontSizeLarge)),
                      ),
                      SizedBox(height: 80.0,
                        child: ListView.builder(itemCount: requestMoneyController.requestMoneySuggestList.length, scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index)=> CustomInkWell(
                              radius : Dimensions.radiusSizeVerySmall,
                              highlightColor: Theme.of(context).textTheme.titleLarge!.color!.withOpacity(0.3),
                              onTap: () {
                                requestMoneyController.suggestOnTap(index, widget.transactionType);
                                },
                              child: Container(
                                margin: const EdgeInsets.only(right: Dimensions.paddingSizeSmall),
                                child: Column(children: [
                                  SizedBox(
                                    height: Dimensions.radiusSizeExtraExtraLarge,width:Dimensions.radiusSizeExtraExtraLarge,
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(Dimensions.radiusSizeOverLarge),
                                      child: CustomImage(image: "$customerImageBaseUrl/${requestMoneyController.requestMoneySuggestList[index].avatarImage.toString()}",
                                        fit: BoxFit.cover, placeholder: Images.avatar),
                                    ),
                                  ),

                                  Padding(padding: const EdgeInsets.only(top: Dimensions.paddingSizeSmall),
                                    child: Text(requestMoneyController.requestMoneySuggestList[index].name == null ? requestMoneyController.requestMoneySuggestList[index].phoneNumber! : requestMoneyController.requestMoneySuggestList[index].name! ,
                                        style: requestMoneyController.requestMoneySuggestList[index].name == null ? rubikLight.copyWith(fontSize: Dimensions.fontSizeLarge) : rubikRegular.copyWith(fontSize: Dimensions.fontSizeLarge)),
                                  )
                                ],
                                ),
                              ),
                            )
                        ),
                      ),
                    ],
                  ),
                );
              }
              ) :
              ((transactionMoneyController.cashOutSuggestList.isNotEmpty) && widget.transactionType == TransactionType.cashOut)?
              GetBuilder<TransactionMoneyController>(builder: (cashOutController) {
                return cashOutController.isLoading ? const Center(child: CircularProgressIndicator()) : Column(mainAxisAlignment: MainAxisAlignment.start, crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(padding: const EdgeInsets.symmetric(vertical: Dimensions.paddingSizeSmall, horizontal: Dimensions.paddingSizeLarge),
                      child: Text('recent_agent'.tr, style: rubikMedium.copyWith(fontSize: Dimensions.fontSizeLarge)),
                    ),
                    ListView.builder(
                        itemCount: cashOutController.cashOutSuggestList.length, scrollDirection: Axis.vertical, shrinkWrap:true,physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index)=> CustomInkWell(
                          highlightColor: Theme.of(context).textTheme.titleLarge!.color!.withOpacity(0.3),
                          onTap: () => cashOutController.suggestOnTap(index, widget.transactionType),
                          child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: Dimensions.paddingSizeLarge,vertical: Dimensions.paddingSizeSmall),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                              SizedBox(
                                height: Dimensions.radiusSizeExtraExtraLarge,width:Dimensions.radiusSizeExtraExtraLarge,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(Dimensions.radiusSizeOverLarge),
                                  child: CustomImage(
                                    fit: BoxFit.cover,
                                    image: "$agentImageBaseUrl/${
                                        cashOutController.cashOutSuggestList[index].avatarImage.toString()}",
                                    placeholder: Images.avatar,
                                  ),
                                ),
                              ),
                              const SizedBox(width: Dimensions.paddingSizeSmall,),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(cashOutController.cashOutSuggestList[index].name == null ?'Unknown':cashOutController.cashOutSuggestList[index].name!,style: rubikRegular.copyWith(fontSize: Dimensions.fontSizeLarge,color: Theme.of(context).textTheme.bodyLarge!.color)),
                                  Text(cashOutController.cashOutSuggestList[index].phoneNumber != null ? cashOutController.cashOutSuggestList[index].phoneNumber! : 'No Number',style: rubikLight.copyWith(fontSize: Dimensions.fontSizeDefault,color: ColorResources.getGreyBaseGray1()),),
                                ],
                              )
                            ],
                            ),
                          ),
                        )

                    ),
                  ],
                );
              }
              ) : const SizedBox(),


              ],),

          ),

          ContactView(transactionType: widget.transactionType)
        ],
      ),
    );
  }
}



class SliverDelegate extends SliverPersistentHeaderDelegate {
  Widget child;
  SliverDelegate({required this.child});

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return child;
  }

  @override
  double get maxExtent => 120;

  @override
  double get minExtent => 120;

  @override
  bool shouldRebuild(SliverDelegate oldDelegate) {
    return oldDelegate.maxExtent != 120 || oldDelegate.minExtent != 120 || child != oldDelegate.child;
  }
}
