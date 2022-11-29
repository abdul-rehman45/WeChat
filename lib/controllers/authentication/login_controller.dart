import 'package:chat/UI/AuthScreens/phoneNumberVerfication.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  late final TextEditingController phoneNumber;
  @override
  void onInit() {
    phoneNumber = TextEditingController();
    super.onInit();
  }

  sendOtp() {
    if (phoneNumber.text.isNotEmpty) {
      Get.to(() => PhoneNumberVerfication(
            phoneNumber: phoneNumber.text,
          ));
    }
  }
}
