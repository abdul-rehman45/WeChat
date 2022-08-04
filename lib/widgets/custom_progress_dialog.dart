import 'package:chat/constants/app_colors.dart';
import 'package:chat/helper/helper.dart';
import 'package:flutter/material.dart';
import 'package:ndialog/ndialog.dart';
import 'package:sizer/sizer.dart';
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

  static setErrorDialog(ProgressDialog _progressDialog) {
    _progressDialog.setTitle(setProgressTitle(null));
    _progressDialog.setMessage(setProgressMessage(null));
    _progressDialog.setLoadingWidget(setIcon());
    Future.delayed(const Duration(seconds: 3), () => _progressDialog.dismiss());
  }

  static setSuccessDialog(ProgressDialog _progressDialog,
      {String? title, String? message, int? time}) async {
    _progressDialog.setTitle(setProgressTitle(title ?? "Success"));
    _progressDialog.setMessage(
        setProgressMessage(message ?? "Data Updated Successfully."));
    _progressDialog.setLoadingWidget(
        setIcon(icon: Icons.check, color: Colors.greenAccent));
    await Future.delayed(
        Duration(seconds: time ?? 3), () => _progressDialog.dismiss());
  }

  static setCustomMessageDialog(ProgressDialog _progressDialog,
      {String? title, String? message, int? seconds}) {
    _progressDialog.setTitle(setProgressTitle(title ?? "Failure"));
    _progressDialog.setMessage(setProgressMessage(
      message ?? "",
    )); // AppStrings.somethingWrong));
    _progressDialog.setLoadingWidget(setIcon());
    Future.delayed(
        Duration(seconds: seconds ?? 3), () => _progressDialog.dismiss());
  }
}
