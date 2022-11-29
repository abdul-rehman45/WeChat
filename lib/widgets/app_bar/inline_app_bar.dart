import 'package:chat/constants/app_colors.dart';
import 'package:chat/helper/helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';

class InLineAppBar extends StatelessWidget implements PreferredSizeWidget {
  const InLineAppBar({
    Key? key,
    this.title,
    this.iconPath,
    this.height = 50,
    this.isSearch = false,
    this.showBack = false,
    this.isPopular = false,
    this.controller,
  }) : super(key: key);

  final String? title;
  final String? iconPath;
  final double height;
  final bool isSearch, showBack, isPopular;
  final TextEditingController? controller;

  @override
  Size get preferredSize => isSearch == true && title != null
      ? Size.fromHeight(ScreenUtil.defaultSize.height * 0.07.h)
      : Size.fromHeight(height.h);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.only(
          left: 12,
          right: 12,
          bottom: 12,
        ).r,
        decoration: BoxDecoration(
            borderRadius:
                BorderRadius.vertical(bottom: const Radius.circular(18).r),
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
            isSearch == true && title != null
                ? SizedBox(
                    height: MediaQuery.of(context).viewPadding.top,
                  )
                : const SizedBox.shrink(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                showBack
                    ? InkWell(
                        onTap: Get.back,
                        child: const Padding(
                          padding: EdgeInsets.all(8),
                          child: Icon(
                            Icons.arrow_back_ios,
                            color: Colors.white,
                          ),
                        ),
                      )
                    : const SizedBox.shrink(),
                title != null
                    ? Text(
                        title!,
                        style: Helper.setTextStyle(16.sp, FontWeight.w600,
                            color: Colors.white),
                      )
                    : const SizedBox.shrink(),
                iconPath != null
                    ? Image.asset(
                        iconPath!,
                        width: 24.w,
                        height: 24.h,
                      )
                    : const SizedBox.shrink(),
              ],
            ),
            if (isSearch)
              Padding(
                padding:
                    // title != null
                    //     ? EdgeInsets.only(left: 10, right: 10, top: 10)
                    //     :
                    const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  // mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // isPopular != true
                    //     ? InkWell(
                    //         onTap: () => Get.to(() => SearchPage()),
                    //         child: Image.asset(
                    //           AppIcons.search,
                    //           height: 20,
                    //         ),
                    //       )
                    //:
                    InkWell(
                      onTap: () {
                        // Get.to(() => LocationPage()),
                      },
                      child: Container(
                        padding: const EdgeInsets.all(5),
                        decoration: const BoxDecoration(
                            shape: BoxShape.circle, color: Colors.white),
                        child: const Center(
                          child: Icon(Icons.location_city),
                          // Image.asset(
                          //   AppIcons.inactiveLocation,
                          //   height: 20,
                          // ),
                        ),
                      ),
                    ),
                    Expanded(
                        child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: SizedBox(
                        //height: 30.sp,
                        child: Material(
                          elevation: 5,
                          borderRadius: BorderRadius.circular(10.r),
                          child: TextFormField(
                            readOnly: true,
                            cursorHeight: 16.h,
                            controller: controller,
                            style: Helper.setTextStyle(12.sp, FontWeight.w400),
                            decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.r),
                                  borderSide: BorderSide.none,
                                ),
                                fillColor: Colors.white,
                                filled: true,
                                contentPadding: const EdgeInsets.symmetric(
                                  horizontal: 10,
                                  vertical: 0,
                                ),
                                hintText: "Address",
                                hintStyle: Helper.setTextStyle(
                                    12.sp, FontWeight.w400)),
                          ),
                        ),
                      ),
                    )),
                    // isPopular != true
                    //     ? InkWell(
                    //         onTap: () => Get.to(() => LocationPage()),
                    //         child: Container(
                    //           padding: EdgeInsets.all(5),
                    //           decoration: BoxDecoration(
                    //               shape: BoxShape.circle, color: Colors.white),
                    //           child: Center(
                    //             child: Image.asset(
                    //               AppIcons.inactiveLocation,
                    //               height: 20,
                    //             ),
                    //           ),
                    //         ),
                    //       )
                    //     :
                    InkWell(
                      onTap: () {
                        //=> Get.to(() => SearchPage()),
                      },
                      child: const Icon(Icons.search),
                      //  Image.asset(
                      //   AppIcons.search,
                      //   height: 20,
                      // ),
                    ),
                  ],
                ),
              ),
          ],
        ));
  }
}
