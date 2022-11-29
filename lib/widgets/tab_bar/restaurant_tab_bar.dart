import 'package:chat/constants/app_colors.dart';
import 'package:chat/helper/helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RestaurantTabBar extends StatelessWidget {
  const RestaurantTabBar(
      {Key? key, this.selectedIndex = 1, required this.onTap})
      : super(key: key);

  final int selectedIndex;
  final Function(int) onTap;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 46.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(14),

            // color: AppColors.f7grey,
          ),
          child: Row(
            children: [
              Expanded(
                child: _menuItem('Offers', 0),
              ),
              Expanded(
                child: _menuItem('Reviews', 1),
              ),
              Expanded(
                child: _menuItem('Menu', 2),
              ),
            ],
          ),
        ),
        AnimatedPositioned(
          left: _tabPosition(),
          top: 3,
          duration: const Duration(milliseconds: 400),
          child: Container(
            height: 40.h,
            width: ScreenUtil.defaultSize.width * 0.28,
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
                    ? "Offers"
                    : selectedIndex == 1
                        ? 'Reviews'
                        : 'Menu',
                style: Helper.setTextStyle(14.sp, FontWeight.w600,
                    color: Colors.white),
              ),
            ),
          ),
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
        return ScreenUtil.defaultSize.width * 0.3;
      case 2:
        return ScreenUtil.defaultSize.width / 1.64;
      default:
        return 0;
    }
  }
}
