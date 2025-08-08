import 'package:bible/pages/home/dashboard/dashboard.dart';
import 'package:bible/utils/dimens.dart';
import 'package:bible/utils/widget_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../utils/app_buttons.dart';
import '../../../utils/app_images.dart';
import '../../../utils/app_strings.dart';
import '../../../utils/constants.dart';
import '../../../utils/pallet.dart';
import '../../base/base_ui.dart';
import '../onboarding/onboarding_vm.dart';

class Welcome extends StatelessWidget {
  const Welcome({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseView<OnboardingViewModel>(
        notDefaultLoading: true,
        onModelReady: (model) {},
        builder: (context, model, child) => Scaffold(
          backgroundColor: AppColor.white,
          body: Container(
            padding: EdgeInsets.symmetric(
                horizontal: 0.sp
            ),
            child: Stack(
              children: [
                Positioned(top: 0.sp, right: 0.sp, left: 0.sp,
                    child: Image.asset(AppImages.bible, height: height(context) * 0.9, fit: BoxFit.fill,)),
                Positioned(
                    bottom: 0.h,
                    left: 0.sp,
                    right: 0.sp,

                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 15.sp),
                      height: 200.h,
                      decoration: BoxDecoration(
                        color: AppColor.white,
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(20.r),
                          topLeft: Radius.circular(20.r)
                        )
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          AppText('Welcome Back', size: 24.sp, color: AppColor.secondary, isBold: true,),
                          15.h.sbH,
                          AppButton(onPressed: (){
                            navigationService.
                            navigateToWidget(BottomNav(selectedIndex: 0));
                          }, title: 'Continue to Bible'),
                          10.h.sbH,
                          AppButton(onPressed: (){
                          }, 
                              leadingIcon: AppIcons.hymns,
                              buttonTextColor: AppColor.primary,
                              border: Border.all(color: AppColor.primary),
                              buttonBgColor: AppColor.white,
                              buttonType: ButtonType.outline,
                              title: 'Continue to Hymns'),
                          15.h.sbH,
                        ],),
                    ))
              ],
            ),
          ),
        ));
  }
}
