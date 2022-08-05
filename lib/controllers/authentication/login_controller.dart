import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  late final TextEditingController phoneNumber;
  @override
  void onInit() {
    phoneNumber = TextEditingController();
    super.onInit();
  }
}
