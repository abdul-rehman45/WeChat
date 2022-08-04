import 'package:chat/constants/app_colors.dart';
import 'package:chat/helper/helper.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class CustomBorderButton extends StatelessWidget {
  const CustomBorderButton(
      {Key? key,
      required this.title,
      required this.onTap,
      this.bgColor = Colors.white,
      this.titleColor = AppColors.text})
      : super(key: key);
  final String title;
  final Color titleColor, bgColor;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: onTap,
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 2.h, horizontal: 1.w),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: AppColors.theme),
            // boxShadow: [
            //   BoxShadow(
            //       color: Color(0xff6F6F6F80),
            //       blurRadius: 12,
            //       offset: Offset(0,0)
            //   )
            // ],
            color: bgColor,
          ),
          child: Center(
            child: Text(
              title,
              style: Helper.setTextStyle(16.sp, FontWeight.w600,
                  color: titleColor),
            ),
          ),
        ));
  }
}
