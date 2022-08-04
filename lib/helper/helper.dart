import 'package:chat/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class Helper {
  static setTextStyle(double size, FontWeight fontWeight,
          {Color color = AppColors.text}) =>
      GoogleFonts.inter(
        fontSize: size,
        fontWeight: fontWeight,
        color: color,
      );

  static BoxShadow setBoxShadow({double? blurradius}) => BoxShadow(
        offset: const Offset(0, 0),
        blurRadius: blurradius ?? 12,
        color: AppColors.grey.withOpacity(0.5),
      );

  static showErrorMessage({String title = 'Error', String? error}) {
    if (Get.isSnackbarOpen) Get.closeAllSnackbars();
    return Get.snackbar(
      title,
      error ?? "Something went wrong, Try again",
      colorText: Colors.red,
      backgroundColor: Colors.white,
    );
  }

  static showSuccessMessage({String title = 'Success', String? message}) {
    if (Get.isSnackbarOpen) Get.closeAllSnackbars();
    return Get.snackbar(
      title,
      message ?? "Successfully done",
      colorText: AppColors.text,
      backgroundColor: Colors.white,
    );
  }
}
