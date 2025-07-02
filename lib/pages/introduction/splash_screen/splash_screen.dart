import 'package:bible/pages/introduction/splash_screen/splash.vm.dart';
import 'package:bible/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../utils/app_images.dart';
import '../../../utils/pallet.dart';
import '../../../utils/widget_extensions.dart';
import '../../base/base_ui.dart';
import 'package:collection/collection.dart'; // for mapIndexed
import 'package:flutter/painting.dart';       // for Characters

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseView<SplashViewModel>(
      onModelReady: (model) {
        model.splash();
      },
      builder: (context, model, child) => Scaffold(
        backgroundColor: AppColor.primary,
        body: Container(
          padding: EdgeInsets.symmetric(horizontal: 30.sp),
          height: height(context),
          width: width(context),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                buildAnimatedText("Bible"),
              ],
            ),
          ),
        ),
      ),
    );
  }

  /// Helper function for animated text
  Widget buildAnimatedText(String text) {
    final characters = text.characters.toList();

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: characters.mapIndexed((i, char) {
        return AppText(
          char,
          size: 30.sp,
          color: AppColor.white,
        )
            .animate(delay: (i * 450).ms)
            .fadeIn(duration: 800.ms)
            .scaleXY(end: 1.2, duration: 500.ms, curve: Curves.easeOutBack);
      }).toList(),
    );
  }
}
