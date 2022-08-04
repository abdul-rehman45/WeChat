import 'package:chat/helper/helper.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class IntroTab extends StatelessWidget {
  const IntroTab(
      {Key? key,
      required this.imagePath,
      required this.title,
      required this.description})
      : super(key: key);
  final String imagePath, title, description;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.w),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Image.asset(
            imagePath,
            width: 60.w,
            height: 30.h,
          ),
          Text(
            title,
            textAlign: TextAlign.center,
            style:
                Helper.setTextStyle(16, FontWeight.w600, color: Colors.white),
          ),
          Text(
            description,
            textAlign: TextAlign.center,
            style:
                Helper.setTextStyle(12, FontWeight.w400, color: Colors.white),
          ),
          SizedBox(height: 10.h),
        ],
      ),
    );
  }
}
