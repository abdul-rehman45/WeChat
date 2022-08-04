import 'package:chat/constants/app_colors.dart';
import 'package:chat/helper/helper.dart';
import 'package:chat/widgets/button/custom_border_button.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class NoRestaurantFound extends StatelessWidget {
  const NoRestaurantFound({Key? key, required this.onTap}) : super(key: key);

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // your asset icon
        // Image.asset(
        //   AppIcons.empty_search,
        //   width: 48.sp,
        //   height: 48.sp,
        //   color: AppColors.text,
        // ),
        const Icon(
          Icons.search,
          size: 40,
        ),
        Text(
          "Uh oh!",
          style: Helper.setTextStyle(14.sp, FontWeight.w600,
              color: AppColors.text.withOpacity(0.75)),
        ),
        Text(
          "No Results were found.",
          style: Helper.setTextStyle(14.sp, FontWeight.w400,
              color: AppColors.text.withOpacity(0.5)),
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 35.sp),
        SizedBox(
          width: 75.w,
          child: CustomBorderButton(
            title: "Try Different Keywords",
            onTap: onTap,
          ),
        )
      ],
    );
  }
}
