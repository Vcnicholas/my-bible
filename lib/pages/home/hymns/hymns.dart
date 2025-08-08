import 'package:bible/pages/home/hymns/hymns_vm.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../utils/pallet.dart';
import '../../base/base_ui.dart';

class Hymns extends StatelessWidget {
  const Hymns({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseView<HymnsViewModel>(
      onModelReady: (model) async {
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
                child: ListView(),
              ),
            ),
          ),
        );
      },
    );
  }
}
