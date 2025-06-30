import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../utils/constants.dart';

class ShowDialogWidget extends StatelessWidget {
  const ShowDialogWidget({
    this.icon,
    this.title,
    this.message,
    this.actions = const [],
    super.key,
  });

  final Widget? icon;
  final String? title;
  final String? message;
  final List<Widget> actions;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      icon: icon,
      title: title == null
          ? null
          :  AppText(
        title!,
        size: 16.sp,
        align: TextAlign.center,
        weight: FontWeight.w500,
        isBold: true,
      ),
      content: message == null
          ? null
          : AppText(
        message!,
        size: 12.sp,
        align: TextAlign.center,
        weight: FontWeight.w400,
      ),
      actionsAlignment: MainAxisAlignment.center,
      actionsOverflowButtonSpacing: 8.0,
      actions: actions,
    );
  }
}