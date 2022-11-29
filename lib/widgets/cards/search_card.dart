import 'package:chat/constants/app_colors.dart';
import 'package:chat/helper/helper.dart';
import 'package:chat/widgets/review_rating.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SearchCard extends StatelessWidget {
  const SearchCard({
    Key? key,
    required this.imageLink,
    required this.name,
    required this.foodType,
    required this.rating,
    required this.address,
    required this.onTap,
  }) : super(key: key);

  final String imageLink, name, foodType, address;
  final double rating;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8),
            child: Row(
              children: [
                imageLink != ''
                    ? CircleAvatar(
                        foregroundImage: NetworkImage(imageLink),
                      )
                    : const CircleAvatar(
                        foregroundImage: AssetImage("image here"),
                      ),
                SizedBox(width: 5.w),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Text(
                              name,
                              overflow: TextOverflow.ellipsis,
                              style: Helper.setTextStyle(14.sp, FontWeight.w600,
                                  color: AppColors.text),
                            ),
                          ),
                          ReviewRating(
                            rating: rating,
                          ),
                        ],
                      ),
                      SizedBox(height: 2.h),
                      Row(
                        children: [
                          Text(
                            foodType,
                            style: Helper.setTextStyle(12.sp, FontWeight.w400,
                                color: AppColors.text.withOpacity(0.7)),
                          ),
                          SizedBox(width: 50.w),
                          Expanded(
                            child: Text(
                              address,
                              overflow: TextOverflow.ellipsis,
                              style: Helper.setTextStyle(12.sp, FontWeight.w400,
                                  color: AppColors.text.withOpacity(0.7)),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Divider(
            color: AppColors.text.withOpacity(0.25),
            height: 10.h,
          ),
        ],
      ),
    );
  }
}
