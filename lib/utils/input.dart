import 'package:bucx/utils/pallet.dart';
import 'package:bucx/utils/widget_extensions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../utils/font_manager.dart';
import '../utils/style_manager.dart';


class AppInputField extends StatelessWidget {
  final List<TextInputFormatter>? inputFormatters;
  final AutovalidateMode? autovalidateMode;
  final TextAlign? textAlign;
  final TextInputType? keyBoardType;
  final String? Function(String? val)? validationCallback;
  final String? Function(String? val)? onSaved;
  final void Function()? onEdittingComplete;
  final String? formError;
  final String label;
  final String topLabel;
  final String? hintText;
  final FocusNode? focusnode;
  final TextInputAction? textInputAction;
  final TextEditingController? controller;
  final String? message;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final bool? obscureText;
  final Function()? clearForm;
  final Function()? onTap;
  final Function(String)? onChanged;
  final EdgeInsetsGeometry? contentPadding;
  final int? maxLength;
  final int? maxLines;
  final Color? color;
  final double? height;
  final bool? enabled;
  final InputBorder? border;
  final InputBorder? enabledBorder;
  final InputBorder? focusedBorder;
  final Color? fillColor;
  final Color? hintColor;
  final bool? showCursor;
  final bool readOnly;
  final Widget? labelRightItem;
  final Widget? topLabelRightItem;
  final TextStyle? labelStyle;
  final TextStyle? topLabelStyle;
  final String? initialValue;
  final String? Function(String?)? validator;
  final TextStyle? style;
  final FloatingLabelBehavior? floatingLabelBehavior;

  const AppInputField({
    Key? key,
    this.autovalidateMode,
    this.style,
    this.inputFormatters,
    this.textAlign,
    this.keyBoardType,
    this.onEdittingComplete,
    this.validationCallback,
    this.onSaved,
    this.color,
    this.message,
    this.hintText,
    this.label = '',
    this.topLabel = '',
    this.formError,
    this.focusnode,
    this.textInputAction,
    this.controller,
    this.clearForm,
    this.height,
    this.prefixIcon,
    this.suffixIcon,
    this.obscureText,
    this.onChanged,
    this.contentPadding,
    this.onTap,
    this.maxLength,
    this.maxLines = 1,
    this.enabled = true,
    this.border,
    this.enabledBorder,
    this.focusedBorder,
    this.fillColor,
    this.validator,
    this.hintColor,
    this.showCursor,
    this.readOnly = false,
    this.labelRightItem,
    this.topLabelRightItem,
    this.labelStyle,
    this.topLabelStyle,
    this.initialValue,
    this.floatingLabelBehavior,

  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final fontSize = style?.fontSize == null
        ? FontSize.s14 / MediaQuery.textScaleFactorOf(context)
        : style!.fontSize! / MediaQuery.textScaleFactorOf(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        if (topLabel != "")
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    textScaleFactor: 1.0,
                    topLabel,
                    style: topLabelStyle ??
                        getRegularStyle(
                          fontSize: FontSize.s14,
                          color: AppColor.textButtonColor
                        ),
                  ),
                  if (topLabelRightItem != null) labelRightItem!
                ],
              ),
            10.sp.sbH
            ],
          ),
        TextFormField(
          style: getRegularStyle()
              .copyWith()
              .copyWith(fontSize: fontSize),
          keyboardType: keyBoardType,
          obscureText: obscureText ?? false,
          validator: validator,
          readOnly: readOnly,
          enabled: enabled,
          autovalidateMode: autovalidateMode,
          textInputAction: TextInputAction.next,
          controller: controller,
          onChanged: onChanged,
          onTap: onTap,
          onEditingComplete: onEdittingComplete,
          maxLines: maxLines??1,
          cursorColor: AppColor.textColor,
          decoration: InputDecoration(
            fillColor:AppColor.white,
            filled: true,
            contentPadding:
             EdgeInsets.only(bottom: 15.sp, left: 10, right: 10, top: 5),
            prefixIcon: prefixIcon,
            suffixIcon: suffixIcon,
            label: Text(
              textScaleFactor: 1.0,
              label,
              style: getLightStyle(fontSize: FontSize.s14).copyWith(),
            ),
            hintStyle: TextStyle()
                .copyWith(fontSize: fontSize),
            hintText: hintText,
            enabledBorder: OutlineInputBorder(
              borderRadius: const BorderRadius.all(Radius.circular(10)),
              borderSide: BorderSide(
                color: color ?? AppColor.inactive,
                width: 1.5,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: const BorderRadius.all(Radius.circular(10)),
              borderSide: BorderSide(
                color: color ?? AppColor.active,
                width: 1.5,
              ),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: const BorderRadius.all(Radius.circular(10)),
              borderSide: BorderSide(
                color: color ?? AppColor.grey,
                width: 1.5,
              ),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: const BorderRadius.all(Radius.circular(10)),
              borderSide: BorderSide(
                color: color ?? AppColor.errorColor,
                width: 1.5,
              ),
            ),
            floatingLabelBehavior:
            floatingLabelBehavior ?? FloatingLabelBehavior.auto,
          ),
        ),
      ],
    );
  }
}
class AppSearchField extends StatelessWidget {
  final List<TextInputFormatter>? inputFormatters;
  final AutovalidateMode? autovalidateMode;
  final TextAlign? textAlign;
  final TextInputType? keyBoardType;
  final String? Function(String? val)? validationCallback;
  final String? Function(String? val)? onSaved;
  final void Function()? onEdittingComplete;
  final String? formError;
  final String label;
  final String topLabel;
  final String? hintText;
  final FocusNode? focusnode;
  final TextInputAction? textInputAction;
  final TextEditingController? controller;
  final String? message;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final bool? obscureText;
  final Function()? clearForm;
  final Function()? onTap;
  final Function(String)? onChanged;
  final EdgeInsetsGeometry? contentPadding;
  final int? maxLength;
  final int? maxLines;
  final Color? color;
  final double? height;
  final bool? enabled;
  final InputBorder? border;
  final InputBorder? enabledBorder;
  final InputBorder? focusedBorder;
  final Color? fillColor;
  final Color? hintColor;
  final bool? showCursor;
  final bool readOnly;
  final Widget? labelRightItem;
  final Widget? topLabelRightItem;
  final TextStyle? labelStyle;
  final TextStyle? topLabelStyle;
  final String? initialValue;
  final String? Function(String?)? validator;
  final TextStyle? style;
  final FloatingLabelBehavior? floatingLabelBehavior;

