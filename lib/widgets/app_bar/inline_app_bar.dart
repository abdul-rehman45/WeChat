import 'package:chat/constants/app_colors.dart';
import 'package:chat/helper/helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

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
      ? Size.fromHeight(SizerUtil.height * 0.07.sp)
      : Size.fromHeight(height.sp);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.only(
          left: 12.sp,
          right: 12.sp,
          bottom: 12.sp,
        ),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(18.sp)),
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
                          padding: EdgeInsets.all(8.0),
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
                        width: 24.sp,
                        height: 24.sp,
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
                    EdgeInsets.symmetric(horizontal: 10.sp),
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
                          elevation: 5.sp,
                          borderRadius: BorderRadius.circular(10.sp),
                          child: TextFormField(
                            readOnly: true,
                            cursorHeight: 16,
                            controller: controller,
                            style: Helper.setTextStyle(12.sp, FontWeight.w400),
                            decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.sp),
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
