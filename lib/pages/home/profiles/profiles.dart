import 'package:bucx/pages/base/base.vm.dart';
import 'package:bucx/pages/home/home_vm.dart';
import 'package:bucx/pages/home/profiles/change_password.dart';
import 'package:bucx/pages/home/profiles/profiles_vm.dart';
import 'package:bucx/utils/app_images.dart';
import 'package:bucx/utils/back_button.dart';
import 'package:bucx/utils/constants.dart';
import 'package:bucx/utils/widget_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_switch/flutter_switch.dart';

import '../../../utils/pallet.dart';
import '../../base/base_ui.dart';
import '../add_money/add_crypto.dart';
import 'add_bank_account/add_bank_account.dart';

class Profiles extends StatelessWidget {
  const Profiles({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseView<ProfilesViewModel>(
        notDefaultLoading: true,
        onModelReady: (model) {
          model.loadUserData();
        },
        builder: (context, model, child) => WillPopScope(
          onWillPop: () async {
            return true;
          },
          child: Scaffold(
              backgroundColor: AppColor.white,
              body: Form(
                  key: model.formKey,
                  child: Container(
                    padding: EdgeInsets.only(left: 16.sp, right: 16.sp, top: 28.h),
                    child: ListView(
                      children: [
                        Column(crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                          CircleAvatar(
                            radius: 35.sp,
                            backgroundColor: AppColor.grey1,
                            child: AppText(model.getInitials(model.fullName), size: 26.sp, weight: FontWeight.w600,),
                          ),
                            AppText(model.fullName, size: 18.sp, weight: FontWeight.w500, color: AppColor.textButtonColor,),
                            5.h.sbH,
                            AppText(model.email),
                            10.h.sbH,
                            Container(
                              width: 110.sp,
                              height: 30.h,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(100.r),
                                  color: AppColor.primary
                              ),
                              child:
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(Icons.info_outline_rounded, size: 12.h, color: AppColor.white,),
                                  5.w.sbW,
                                  AppText('Verify Profile', color: AppColor.white,),
                                ],
                              ),)
                        ],),
                        20.h.sbH,
                        GestureDetector(
                          onTap: (){
                            print(model.fullName);
                            navigationService.navigateToWidget(AddCrypto());
                          },
                            child: _buildSettingsTile('Wallet', 'View Wallet Details', false, AppIcons.walletDetails, false, Container(), AppColor.textButtonColor)),
                        30.h.sbH,
                        GestureDetector(
                          onTap: (){
                            navigationService.navigateToWidget(AddBankAccount());
                          },
                            child: _buildSettingsTile('Bank', 'Manage bank account', false, AppIcons.walletDetails, false, Container(), AppColor.textButtonColor)),
                        30.h.sbH,
                        _buildSettingsTile('Security', 'Face ID/Fingerprint ID', true, AppIcons.faceID, model.useFingerprint,
                            FlutterSwitch(
                              width: 42.w,
                              height: 24.h,
                              showOnOff: false,
                              activeColor: AppColor.primary,
                              valueFontSize: 25.0,
                              toggleSize: 19.sp,
                              value: model.useFingerprint,
                              borderRadius: 30.0,
                              padding: 3.sp,
                              onToggle: (val) {
                                model.authenticate();
                              },
                            ), AppColor.textButtonColor),
                        30.h.sbH,
                        GestureDetector(
                          onTap: (){
                            navigationService.navigateToWidget(ChangePassword());
                          },
                            child: _buildSettingsTile('', 'Change Password', false, AppIcons.changePassword, false, Container(), AppColor.textButtonColor)),
                        30.h.sbH,
                        _buildSettingsTile('General', 'Transaction fees', false, AppIcons.transactionFees, false, Container(), AppColor.textButtonColor),
                        30.h.sbH,
                        _buildSettingsTile('Notification', 'Push notifications', true, AppIcons.pushNotifications, model.pushNotification,
                            FlutterSwitch(
                              width: 42.w,
                              height: 24.h,
                              showOnOff: false,
                              activeColor: AppColor.primary,
                              valueFontSize: 25.0,
                              toggleSize: 19.sp,
                              value: model.pushNotification,
                              borderRadius: 30.0,
                              padding: 3.sp,
                              onToggle: (val) {
                                model.pushNotification = val;
                                model.notifyListeners();
                              },
                            ), AppColor.textButtonColor),
                        30.h.sbH,
                        _buildSettingsTile('Support', 'Send Us Email', false, AppIcons.sendEmail, false, Container(), AppColor.textButtonColor),
                        30.h.sbH,
                        _buildSettingsTile('Other', 'About Us', false, AppIcons.aboutUs, false, Container(), AppColor.textButtonColor),
                        30.h.sbH,
                        _buildSettingsTile('', 'Terms of Service', false, AppImages.terms, false,Container(), AppColor.textButtonColor),
                        30.h.sbH,
                        _buildSettingsTile('', 'Privacy Policy', false, AppIcons.privacyPolicy, false, Container(), AppColor.textButtonColor),
                        30.h.sbH,
                        _buildSettingsTile('', 'Log out', false, AppIcons.logout, false, Container(), AppColor.dangerColor),
                        30.h.sbH,
                        _buildSettingsTile('', 'Delete Account', false, AppIcons.deleteAccount, false, Container(), AppColor.dangerColor),
                        30.h.sbH
                      ],
                    ),
                  ))),
        ));
  }
}
Widget _buildSettingsTile (String topLabel, String title, bool isSwitch, String icon, bool switchValue, Widget endWidget, Color textColor ){
  final BaseViewModel model = BaseViewModel();
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      if (topLabel != "" && topLabel != null)
        Padding(
          padding: EdgeInsets.only(bottom: 10.h),
          child: AppText(topLabel, size: 16.sp, weight: FontWeight.w500,),
        ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
        Row(
          children: [
            Image.asset(icon, height: 36.h,),
            10.w.sbW,
            AppText(title, color: textColor, weight: FontWeight.w500, size: 16.sp,),
          ],
        ),
        isSwitch? endWidget:
        Icon(Icons.keyboard_arrow_right_rounded, color: AppColor.textColor,)
      ],),
    ],
  );
}
