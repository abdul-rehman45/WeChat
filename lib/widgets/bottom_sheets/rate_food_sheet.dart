// import 'package:esr/Api/Module/offers/offer_model.dart';
// import 'package:esr/constants/app_colors.dart';
// import 'package:esr/controller/dashboard/dashboard_controller.dart';
// import 'package:esr/helper/helper.dart';
// import 'package:esr/widgets/app_bar/inline_app_bar.dart';
// import 'package:esr/widgets/bottom_sheets/instruction_sheet.dart';
// import 'package:esr/widgets/bottom_sheets/share_details_sheet.dart';
// import 'package:esr/widgets/button/custom_icon_button.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_rating_bar/flutter_rating_bar.dart';
// import 'package:get/get.dart';
// import 'package:sizer/sizer.dart';

// class RateFoodSheet extends StatelessWidget {
//   RateFoodSheet({Key? key, required this.offer}) : super(key: key);

//   final DashboardController _controller = Get.find();

//   final OfferModel offer;

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       color: Colors.white,
//       child: Column(
//         mainAxisSize: MainAxisSize.min,
//         children: [
//           InLineAppBar(
//             showBack: true,
//             title: "Review",
//           ),
//           Padding(
//             padding: EdgeInsets.all(16.sp),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   "Rate your food",
//                   style: Helper.setTextStyle(16.sp, FontWeight.w700,
//                       color: AppColors.text),
//                 ),
//                 Divider(
//                   thickness: 2,
//                   color: AppColors.lightGrey,
//                 ),
//                 SizedBox(height: 5.sp),
//                 _ratingRow(
//                     'Taste',_controller.taste_rating, (rating) => _controller.taste_rating = rating),
//                 _ratingRow('Service',_controller.service_rating, (rating) => _controller.service_rating = rating),
//                 _ratingRow('Value for money', _controller.value_rating,(rating) => _controller.value_rating = rating),
//                 _ratingRow('Ambiance',_controller.ambiance_rating, (rating) => _controller.ambiance_rating = rating),
//                 SizedBox(height: 15.sp),
//                 Row(
//                   children: [
//                     InkWell(
//                       onTap: () {
//                         do{
//                           Get.back();
//                         }while(Get.isBottomSheetOpen??false);

//                         Get.bottomSheet(InstructionSheet(offer: offer), isScrollControlled: true,);
//                       },
//                       child: Text(
//                         "Skip Review",
//                         style: Helper.setTextStyle(16.sp, FontWeight.w600,
//                             color: AppColors.theme),
//                       ),
//                     ),
//                     Spacer(flex: 2),
//                     Expanded(
//                       flex: 3,
//                       child: CustomIconButton(
//                         showNextIcon: true,
//                         title: "Next",
//                         onTap: () {
//                           Get.bottomSheet(ShareDetailSheet(offer: offer,),
//                               isScrollControlled: true);
//                         },
//                       ),
//                     )
//                   ],
//                 ),
//                 SizedBox(height: 10.sp),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _ratingRow(String title,  double initialRating, Function(double) onRatingUpdate) => Container(
//         padding: EdgeInsets.all(15.sp),
//         margin: EdgeInsets.only(bottom: 8.sp),
//         decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(10),
//             boxShadow: [
//               BoxShadow(
//                   offset: Offset(0, 2),
//                   blurRadius: 8,
//                   spreadRadius: 1,
//                   color: Colors.black.withOpacity(0.2))
//             ],
//             color: Colors.white),
//         child: Row(
//           children: [
//             Expanded(
//               child: Text(
//                 title,
//                 style: Helper.setTextStyle(
//                   14.sp,
//                   FontWeight.w400,
//                   color: AppColors.text,
//                 ),
//               ),
//             ),
//             RatingBar.builder(
//               initialRating: 3,
//               minRating: 1,
//               direction: Axis.horizontal,
//               allowHalfRating: true,
//               itemCount: 5,
//               itemPadding: EdgeInsets.zero,
//               itemSize: 18.sp,
//               unratedColor: AppColors.lightGrey,
//               itemBuilder: (context, _) => Icon(
//                 Icons.star,
//                 color: Colors.amber,
//               ),
//               onRatingUpdate: onRatingUpdate,
//             )
//           ],
//         ),
//       );
// }
