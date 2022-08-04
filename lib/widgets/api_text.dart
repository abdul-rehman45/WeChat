import 'package:chat/constants/app_colors.dart';
import 'package:chat/helper/helper.dart';
import 'package:flutter/material.dart';

class NoData {
  static Widget noTextWidget({String? text}) {
    return Center(
      child: Text(
        text ?? '', //AppStrings.noData,
        textAlign: TextAlign.center,
        style: Helper.setTextStyle(
          14,
          FontWeight.w500,
          color: AppColors.text,
        ),
      ),
    );
  }

  static Widget nodataWidget({String? text}) {
    return Center(
      child: Text(
        text ?? "No data available",
        style: Helper.setTextStyle(14, FontWeight.w600, color: AppColors.text),
        textAlign: TextAlign.center,
      ),
    );
  }
}