  const AppSearchField({
    Key? key,
    this.autovalidateMode,
    this.style,
    this.inputFormatters,
    this.textAlign,
    this.keyBoardType,
    this.onEdittingComplete,
    this.validationCallback,
    this.onSaved,
    this.color,
    this.message,
    this.hintText,
    this.label = '',
    this.topLabel = '',
    this.formError,
    this.focusnode,
    this.textInputAction,
    this.controller,
    this.clearForm,
    this.height,
    this.prefixIcon,
    this.suffixIcon,
    this.obscureText,
    this.onChanged,
    this.contentPadding,
    this.onTap,
    this.maxLength,
    this.maxLines = 1,
    this.enabled = true,
    this.border,
    this.enabledBorder,
    this.focusedBorder,
    this.fillColor,
    this.validator,
    this.hintColor,
    this.showCursor,
    this.readOnly = false,
    this.labelRightItem,
    this.topLabelRightItem,
    this.labelStyle,
    this.topLabelStyle,
    this.initialValue,
    this.floatingLabelBehavior,

  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final fontSize = style?.fontSize == null
        ? FontSize.s14 / MediaQuery.textScaleFactorOf(context)
        : style!.fontSize! / MediaQuery.textScaleFactorOf(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        if (topLabel != "")
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    textScaleFactor: 1.0,
                    topLabel,
                    style: topLabelStyle ??
                        getRegularStyle(
                          fontSize: FontSize.s14,
                        ),
                  ),
                  if (topLabelRightItem != null) labelRightItem!
                ],
              ),
              10.sp.sbH
            ],
          ),
        Container(
          height: height ?? 48.h,
          width: width(context),
          decoration:
          BoxDecoration(borderRadius: BorderRadius.circular(100.r),
          color: color?? AppColor.grey1),
          child: TextFormField(
            style: getRegularStyle()
                .copyWith()
                .copyWith(fontSize: fontSize),
            keyboardType: keyBoardType,
            obscureText: obscureText ?? false,
            validator: validator,
            readOnly: readOnly,
            enabled: enabled,
            autovalidateMode: autovalidateMode,
            textInputAction: TextInputAction.next,
            controller: controller,
            onChanged: onChanged,
            onTap: onTap,
            onEditingComplete: onEdittingComplete,
            maxLines: maxLines??1,
            cursorColor: AppColor.textColor,
            decoration: InputDecoration(
              fillColor: AppColor.grey1,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(100.r),
                borderSide: BorderSide.none
              ),
              filled: true,
              contentPadding:
              EdgeInsets.only(bottom: 15.h, left: 10, right: 10, top: 5.h),
              prefixIcon: prefixIcon ?? Icon(CupertinoIcons.search),
              suffixIcon: suffixIcon,
              label: Text(
                textScaleFactor: 1.0,
                label,
                style: getLightStyle(fontSize: FontSize.s14).copyWith(),
              ),
              hintStyle: TextStyle()
                  .copyWith(fontSize: fontSize),
              hintText: hintText ?? 'Search',
          
              floatingLabelBehavior:
              floatingLabelBehavior ?? FloatingLabelBehavior.auto,
            ),
          ),
        ),
      ],
    );
  }
}
