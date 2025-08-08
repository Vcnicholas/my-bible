import 'package:bible/pages/home/bible/bible_vm.dart';
import 'package:bible/pages/home/bible/chapters.dart';
import 'package:bible/utils/app_buttons.dart';
import 'package:bible/utils/constants.dart';
import 'package:bible/utils/widget_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../utils/pallet.dart';
import '../../base/base_ui.dart';

class Books extends StatelessWidget {
  const Books({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseView<BibleViewModel>(
      onModelReady: (model) => model.loadBibleData(),
      notDefaultLoading: true,
      builder: (context, model, child) {
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
                    AppText('Bible', size: 24.sp, isBold: true,),
                    20.h.sbH,
                    Row(children: [
                      GestureDetector(
                        onTap: (){
                          model.setTestament('Old Testament');
                        },
                        child: Container(
                          height: 48.sp,
                          width: 200.w,
                          decoration: BoxDecoration(
                            color: AppColor.white,
                            borderRadius: BorderRadius.circular(
                              6.r
                            ),
                            border: Border(bottom:
                            BorderSide(color: model.testament == 'Old Testament'?
                            AppColor.primary: AppColor.white, width: 3.sp))
                          ),
                          child: Center(child:
                            AppText('Old Testaments', size: 14.sp,
                              color: AppColor.primary, weight: FontWeight.w800,),),
                        ),
                      ),
                      GestureDetector(
                        onTap: (){
                          model.setTestament('New Testament');
                        },
                        child: Container(
                          height: 48.sp,
                          width: 200.w,
                          decoration: BoxDecoration(
                              color: AppColor.white,
                              borderRadius: BorderRadius.circular(
                                  6.r
                              ),
                              border: Border(bottom:
                              BorderSide(color: model.testament == 'New Testament'?
                              AppColor.primary: AppColor.white, width: 3.sp))
                          ),
                          child: Center(child:
                          AppText('New Testaments', color: AppColor.primary,
                            weight: FontWeight.w800,),),
                        ),
                      ),
                    ],),
                    20.sp.sbH,
                    if (model.testament == 'Old Testament')
                    Column(
                      children:
                        List.generate(model.oldTestamentBooks.length,
                                (i)=> Row(
                                  children: [
                                    GestureDetector(
                                      onTap: (){
                                        navigationService.navigateToWidget(
                                            Chapters(bookName: model.oldTestamentBooks[i])
                                        );
                                      },
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: AppText(model.oldTestamentBooks[i], size: 15.sp,),
                                      ),
                                    ),
                                  ],
                                ))),
                    if (model.testament == 'New Testament')
                    Column(
                        children:
                        List.generate(model.newTestamentBooks.length,
                                (i)=> Row(
                              children: [
                                GestureDetector(
                                  onTap: (){
                                    navigationService.navigateToWidget(
                                      Chapters(bookName: model.newTestamentBooks[i])
                                    );
                                    print(model.newTestamentBooks[i]);
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: AppText(model.newTestamentBooks[i], size: 15.sp,),
                                  ),
                                ),
                              ],
                            )))
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
