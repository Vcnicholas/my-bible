import 'package:bucx/utils/pallet.dart';
import 'package:bucx/utils/widget_extensions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'constants.dart';

class ScreenKeyboard extends StatefulWidget {
  var viewModel;
  final String availableBalance;

  ScreenKeyboard({
    super.key,
    required this.viewModel,
    required this.availableBalance,
  });

  @override
  State<ScreenKeyboard> createState() => _ScreenKeyboardState();
}

class _ScreenKeyboardState extends State<ScreenKeyboard> {
  final keys = const [
    '1', '2', '3',
    '4', '5', '6',
    '7', '8', '9',
    '.', '0', '⌫'
  ];

  void _onKeyPressed(String key) {
    String value = widget.viewModel.amount;

    if (key == '⌫') {
      if (value.isNotEmpty) {
        value = value.substring(0, value.length - 1);
        widget.viewModel.updateAmount(value);
      }
      return;
    }

    if (key == '.' && value.contains('.')) return;
    String newValue = value + key;

    if (newValue == '.') return;

    if (RegExp(r'^\d{0,4}(\.\d{0,2})?$').hasMatch(newValue)) {
      final parsed = double.tryParse(newValue);
      if (parsed != null && parsed <= 9999.99) {
        widget.viewModel.updateAmount(newValue);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppText('Available Balance: \$${widget.availableBalance}'),
        GridView.builder(
          shrinkWrap: true,
          itemCount: keys.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            childAspectRatio: 2.sp,
            crossAxisSpacing: 10.sp,
            mainAxisSpacing: 10.sp,
          ),
          itemBuilder: (context, index) {
            final key = keys[index];
            return GestureDetector(
              onTap: () => _onKeyPressed(key),
              child: Container(
                height: 76.h,
                width: 126.w,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12.r),
                  color: AppColor.grey,
                ),
                child: Center(
                  child: key == '⌫'
                      ? const Icon(Icons.backspace_outlined)
                      : AppText(
                    key,
                    size: 32.sp,
                    weight: FontWeight.w500,
                    color: AppColor.textButtonColor,
                  ),
                ),
              ),
            );
          },
        ),
        20.sp.sbH,
      ],
    );
  }
}
