import 'package:bible/pages/home/bible/bible.dart';
import 'package:bible/pages/home/bible/bible_vm.dart';
import 'package:bible/pages/home/bible/books.dart';
import 'package:bible/utils/back_button.dart';
import 'package:bible/utils/constants.dart';
import 'package:bible/utils/widget_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../utils/pallet.dart';
import '../../base/base_ui.dart';


class Verse extends StatelessWidget {
  const Verse({super.key, required this.bookName, required this.chapter});
  final String bookName;
  final int chapter;

  @override
  Widget build(BuildContext context) {
    return BaseView<BibleViewModel>(
      onModelReady: (model) async {
        model.loadBibleData();
      },
      notDefaultLoading: true,
      builder: (context, model, child) {
        final verses = model.getVerses(bookName, chapter);
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
                child: ListView(
                  children: [
                    Row(
                      children: [
                        BackButtons(),
                      ],
                    ),
                      20.h.sbH,
                      Wrap(
                        runSpacing: 12.h,
                        spacing: 12.w,
                        children:
                        List.generate(verses.length, (i)
                        {
                          final verse = verses[i];
                          return GestureDetector(
                            onTap: (){
                              navigationService.
                                  navigateToWidget(Bible(bookName: bookName, chapter: chapter, jumpToVerse: verse.verse));
                              print(verse.text);
                            },
                            child: Container(
                              height: 68.sp,
                              width: 68.sp,
                              decoration: BoxDecoration(
                                  border: Border.all(color: AppColor.black),
                                  borderRadius: BorderRadius.circular(20.r)
                              ),
                              child: Center(child: AppText(verse.verse.toString(), size: 18.sp,
                                color: AppColor.secondary,
                                weight: FontWeight.w500,)),
                            ),
                          );}
                        )
                        ,)
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
