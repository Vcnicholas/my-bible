import 'package:bible/pages/home/bible/bible_vm.dart';
import 'package:bible/utils/back_button.dart';
import 'package:bible/utils/constants.dart';
import 'package:bible/utils/widget_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../utils/pallet.dart';
import '../../base/base_ui.dart';

class Bible extends StatelessWidget {
  const Bible({
    super.key,
    required this.bookName,
    required this.chapter,
    required this.jumpToVerse,
  });

  final String bookName;
  final int chapter;
  final int? jumpToVerse;

  @override
  Widget build(BuildContext context) {
    final scrollController = ScrollController();

    return BaseView<BibleViewModel>(
      onModelReady: (model) async {
        await model.loadBibleData();
        if (jumpToVerse != null) {
          await Future.delayed(const Duration(milliseconds: 300));
          final index = model
              .getVerses(bookName, chapter)
              .indexWhere((v) => v.verse == jumpToVerse);
          if (index != -1) {
            scrollController.jumpTo(index * 72.0);
          }
        }
      },
      notDefaultLoading: true,
      builder: (context, model, child) {
        final verses = model.getVerses(bookName, chapter);

        return RefreshIndicator(
          onRefresh: () async {},
          backgroundColor: AppColor.white,
          color: AppColor.primary,
          child: Scaffold(
            backgroundColor: AppColor.white,
            body: Form(
              key: model.formKey,
              child: Container(
                margin: EdgeInsets.only(top: 60.sp, right: 15.sp, left: 15.sp),
                child: Column(
                  children: [
                    Row(
                      children: [
                        BackButtons(),
                        5.w.sbW,
                        AppText('$bookName   $chapter', size: 18.sp, color: AppColor.primary,
                        weight: FontWeight.w500,)
                      ],
                    ),
                    5.sp.sbH,
                    Expanded(
                      child: ListView.builder(
                        controller: scrollController,
                        itemCount: verses.length,
                        itemBuilder: (context, index) {
                          final verse = verses[index];
                          return Container(
                            margin: EdgeInsets.symmetric(vertical: 5.sp),
                            padding: EdgeInsets.all(12.sp),
                            decoration: BoxDecoration(
                              color: jumpToVerse == verse.verse
                                  ? AppColor.primary1.withOpacity(0.3)
                                  : AppColor.white,
                              borderRadius: BorderRadius.circular(10.r),
                              border: Border.all(color: AppColor.primary.withOpacity(0.1)),
                            ),
                            child: AppText(
                              '${verse.verse}. ${verse.text}',
                              style: GoogleFonts.jost(
                                fontSize: 16.sp
                              )
                            ),
                          );
                        },
                      ),
                    ),
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
