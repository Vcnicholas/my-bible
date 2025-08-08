import 'package:bible/pages/home/bible/verse.dart';
import 'package:bible/utils/back_button.dart';
import 'package:bible/utils/constants.dart';
import 'package:bible/utils/pallet.dart';
import 'package:bible/utils/widget_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../base/base_ui.dart';
import 'bible_vm.dart';

class Chapters extends StatelessWidget {
  final String bookName;
  const Chapters({super.key, required this.bookName});

  @override
  Widget build(BuildContext context) {
    return BaseView<BibleViewModel>(
      onModelReady: (model) async{
        await model.loadBibleData();
        model.getChapters(bookName);
        },
      builder: (context, model, child) {
        final chapters = model.getChapters(bookName);
        return Scaffold(
          backgroundColor: AppColor.white,
          body: Container(
              margin: EdgeInsets.only(top: 15.sp, right: 15.sp, left: 15.sp),
              child: ListView(
                children: [
                  Row(
                    children: [
                      BackButtons(), 20.w.sbW,
                      AppText(bookName,
                        isBold: true,
                        size: 24.sp,
                        color: AppColor.primary,),
                    ],
                  ),
                  10.h.sbH,
                  // AppText(bookName,
                  //   isBold: true,
                  //   size: 24.sp,
                  //   color: AppColor.primary,),
                  40.h.sbH,
                  Wrap(
                    runSpacing: 12.h,
                    spacing: 12.w,
                    children:
                    List.generate(chapters.length, (i)
                    {
                      final chapter = chapters[i];
                     return GestureDetector(
                       onTap: (){
                         navigationService.
                             navigateToWidget(Verse(bookName: bookName, chapter: chapter));
                         print(chapter);
                       },
                       child: Container(
                        height: 68.sp,
                        width: 68.sp,
                        decoration: BoxDecoration(
                            border: Border.all(color: AppColor.black),
                          borderRadius: BorderRadius.circular(20.r)
                        ),
                        child: Center(child: AppText('$chapter', size: 18.sp,
                        color: AppColor.secondary,
                        weight: FontWeight.w500,)),
                                           ),
                     );}
                    )
                  ,)
                ],
              )),
        );
      },
    );
  }
}