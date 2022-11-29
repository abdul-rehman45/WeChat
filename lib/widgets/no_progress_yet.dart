import 'package:chat/constants/app_colors.dart';
import 'package:chat/helper/helper.dart';
import 'package:chat/widgets/button/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NoProgressYet extends StatelessWidget {
  const NoProgressYet(
      {Key? key,
      this.progressTitle,
      this.description,
      this.buttontitle,
      this.title,
      this.iconPath,
      this.onTap})
      : super(key: key);

  final String? progressTitle, description, buttontitle, title, iconPath;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        //
        // Image.asset(
        //  iconPath?? AppIcons.noProgressBell,
        //   width: 48.sp,
        //   height: 48.sp,
        // ),
        const Icon(Icons.no_luggage),
        Text(
          title ?? 'No $progressTitle, yet!',
          style: Helper.setTextStyle(14.sp, FontWeight.w600,
              color: AppColors.text.withOpacity(0.75)),
        ),
        Text(
          description ?? "Check out what’s trending",
          style: Helper.setTextStyle(14.sp, FontWeight.w400,
              color: AppColors.text.withOpacity(0.5)),
          textAlign: TextAlign.center,
        ),
        SizedBox(
          height: 35.sp,
        ),
        SizedBox(
          width: ScreenUtil.defaultSize.width * 0.65,
          child: CustomButton(
              title: buttontitle ?? "Check Offers!",
              onTap: onTap ??
                  () {
                    //Get.back();
                    //Get.put(DashboardController()).changeTabIndex(0);
                  }),
        )
      ],
    );
  }
}
