import 'package:bucx/pages/home/add_money/add_money_vm.dart';
import 'package:bucx/pages/home/profiles/add_bank_account/add_bank_account_vm.dart';
import 'package:bucx/pages/home/profiles/add_bank_account/recipient_bank.dart';
import 'package:bucx/pages/home/send_money/send_money_vm.dart';
import 'package:bucx/pages/home/send_money/send_to_us_account/send_to_US.dart';
import 'package:bucx/utils/app_buttons.dart';
import 'package:bucx/utils/app_images.dart';
import 'package:bucx/utils/back_button.dart';
import 'package:bucx/utils/constants.dart';
import 'package:bucx/utils/input.dart';
import 'package:bucx/utils/unfocus_widget.dart';
import 'package:bucx/utils/widget_extensions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qr_flutter/qr_flutter.dart';

import '../../../../utils/pallet.dart';
import '../../../base/base_ui.dart';


class AddBankAccount extends StatelessWidget {
  const AddBankAccount({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseView<AddBankAccountViewModel>(
        onModelReady: (model){
        },
        notDefaultLoading: true,
        builder: (context, model, child) {
          return RefreshIndicator(
            onRefresh: () async {
            },
            backgroundColor: AppColor.white,
            color: AppColor.primary,
            child: UnFocusWidget(
              child: Scaffold(
                backgroundColor: AppColor.white,
                body: Stack(
                  children: [
                    Form(
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
                          AppText('Add bank account', weight: FontWeight.w500, size: 22.sp, color: AppColor.textButtonColor,),
                          AppText('Enter local bank account to receive money'),
                          40.h.sbH,
                          AppInputField(
                            topLabel: 'Select Bank',
                            readOnly: true,
                            suffixIcon: IconButton(onPressed: (){}, icon:  Icon(CupertinoIcons.chevron_down)),
                          ),
                          20.h.sbH,
                          AppInputField(
                            topLabel: 'Account Number',
                            hintText: 'Enter account number',
              
                          ),
                          20.h.sbH,
                          AppInputField(
                            topLabel: 'Account Name',
                            hintText: 'Enter Account Name',
                          ),
                          150.h.sbH,
                        ],),
                      ),
                    ),
                    Positioned( bottom: 20.sp,left: 0, right: 0,
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 16.sp),
                          child: AppButton(
                              onPressed: (){
                                navigationService.navigateToWidget(RecipientBank());
                                }, title: 'Add Bank'),
                        ))
                  ],
                ),
              ),
            ),
          );
        });
  }
}
