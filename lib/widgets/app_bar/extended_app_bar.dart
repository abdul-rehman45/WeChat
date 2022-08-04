import 'package:chat/constants/app_colors.dart';
import 'package:chat/helper/helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class ExtendedAppBar extends StatelessWidget {
  const ExtendedAppBar(
      {Key? key,
      required this.title,
      this.iconPath,
      this.isReviewDetail = false,
      this.image})
      : super(key: key);

  final String title;
  final String? iconPath, image;
  final bool? isReviewDetail;

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(8.sp),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(22.sp)),
            color: AppColors.theme,
            boxShadow: [
              BoxShadow(
                offset: const Offset(0, 4),
                blurRadius: 4,
                color: Colors.black.withOpacity(0.06),
              )
            ]),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).viewPadding.top,
                ),
                InkWell(
                  onTap: Get.back,
                  child: const Icon(
                    Icons.arrow_back_ios,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                if (isReviewDetail == true)
                  CircleAvatar(
                    backgroundImage: NetworkImage(image!),
                  ),
                Text(
                  title,
                  style: Helper.setTextStyle(20.sp, FontWeight.w700,
                      color: Colors.white),
                ),
                if (isReviewDetail == true) Container(),
                if (iconPath != null)
                  Image.asset(
                    iconPath!,
                    width: 30.sp,
                    height: 30.sp,
                  ),
              ],
            )
          ],
        ));
  }
}
