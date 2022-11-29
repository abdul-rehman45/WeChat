import 'package:chat/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pinput/pinput.dart';

class PinPutField extends StatelessWidget {
  PinPutField(
      {Key? key,
      this.fillColor,
      this.borderColor,
      required this.controller,
      this.isCouponField = false})
      : super(key: key);
  final Color? fillColor, borderColor;
  final TextEditingController controller;
  final bool isCouponField;

  @override
  Widget build(BuildContext context) {
    return Pinput(
      length: isCouponField ? 4 : 6,
      defaultPinTheme: _defaultPinTheme,
      focusedPinTheme: _focusedPinTheme,
      keyboardType: TextInputType.number,
      controller: controller,
    );
  }

  static final _defaultPinTheme = PinTheme(
    width: 18.w,
    height: 18.h,
    textStyle: const TextStyle(
        fontSize: 18, color: AppColors.text, fontWeight: FontWeight.w600),
    decoration: BoxDecoration(
      // border: Border.all(color: Color.fromRGBO(234, 239, 243, 1)),
      borderRadius: BorderRadius.circular(10),
      color: const Color(0xffEEEEEE),
    ),
  );
  final _focusedPinTheme = _defaultPinTheme.copyBorderWith(
      border: Border.all(color: AppColors.text));
}
