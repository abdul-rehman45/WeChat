import 'package:chat/constants/app_colors.dart';
import 'package:chat/helper/helper.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class BumperActivityCard extends StatelessWidget {
  const BumperActivityCard({
    Key? key,
    required this.imageLink,
    required this.name,
    required this.foodType,
    required this.off,
    required this.rating,
    required this.totalRates,
    this.restLogo,
  }) : super(key: key);

  final String imageLink, name, foodType;
  final String? restLogo;

  final double off, rating;

  final int totalRates;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 7, 0, 7),
      child: Container(
        height: 25.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
                offset: const Offset(-3, 3),
                blurRadius: 2,
                spreadRadius: 2,
                color: const Color(0xffb9b9b9).withOpacity(0.2))
          ],
          color: Colors.white,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Expanded(
              child: Stack(
                children: [
                  ClipRRect(
                    borderRadius:
                        const BorderRadius.vertical(top: Radius.circular(10)),
                    child: Image.network(
                      imageLink,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Positioned(
                    top: 10.sp,
                    right: 10.sp,
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6),
                        boxShadow: [
                          BoxShadow(
                              offset: const Offset(0, 0),
                              blurRadius: 12,
                              spreadRadius: 0,
                              color: AppColors.grey.withOpacity(0.5))
                        ],
                        color: Colors.white,
                      ),
                      child: Text(
                        "Bumper Activity",
                        style: Helper.setTextStyle(
                          12.sp,
                          FontWeight.w400,
                          color: AppColors.theme,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      child: RichText(
                        textAlign: TextAlign.right,
                        text: TextSpan(
                            text: "${off.toInt()}",
                            style: TextStyle(
                                fontSize: 22.sp,
                                fontWeight: FontWeight.w700,
                                color: Colors.white,
                                shadows: const [
                                  BoxShadow(
                                      offset: Offset(3, 3),
                                      blurRadius: 8,
                                      spreadRadius: 2,
                                      color: Colors.black),
                                  BoxShadow(
                                      offset: Offset(-3, -3),
                                      blurRadius: 8,
                                      spreadRadius: 2,
                                      color: Colors.black),
                                ]),
                            children: [
                              TextSpan(
                                text: "%",
                                style: TextStyle(fontSize: 16.sp),
                              ),
                              TextSpan(
                                text: "\nOFF",
                                style: TextStyle(
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w600),
                              ),
                            ]),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.all(10.sp),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      restLogo != null || restLogo != ""
                          ? CircleAvatar(
                              foregroundImage: NetworkImage(restLogo!),
                            )
                          : const CircleAvatar(
                              backgroundColor: Colors.white,
                              radius: 15,
                            ),
                      SizedBox(width: 5.sp),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  name,
                                  style: Helper.setTextStyle(
                                      14.sp, FontWeight.w600,
                                      color: AppColors.text),
                                ),
                                Row(
                                  children: [
                                    // Image.asset(
                                    //   AppIcons.star3,
                                    //   width: 10.sp,
                                    //   color: AppColors.yellow,
                                    // ),
                                    SizedBox(width: 2.sp),
                                    RichText(
                                      textAlign: TextAlign.right,
                                      text: TextSpan(
                                          text: rating.toString(),
                                          style: TextStyle(
                                            fontSize: 14.sp,
                                            fontWeight: FontWeight.w400,
                                            color: AppColors.text,
                                          ),
                                          children: [
                                            TextSpan(
                                              text: "/5",
                                              style: TextStyle(
                                                  fontSize: 12.sp,
                                                  color: AppColors.text
                                                      .withOpacity(0.7)),
                                            ),
                                          ]),
                                    ),
                                  ],
                                )
                              ],
                            ),
                            SizedBox(height: 2.sp),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  foodType,
                                  style: Helper.setTextStyle(
                                      12.sp, FontWeight.w400,
                                      color: AppColors.text.withOpacity(0.7)),
                                ),
                                Text(
                                  "($totalRates)",
                                  style: Helper.setTextStyle(
                                      12.sp, FontWeight.w400,
                                      color: AppColors.text.withOpacity(0.7)),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
