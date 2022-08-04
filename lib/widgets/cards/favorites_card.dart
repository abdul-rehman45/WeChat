import 'package:chat/constants/app_colors.dart';
import 'package:chat/helper/helper.dart';
import 'package:chat/widgets/button/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class FavoritesCard extends StatelessWidget {
  const FavoritesCard({
    Key? key,
    this.iconPath,
    required this.title,
    required this.off,
    this.removeFavTap,
  }) : super(key: key);
  final String? iconPath;
  final String title, off;
  final VoidCallback? removeFavTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
                offset: const Offset(0, 2),
                blurRadius: 8,
                spreadRadius: 1,
                color: Colors.black.withOpacity(0.2))
          ]),
      padding: EdgeInsets.symmetric(horizontal: 10.sp, vertical: 15.sp),
      margin: EdgeInsets.fromLTRB(10.sp, 0, 10.sp, 10.sp),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              if (iconPath != null || iconPath != "")
                CircleAvatar(
                  foregroundImage: NetworkImage(iconPath!),
                ),
              SizedBox(width: 5.sp),
              Expanded(
                child: Text(
                  title,
                  overflow: TextOverflow.ellipsis,
                  style: Helper.setTextStyle(14.sp, FontWeight.w600,
                      color: AppColors.text),
                ),
              ),
              SizedBox(width: 5.sp),
              CustomButton(
                  padding:
                      EdgeInsets.symmetric(horizontal: 8.sp, vertical: 5.sp),
                  title: "$off% OFF",
                  textStyle: Helper.setTextStyle(13.sp, FontWeight.w400,
                      color: Colors.white),
                  onTap: () {}),
              SizedBox(width: 5.sp),
              InkWell(
                onTap: removeFavTap,
                child: const Icon(Icons.favorite),
                // Image.asset(
                //   AppIcons.favorite,
                //   width: 24.sp,
                // ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
