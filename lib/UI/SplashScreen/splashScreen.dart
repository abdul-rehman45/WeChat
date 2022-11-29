import 'dart:async';
import 'package:chat/UI/AuthScreens/loginScreen.dart';
import 'package:chat/constants/app_colors.dart';
import 'package:chat/constants/constants.dart';
import 'package:chat/helper/sharedPreference.dart';
import 'package:flutter/material.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  final bool _isLogin = false;
  @override
  void initState() {
    super.initState();
    _getStoredDate();
  }

  void _startTimer() async {
    Timer(const Duration(seconds: 5), () async {
      try {
        String user = await Preferences().getStringvalue("username");

        AppGlobals.username = user;
        if (mounted) {
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => const LoginScreen(),
              ));
        }
      } catch (e) {
        rethrow;
      }
    });

    // Get.offAll(
    //       () => _isLogin == true ? Home() : Registration(),
    //     )
  }

  _getStoredDate() async {
    _startTimer();
  }

  @override
  Widget build(BuildContext context) {
    // AppGlobals.screenHeight = MediaQuery.of(context).size.height;
    // AppGlobals.screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: AppColors.theme,
      body: Container(
        //width: double.infinity,
        //height: double.infinity,
        // decoration: BoxDecoration(
        //     image: DecorationImage(
        //   image: AssetImage(
        //     AppImages.bg,
        //   ),
        //   fit: BoxFit.fill,
        // )),
        child: const Center(
            child: Text(
          "WeChat",
          style: TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontStyle: FontStyle.italic,
          ),
        )),
      ),
    );
  }
}
