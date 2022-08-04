

// import 'package:esr/Api/Module/offers/offer_model.dart';
// import 'package:esr/Api/Review/review_service.dart';
// import 'package:esr/constants/app_colors.dart';
// import 'package:esr/constants/assets.dart';
// import 'package:esr/helper/helper.dart';
// import 'package:esr/widgets/app_bar/inline_app_bar.dart';
// import 'package:esr/widgets/bottom_sheets/instruction_sheet.dart';
// import 'package:esr/widgets/button/custom_border_button.dart';
// import 'package:esr/widgets/pinput_field.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:sizer/sizer.dart';

// class CouponSheet extends StatelessWidget {
//    CouponSheet({Key? key, required this.offer}) : super(key: key);

//   final OfferModel offer;
//   final TextEditingController _tfCoupon = TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       color: Colors.white,
//       child: Column(
//         mainAxisSize: MainAxisSize.min,
//         children: [
//           InLineAppBar(
//             showBack: true,
//             title: "Discount",
//           ),
//           Padding(
//             padding: EdgeInsets.all(16.sp),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [

//                 Row(
//                   children: [
//                     offer.restaurantLogo!=null?
//                     CircleAvatar(
//                       foregroundImage: NetworkImage(offer.restaurantLogo!),
//                     ):CircleAvatar(
//                       foregroundImage: AssetImage(AppImages.profileImage),
//                     ),
//                     SizedBox(width: 5.sp),
//                     Text(
//                       offer.restaurantName??"",
//                       style: Helper.setTextStyle(14.sp, FontWeight.w600,
//                           color: AppColors.text),
//                     ),
//                     Spacer(),
//                     Text(
//                      "${offer.discountPercentage??""}% OFF",
//                       style: Helper.setTextStyle(14.sp, FontWeight.w400,
//                           color: AppColors.text),
//                     ),
//                   ],
//                 ),
//                 Divider(
//                   thickness: 2,
//                   color: AppColors.lightGrey,
//                 ),
//                 SizedBox(height: 15.sp),
//                 Text(
//                   "Enter Coupon Code",
//                   style: Helper.setTextStyle(14.sp, FontWeight.w400,
//                       color: AppColors.text),
//                 ),
//                 SizedBox(height: 20.sp),
//                 Center(child: PinPutField(
//                   controller: _tfCoupon,
//                   isCouponField: true,
//                 )),
//                 SizedBox(height: 25.sp),

//                   CustomBorderButton(
//                     title: "Done",
//                     onTap: () async {
//                       await ReviewService.applyCoupon(offerId: offer.id!, couponCode:  _tfCoupon.text);
//                     },
//                   ),
//                 SizedBox(height: 10.sp),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
