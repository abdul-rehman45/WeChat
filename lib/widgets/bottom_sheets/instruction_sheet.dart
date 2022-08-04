// import 'package:esr/Api/Module/offers/offer_model.dart';
// import 'package:esr/constants/app_colors.dart';
// import 'package:esr/constants/assets.dart';
// import 'package:esr/helper/helper.dart';
// import 'package:esr/widgets/bottom_sheets/coupon_sheet.dart';
// import 'package:esr/widgets/button/custom_button.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:sizer/sizer.dart';

// class InstructionSheet extends StatelessWidget {
//   InstructionSheet({Key? key, required this.offer}) : super(key: key);

//   final OfferModel offer;

//   final List _instructions = [
//     "Information on how to participate forms part of these Terms & Conditions. By participating, claimants agree to be bound by these Terms & Conditions. Claimants must comply with these Terms & Conditions for a coupon to be valid.",
//     "Each claimant is entitled to avail the offer once per day. Coupons are not transferable and are not redeemable for cash and cannot be combined with any other coupons or any other offer. Total of 5 offers can be availed in 24hrs using the SR app.",
//     "Each coupon is identified by a code and has different rewards. The claimant can decide the reward desired during the booking phase whilst being bound by the conditions linked to the redemption of the coupon.",
//     "To redeem the coupon code, the restaurant manager/waiter enters the coupon code on coupon entry page and discount is availed for the customer.",
//     "Each offer is valid for a limited time only and expires on the day specified by ESR.",
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: EdgeInsets.all(5.sp),
//       decoration: BoxDecoration(
//           borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
//           color: Colors.white),
//       child: Column(
//         mainAxisSize: MainAxisSize.min,
//         children: [
//           Align(
//             alignment: Alignment.centerRight,
//             child: Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: InkWell(
//                 onTap: Get.back,
//                 child: Icon(
//                   Icons.clear,
//                   color: AppColors.theme,
//                 ),
//               ),
//             ),
//           ),
//           SizedBox(height: 10.sp),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(
//                     offer.restaurantName ?? "",
//                     style: Helper.setTextStyle(16.sp, FontWeight.w600,
//                         color: AppColors.text),
//                   ),
//                   Text(
//                     "Discount",
//                     style: Helper.setTextStyle(14.sp, FontWeight.w600,
//                         color: AppColors.text.withOpacity(0.5)),
//                   ),
//                 ],
//               ),
//               offer.restaurantLogo == null
//                   ? CircleAvatar(
//                       foregroundImage: AssetImage(AppImages.profileImage))
//                   : CircleAvatar(
//                       foregroundImage: NetworkImage(offer.restaurantLogo!)),
//             ],
//           ),
//           Divider(
//             thickness: 2,
//             color: AppColors.lightGrey,
//           ),
//           //  SizedBox(height: 10.sp),
//           SizedBox(
//             height: 50.h,
//             child: ListView.builder(
//               shrinkWrap: true,
//               itemCount: _instructions.length,
//               itemBuilder: (BuildContext context, int index) {
//                 return Container(
//                   margin: EdgeInsets.only(
//                       bottom: 10.sp,
//                       right: 10.sp,
//                       left: 10.sp,
//                       top: index == 0 ? 10.sp : 0),
//                   padding: EdgeInsets.all(10.sp),
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(10),
//                     boxShadow: [
//                       BoxShadow(
//                         offset: Offset(0, 2),
//                         blurRadius: 8,
//                         spreadRadius: 1,
//                         color: Colors.black.withOpacity(0.2),
//                       ),
//                     ],
//                     color: Colors.white,
//                   ),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text(
//                         "Instruction ${index + 1}",
//                         style: Helper.setTextStyle(14.sp, FontWeight.w600,
//                             color: AppColors.text.withOpacity(0.5)),
//                       ),
//                       SizedBox(height: 5.sp),
//                       Text(
//                         _instructions[index],
//                         textAlign: TextAlign.justify,
//                         style: Helper.setTextStyle(12.sp, FontWeight.w400,
//                             color: AppColors.text.withOpacity(0.5)),
//                       ),
//                     ],
//                   ),
//                 );
//               },
//             ),
//           ),

//           CustomButton(
//               title: "Get Coupon",
//               onTap: () {
//                 Get.bottomSheet(CouponSheet(
//                   offer: offer,
//                 ));
//               }),
//           SizedBox(height: 10.sp),
//         ],
//       ),
//     );
//   }
// }
