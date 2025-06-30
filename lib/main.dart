import 'package:bible/utils/app_strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_storage/get_storage.dart';
import 'package:oktoast/oktoast.dart';

import 'data/core/config.dart';
import 'data/services/navigation_service.dart';
import 'locator.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  InAppWebViewController.setWebContentsDebuggingEnabled(true);

  //initialise local storage
  await GetStorage.init();

  //setup different deployment environment
  Config.appFlavor = Flavor.DEVELOPMENT;

  //setup dependency injector
  setupLocator();

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return OKToast(
      child: ScreenUtilInit(
        designSize: Size(430, 932),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (BuildContext context, Widget? child) {
          return MaterialApp(
            navigatorKey: getIt<NavigationService>().navigatorKey,
            scaffoldMessengerKey: getIt<NavigationService>().snackBarKey,
            debugShowCheckedModeBanner: false,
            title: AppStrings.appName,
            theme: ThemeData(primarySwatch: Colors.blue),
            onGenerateRoute: AppRouter.generateRoute,
             //home:  CustomCheckboxDemo(),
             home: const SplashScreen(),
              // home: const BottomNav(selectedIndex: 0,),
            //home:   TransactionBreakdown(),
            //home: Demo(),
            //home: const BottomNav(selectedIndex: 0,),
          );
        },
      ),
    );
  }
}
