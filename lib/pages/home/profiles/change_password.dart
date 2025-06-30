import 'package:bucx/pages/auth/sign_up/sign_up.vm.dart';
import 'package:bucx/pages/home/profiles/profiles_vm.dart';
import 'package:bucx/utils/snack_message.dart';
import 'package:bucx/utils/unfocus_widget.dart';
import 'package:bucx/utils/widget_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../utils/app_buttons.dart';
import '../../../utils/back_button.dart';
import '../../../utils/constants.dart';
import '../../../utils/input.dart';
import '../../../utils/pallet.dart';
import '../../base/base_ui.dart';

class ChangePassword extends StatelessWidget {
  const ChangePassword({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseView<ProfilesViewModel>(
        notDefaultLoading: true,
        onModelReady: (model) {},
        builder: (context, model, child) => Scaffold(
          backgroundColor: AppColor.white,
          body: UnFocusWidget(
            child: Stack(
              children: [
                Form(
                  key: model.formKey,
                  child: Container(
                      margin: EdgeInsets.only(top: 28.h.sp,right: 16.sp,left: 16.sp),
                      child: ListView(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              BackButtons(),
                            ],
                          ),
                          20.h.sbH,
                          AppText('Change Password', weight: FontWeight.w600, size: 22.sp,
                            color: AppColor.textButtonColor,),
                          5.h.sbH,
                          AppText('Change your password to something you remember',
                            size: 14.sp,
                            color: AppColor.textColor,),
                          20.h.sbH,
                          AppInputField(
                            topLabel: 'Old Password',
                            hintText: 'Enter old password',
                            autovalidateMode: model.autovalidateMode,
                            //controller: model.emailController,
                            validator: (val) {
                              //String validate = val!.replaceAll(RegExp(r"\s+"), "");
                            },
                          ),
                          20.h.sbH,
                          AppInputField(
                            topLabel: 'New Password',
                            hintText: 'Enter new Password',
                          ),
                          20.h.sbH,
                          AppInputField(
                            topLabel: 'Confirm Password',
                            hintText: 'Enter confirm password',
                            validator: (val){},
                          ),
                          300.h.sbH,
                        ],
                      )
                  ),
                ),
                Positioned(bottom: 20.h,
                  left: 0.sp,
                  right: 0.sp,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10.sp),
                    child: AppButton(
                        loading: model.isLoading,
                        onPressed: () async{
                          navigationService.goBack();
                        }, title: 'Continue'),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
