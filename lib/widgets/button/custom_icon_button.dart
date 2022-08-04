import 'package:chat/constants/app_colors.dart';
import 'package:chat/helper/helper.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class CustomIconButton extends StatelessWidget {
  const CustomIconButton(
      {Key? key,
      required this.title,
      required this.onTap,
      this.titleColor = Colors.white,
      this.bgColor = AppColors.theme,
      this.padding,
      this.textStyle,
      this.prefixIcon,
      this.showNextIcon = false})
      : super(key: key);
  final String title;
  final String? prefixIcon;
  final bool showNextIcon;
  final Color titleColor, bgColor;
  final VoidCallback onTap;
  final EdgeInsets? padding;
  final TextStyle? textStyle;

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: onTap,
        child: Container(
          padding: padding ??
              EdgeInsets.symmetric(vertical: 12.sp, horizontal: 10.sp),
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
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (prefixIcon != null)
                Row(
                  children: [
                    Image.asset(
                      prefixIcon!,
                      width: 22.sp,
                      height: 22.sp,
                    ),
                    SizedBox(
                      width: 5.sp,
                    )
                  ],
                ),
              Expanded(
                child: Text(
                  title,
                  textAlign: TextAlign.center,
                  style: textStyle ??
                      Helper.setTextStyle(
                        16.sp,
                        FontWeight.w600,
                        color: titleColor,
                      ),
                ),
              ),
              if (showNextIcon)
                Row(
                  children: [
                    SizedBox(width: 5.sp),
                    const Icon(
                      Icons.arrow_forward_ios,
                      color: Colors.white,
                    ),
                  ],
                )
            ],
          ),
        ));
  }
}
