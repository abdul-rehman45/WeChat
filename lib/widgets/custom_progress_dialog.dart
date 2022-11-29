import 'package:chat/constants/app_colors.dart';
import 'package:chat/helper/helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ndialog/ndialog.dart';

//import 'package:symphony/Constant/app_strings.dart';
//import 'package:symphony/Modules/utilites/utilities.dart';

class MyProgressDialog {
  static getProgressDialog(BuildContext context,
          {String? title, String? message}) =>
      ProgressDialog(
        context,
        title: Text(
          title ?? '',
          style: Helper.setTextStyle(
            14.sp,
            FontWeight.w600,
          ),
        ),
        message: Text(
          message ?? '',
          style: Helper.setTextStyle(
            12.sp,
            FontWeight.w500,
          ),
        ),
        defaultLoadingWidget: const CircularProgressIndicator(
          color: AppColors.theme,
        ),
      );

  static setProgressTitle(String? title) => Text(
        title ?? 'Failure',
        style: Helper.setTextStyle(
          18.sp,
          FontWeight.w600,
        ),
      );

  static setProgressMessage(String? message) => Text(
        message ?? "", // AppStrings.somethingWrong,
        style: Helper.setTextStyle(
          14.sp,
          FontWeight.w500,
        ),
      );

  static setIcon({IconData? icon, Color? color}) => Icon(
        icon ?? Icons.warning_amber_outlined,
        color: color ?? Colors.red,
      );

  static setErrorDialog(ProgressDialog progressDialog) {
    progressDialog.setTitle(setProgressTitle(null));
    progressDialog.setMessage(setProgressMessage(null));
    progressDialog.setLoadingWidget(setIcon());
    Future.delayed(const Duration(seconds: 3), () => progressDialog.dismiss());
  }

  static setSuccessDialog(ProgressDialog progressDialog,
      {String? title, String? message, int? time}) async {
    progressDialog.setTitle(setProgressTitle(title ?? "Success"));
    progressDialog.setMessage(
        setProgressMessage(message ?? "Data Updated Successfully."));
    progressDialog.setLoadingWidget(
        setIcon(icon: Icons.check, color: Colors.greenAccent));
    await Future.delayed(
        Duration(seconds: time ?? 3), () => progressDialog.dismiss());
  }

  static setCustomMessageDialog(ProgressDialog progressDialog,
      {String? title, String? message, int? seconds}) {
    progressDialog.setTitle(setProgressTitle(title ?? "Failure"));
    progressDialog.setMessage(setProgressMessage(
      message ?? "",
    )); // AppStrings.somethingWrong));
    progressDialog.setLoadingWidget(setIcon());
    Future.delayed(
        Duration(seconds: seconds ?? 3), () => progressDialog.dismiss());
  }
}
