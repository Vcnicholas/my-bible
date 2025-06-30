import 'package:bible/pages/home/profiles/profiles_vm.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../utils/pallet.dart';
import '../../base/base_ui.dart';

class Profiles extends StatelessWidget {
  const Profiles({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseView<ProfilesViewModel>(
        notDefaultLoading: true,
        onModelReady: (model) {
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
                    child: ListView()
                  ))),
        ));
  }
}
