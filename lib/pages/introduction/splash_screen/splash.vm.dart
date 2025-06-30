
import 'package:bucx/data/core/storage/get_boxes.dart';
import 'package:flutter/cupertino.dart';
import 'package:get_storage/get_storage.dart';
import '../../auth/sign_in/sign_in.dart';
import '../../auth/sign_up/terms_of_service.dart';
import '../../base/base.vm.dart';
import '../../home/dashboard/dashboard.dart';
import '../onboarding/onboarding_view.dart';

class SplashViewModel extends BaseViewModel {
  late  int currentPageIndex = 0;
  final pageController = PageController(initialPage: 0);

  bool getStarted =false;
  // Delay Splash Screen for 4 sec
splash() async {
    final box = GetStorage();
    String? userToken = box.read(Boxes.userToken);
    await Future.delayed(const Duration(milliseconds: 4000), () {});
    //navigationService.navigateToReplaceWidget(const OnboardingView());
    if(userToken==null){
      navigationService.navigateToReplaceWidget(const OnboardingView());
    }else{
      navigationService.navigateToReplaceWidget(const BottomNav(selectedIndex: 0));
      // navigationService.navigateToReplace(AppRoutes.driver);
      //
    }
  }


}
// enum TRANSFER_TYPE {
//   BUCXTOBUXC = "bucxtobucx",
// FIATTOTOKEN = "fiattotoken",
// TOKENTOFIAT = "tokentofiat",
// TOKENTOTOKEN = "tokentotoken",
//
// }