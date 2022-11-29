import 'package:chat/constants/app_colors.dart';
import 'package:chat/helper/helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    Key? key,
    required this.title,
    required this.onTap,
    this.titleColor = Colors.white,
    this.bgColor = AppColors.theme,
    this.padding,
    this.textStyle,
    this.isReviewTags = false,
  }) : super(key: key);
  final String title;
  final Color titleColor, bgColor;
  final VoidCallback onTap;
  final EdgeInsets? padding;
  final TextStyle? textStyle;
  final bool? isReviewTags;
  // final double? borderRadius;

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: onTap,
        child: Container(
          padding: padding ??
              const EdgeInsets.symmetric(vertical: 12, horizontal: 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            boxShadow: const [
              BoxShadow(
                  color: Color(0xff6f6f6f80),
                  blurRadius: 12,
                  offset: Offset(0, 0))
            ],
            color: bgColor,
          ),
          child: isReviewTags == false
              ? Center(
                  child: Text(
                    title,
                    style: textStyle ??
                        Helper.setTextStyle(16.sp, FontWeight.w600,
                            color: titleColor),
                  ),
                )
              : Text(
                  title,
                  style: textStyle ??
                      Helper.setTextStyle(16.sp, FontWeight.w600,
                          color: titleColor),
                ),
        ));
  }
}
