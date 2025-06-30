import 'package:bucx/pages/home/add_money/add_money_vm.dart';
import 'package:bucx/pages/home/send_money/send_money_vm.dart';
import 'package:bucx/pages/home/send_money/send_to_us_account/send_to_US.dart';
import 'package:bucx/utils/appBottomSheet.dart';
import 'package:bucx/utils/app_buttons.dart';
import 'package:bucx/utils/app_images.dart';
import 'package:bucx/utils/back_button.dart';
import 'package:bucx/utils/constants.dart';
import 'package:bucx/utils/input.dart';
import 'package:bucx/utils/widget_extensions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qr_flutter/qr_flutter.dart';

import '../../../../utils/pallet.dart';
import '../../../base/base_ui.dart';

class RecipientBank extends StatelessWidget {
  const RecipientBank({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseView<AddMoneyViewModel>(
        onModelReady: (model){
          model.setAddress();
        },
        notDefaultLoading: true,
        builder: (context, model, child) {
          return RefreshIndicator(
            onRefresh: () async {
            },
            backgroundColor: AppColor.white,
            color: AppColor.primary,
            child: Scaffold(
              backgroundColor: AppColor.white,
              body: Form(
                key: model.formKey,
                child: Container(
                  margin: EdgeInsets.only(top: 30.sp, right: 15.sp, left: 15.sp),
                  child: ListView(children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        BackButtons(),
                      ],),
                    40.h.sbH,
                    AppText('Recipient bank', weight: FontWeight.w500, size: 22.sp, color: AppColor.textButtonColor,),
                    AppText('This is where your money will be sent to in Naira'),
                    40.h.sbH,
                    Container(
                      height: 70.h,
                      width: width(context),
                      decoration: BoxDecoration(
                      border: Border.all(color: AppColor.border),
                      borderRadius: BorderRadius.circular(16.r)
                    ),
                      padding: EdgeInsets.symmetric(horizontal: 10.w),
                      child:
                      Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [Row(children: [Row(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                color: AppColor.grey,
                              borderRadius: BorderRadius.circular(9.r)
                            ),
                            height: 50.h, width: 52.w,
                            child: Center(
                              child: Image.asset(
                                AppIcons.account, height: 26.h,),),),
                          10.w.sbW,
                          Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                          AppText('Emmanuel Jackson', weight: FontWeight.w500, size: 16.sp, color: AppColor.textButtonColor,),
                          Row(children: [
                            AppText('Opay'), 5.w.sbW,
                            CircleAvatar(radius: 1.sp, backgroundColor: AppColor.textColor,), 5.w.sbW,
                            AppText('8024201030')
                          ],)
                        ],)],
                      )],),
                        InkWell(
                          onTap: (){
                            AppBottomSheets.showBottomSheet(
                                context: context,
                                initialSize: .3,
                                maxSize: .3,
                                minSize: .3,
                                child: Container(
                                  child: Column(children: [
                                    26.h.sbH,
                                    AppText('Delete bank', weight: FontWeight.w500, size: 20.sp, color: AppColor.textButtonColor,),
                                    10.h.sbH,
                                    AppText('Are you sure yiou want to delete this bank account?\nThis action cannot be undone',
                                    size: 16.sp,
                                    align: TextAlign.center,),
                                    100.h.sbH,
                                    Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                      GestureDetector(
                                        onTap: (){
                                          navigationService.goBack();
                                        },
                                        child: Container(
                                          height: 56.h,
                                            width: 192.w,
                                          decoration: BoxDecoration(
                                            color: AppColor.buttonBgGrey,
                                            borderRadius: BorderRadius.circular(100.r)
                                          ),
                                          child: Center(child: AppText('Cancel', color: AppColor.textButtonColor, size: 16.sp, weight: FontWeight.w500,),),
                                        ),
                                      ),
                                      GestureDetector(
                                        onTap: (){
                                          navigationService.goBack();
                                          navigationService.goBack();
                                        },
                                        child: Container(
                                          height: 56.h,
                                          width: 192.w,
                                          decoration: BoxDecoration(
                                            color: AppColor.dangerColor,
                                            borderRadius: BorderRadius.circular(100.r)
                                          ),
                                          child: Center(child: AppText('Delete', color: AppColor.white, size: 16.sp, weight: FontWeight.w500,),),
                                        ),
                                      )
                                    ],)
                                  ],),
                                ));
                          },
                            child: Image.asset(AppIcons.delete, height: 30.sp,))
                     ],),
                    )
                  ],),
                ),
              ),
            ),
          );
        });
  }
}
