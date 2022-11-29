import 'package:chat/Services/firebaseServices/firebaseNotiication/notificationService.dart';
import 'package:chat/UI/SplashScreen/splashScreen.dart';
import 'package:chat/constants/app_colors.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:overlay_support/overlay_support.dart';
//import 'package:sizer/sizer.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  NotificationService().registerNotification();
  runApp(const MyApp());
}

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return OverlaySupport(
      child: ScreenUtilInit(
        // designSize: MediaQuery.of(context).size,
        builder: (context, child) {
          return GetMaterialApp(
            title: 'WeChat',
            debugShowCheckedModeBanner: false,
            navigatorKey: navigatorKey,
            theme: ThemeData(
              primarySwatch: Palette.color,
              //  scaffoldBackgroundColor: Colors.grey,
            ),
            home: const Splash(),
          );
        },
      ),
    );
  }
}
