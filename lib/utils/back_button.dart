import 'package:bucx/utils/pallet.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BackButtons extends StatelessWidget {
  final VoidCallback? onPressed;

  const BackButtons({super.key, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed ?? () => Navigator.pop(context),
      child: CircleAvatar(
        backgroundColor: AppColor.grey1,
        radius: 22.sp,
        child:  Icon(
          CupertinoIcons.arrow_left,
          size: 22.sp,
          color: AppColor.blacks, // Icon color
        ),
      ),
    );
  }
}