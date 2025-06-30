import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../utils/font_manager.dart';
import '../../utils/pallet.dart';
import '../../utils/widget_extensions.dart';
import '../base/base_ui.dart';
import 'home_vm.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseView<HomeViewModel>(
      onModelReady: (model) async {
        model.onInit();
        model.loadCachedBalance();
        model.loadCachedKycStatus();
        model.getCachedHistory();
        await model.getWalletBalance();
        model.getKycLinks();
        model.getWalletDetails();
        await model.getTransactionHistory();
      },
      notDefaultLoading: true,
      builder: (context, model, child) {
        return RefreshIndicator(
          onRefresh: () async {
            model.loadCachedKycStatus();
            await model.getWalletBalance();
            await model.getKycLinks();
            await model.getTransactionHistory();
          },
          backgroundColor: AppColor.white,
          color: AppColor.primary,
          child: Scaffold(
            key: model.key,
            backgroundColor: AppColor.white,
            body: Form(
              key: model.formKey,
              child: Container(
                margin: EdgeInsets.only(top: 30.sp, right: 15.sp, left: 15.sp),
                child: ListView(),
              ),
            ),
          ),
        );
      },
    );
  }
}
