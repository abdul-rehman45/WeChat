import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SocialIcon extends StatelessWidget {
  final List<Color>? colors;
  final IconData? icondata;
  final VoidCallback? onPressed;

  const SocialIcon({this.colors, this.icondata, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 14.0),
      child: Container(
          width: 45.w,
          height: 45.h,
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: LinearGradient(
                colors: colors!,
              )),
          child: RawMaterialButton(
              shape: const CircleBorder(),
              onPressed: onPressed,
              child: Icon(icondata, color: Colors.white))),
    );
  }
}
