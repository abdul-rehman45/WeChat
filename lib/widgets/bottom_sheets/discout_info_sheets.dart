// import 'package:esr/Api/Module/offers/offer_model.dart';
// import 'package:esr/Api/User/user_service.dart';
// import 'package:esr/constants/app_colors.dart';
// import 'package:esr/constants/assets.dart';
// import 'package:esr/controller/dashboard/dashboard_controller.dart';
// import 'package:esr/helper/helper.dart';
// import 'package:esr/pages/dashboard/restaurant/restaurant.dart';
// import 'package:esr/widgets/bottom_sheets/tag_item_sheet.dart';
// import 'package:esr/widgets/button/custom_button.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:sizer/sizer.dart';

// class DiscountInfoSheets extends StatefulWidget {
//   DiscountInfoSheets({Key? key, required this.offer}) : super(key: key);

//   final OfferModel offer;

//   @override
//   State<DiscountInfoSheets> createState() => _DiscountInfoSheetsState();
// }

// class _DiscountInfoSheetsState extends State<DiscountInfoSheets> {
//   final DashboardController _controller = Get.find();

//   bool? isFav = false;

//   @override
//   Widget build(BuildContext context) {
//     return SingleChildScrollView(
//       child: Container(
//         padding: EdgeInsets.all(15.sp),
//         decoration: BoxDecoration(
//             borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
//             color: Colors.white),
//         child: Column(
//           children: [
//             Align(
//               alignment: Alignment.centerRight,
//               child: Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: InkWell(
//                   onTap: Get.back,
//                   child: Icon(
//                     Icons.clear,
//                     color: AppColors.theme,
//                   ),
//                 ),
//               ),
//             ),
//             Row(
//               children: [
//                 widget.offer.restaurantLogo == null
//                     ? CircleAvatar(
//                         foregroundImage: AssetImage(AppImages.profileImage),
//                       )
//                     : CircleAvatar(
//                         foregroundImage:
//                             NetworkImage(widget.offer.restaurantLogo!),
//                       ),
//                 SizedBox(width: 5.sp),
//                 Text(
//                   widget.offer.restaurantName ?? "",
//                   style: Helper.setTextStyle(18.sp, FontWeight.w600,
//                       color: AppColors.text),
//                 ),
//               ],
//             ),
//             InkWell(
//               onTap: () => Get.to(
//                 () => RestaurantPage(
//                   id: widget.offer.restaurantId!,
//                   restaurantName: widget.offer.name,
//                   coverImage: widget.offer.coverImage,
//                   address: widget.offer.address,
//                   restaurantCategory: widget.offer.restaurantCategory,
//                   restaurantLogo: widget.offer.restaurantLogo,
//                   avgRating: widget.offer.rating!.avgRating,
//                   reviewsCount: widget.offer.reviewsCount,
//                 ),
//               ),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.end,
//                 children: [
//                   Text(
//                     "View Restaurant",
//                     style: Helper.setTextStyle(14.sp, FontWeight.w400,
//                         color: AppColors.text),
//                   ),
//                   SizedBox(width: 5.sp),
//                   Icon(
//                     Icons.arrow_forward_ios,
//                     color: AppColors.text,
//                     size: 14.sp,
//                   )
//                 ],
//               ),
//             ),
//             Divider(
//               thickness: 2,
//               color: AppColors.lightGrey,
//             ),
//             SizedBox(height: 5.sp),
//             Container(
//               padding: EdgeInsets.all(15.sp),
//               decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(10),
//                   border: Border.all(
//                     color: AppColors.lightGrey,
//                     width: 2,
//                   )),
//               child: IntrinsicHeight(
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceAround,
//                   children: [
//                     _containerItem(
//                         AppIcons.percent,
//                         "Flat ${widget.offer.discountPercentage}% off",
//                         'on all items'),
//                     VerticalDivider(
//                       color: AppColors.lightGrey,
//                       thickness: 2,
//                     ),
//                     _containerItem(AppIcons.reuse, "Reusable", 'x1 per day'),
//                   ],
//                 ),
//               ),
//             ),
//             SizedBox(height: 10.sp),
//             Row(
//               children: [
//                 InkWell(
//                   onTap: () async {
//                     if (widget.offer.id != null) {
//                       isFav = await UserService.addOfferToFav(context,
//                           id: widget.offer.id!);
//                       setState(() {});
//                     }
//                   },
//                   child: Container(
//                     padding: EdgeInsets.all(14),
//                     decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(6),
//                       boxShadow: [
//                         BoxShadow(
//                             offset: Offset(0, 2),
//                             blurRadius: 8,
//                             spreadRadius: 1,
//                             color: Colors.black.withOpacity(0.2))
//                       ],
//                       color: Colors.white,
//                     ),
//                     child: isFav != true
//                         ? Image.asset(
//                             AppIcons.inactiveFavorite,
//                             width: 18.sp,
//                             color: AppColors.theme,
//                           )
//                         : Icon(
//                             Icons.favorite,
//                             //AppIcons.inactiveFavorite,
//                             size: 18.sp,
//                             color: AppColors.theme,
//                             //color: Colors.red,
//                           ),
//                   ),
//                 ),
//                 SizedBox(width: 10.sp),
//                 Expanded(
//                     child: CustomButton(
//                         title: "Redeem",
//                         onTap: () {
//                           _controller.createTagsList(widget.offer.tags ?? []);
//                           _controller.sheetsCount=2;
//                           Get.bottomSheet(
//                             TagItemSheet(offer: widget.offer),
//                             isScrollControlled: true,
//                             barrierColor: Colors.transparent,
//                           );
//                         }))
//               ],
//             )
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _containerItem(String iconPath, String title, String description) =>
//       Column(
//         mainAxisSize: MainAxisSize.min,
//         children: [
//           Image.asset(
//             iconPath,
//             width: 32.sp,
//           ),
//           SizedBox(height: 10.sp),
//           Text(
//             title,
//             style: Helper.setTextStyle(14.sp, FontWeight.w600,
//                 color: AppColors.text),
//           ),
//           SizedBox(height: 3.sp),
//           Text(
//             description,
//             style: Helper.setTextStyle(14.sp, FontWeight.w400,
//                 color: AppColors.text.withOpacity(0.7)),
//           ),
//         ],
//       );
// }
