// ignore_for_file: must_be_immutable
import 'package:bible/utils/pallet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'constants.dart';

enum ButtonType { fill, outline, text }

class AppButton extends StatelessWidget {
  const AppButton({
    super.key,
    this.borderRadius = 6.0,
    this.border,
    this.fontSize = 13.0,
    this.trailingIconSpace = 4.0,
    required this.onPressed,
    this.buttonBgColor,
    this.buttonTextColor = AppColor.white,
    required this.title,
    this.leadingIcon,
    this.trailingIcon,
    this.leadingIconColor = AppColor.white,
    this.trailingIconColor = AppColor.white,
    this.busy = false,
    this.loadingColor,
    this.disabled,
    this.height,
    this.padding,
    this.loading,
    this.buttonType = ButtonType.fill,
    this.borderColor
  });

  final double borderRadius;
  final double fontSize;
  final double? height;
  final String title;
  final bool busy;
  final Border? border;
  final Function onPressed;
  final Color? buttonBgColor;
  final Color? loadingColor;
  final Color? buttonTextColor;
  final Color? leadingIconColor;
  final Color? trailingIconColor;
  final bool? disabled;
  final ButtonType? buttonType;
  final String? leadingIcon;
  final String? trailingIcon;
  final double trailingIconSpace;
  final EdgeInsets? padding;
  final bool? loading;
  final Color? borderColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 56.h,
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: [
          AppColor.primary1,
          buttonBgColor?? AppColor.primary, ],
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter),
          borderRadius: BorderRadius.circular(100.r),
          //color: Colors.red,
          border: Border.all(
              width: 1,
              color: buttonType == ButtonType.fill
                  ? Colors.transparent
                  : borderColor??
              AppColor.grey)),
      child: MaterialButton(
          elevation: 0,
          minWidth: MediaQuery.of(context).size.width,
          height: height ?? 56.h,
          onPressed:
              ((disabled != null && disabled!) || loading != null && loading!)
                  ? null
                  : () => onPressed(),
          color: buttonType == ButtonType.outline
              ? buttonBgColor?? AppColor.buttonBgGrey
              : buttonType == ButtonType.fill
                  ? Colors.transparent
                  : loading != null && loading!
                      ? Colors.grey
                      : Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              100.r
            ),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 0.sp),
            child: loading != null && loading!
                ? customProgressIndicator()
                : Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      if (leadingIcon != null)
                        Container(
                          margin: EdgeInsets.only(right: 10.sp),
                          child: Image.asset(
                            leadingIcon!,
                            height: 24.sp,
                            width: 24.sp,
                          ),
                        ),
                      loading != null && loading!
                          ? const AppText('')
                          : AppText(
                              title,
                              size: 16.sp,
                              align: TextAlign.center,
                              color: buttonTextColor ?? AppColor.white,
                        weight: FontWeight.w500,
                            ),
                      if (trailingIcon != null)
                        SizedBox(width: trailingIconSpace),
                      if (trailingIcon != null)
                        Image.asset(
                          trailingIcon!,
                          height: 20.sp,
                          width: 20.sp,
                        ),
                    ],
                  ),
          )),
    );
  }
}


