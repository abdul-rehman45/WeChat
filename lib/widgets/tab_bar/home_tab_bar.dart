import 'package:chat/constants/app_colors.dart';
import 'package:chat/helper/helper.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class HomeTabBar extends StatelessWidget {
  const HomeTabBar({Key? key, this.selectedIndex = 0, required this.onTap})
      : super(key: key);

  final int selectedIndex;
  final Function(int) onTap;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 46.sp,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(14),

            // color: AppColors.f7grey,
          ),
          child: Row(
            children: [
              Expanded(
                child: _menuItem('Discounts', 0),
              ),
              Expanded(
                child: _menuItem('Bumper Activities', 1),
              ),
            ],
          ),
        ),
        AnimatedPositioned(
          left: _tabPosition(),
          top: 3.sp,
          child: Container(
            height: 40.sp,
            width: SizerUtil.width * 0.45,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(14),
              boxShadow: [
                BoxShadow(
                  offset: const Offset(0, 2),
                  blurRadius: 8,
                  spreadRadius: 1,
                  color: Colors.black.withOpacity(0.2),
                )
              ],
              color: AppColors.theme,
            ),
            child: Center(
              child: Text(
                selectedIndex == 0
                    ? "Discounts"
                    : selectedIndex == 1
                        ? 'Bumper Activities'
                        : '',
                style: Helper.setTextStyle(14.sp, FontWeight.w600,
                    color: Colors.white),
              ),
            ),
          ),
          duration: const Duration(milliseconds: 400),
        ),
      ],
    );
  }

  Widget _menuItem(String title, int index) => InkWell(
        onTap: () => onTap(index),
        child: Text(
          title,
          textAlign: TextAlign.center,
          style: Helper.setTextStyle(
            14,
            FontWeight.w600,
            color: selectedIndex == index ? Colors.transparent : AppColors.text,
          ),
        ),
      );

  double _tabPosition() {
    switch (selectedIndex) {
      case 0:
        return 3.sp;
      case 1:
        return SizerUtil.width * 0.43;
      case 2:
        return SizerUtil.width / 1.64;
      default:
        return 0;
    }
  }
}
