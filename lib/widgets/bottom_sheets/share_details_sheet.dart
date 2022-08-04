// import 'package:esr/Api/Module/offers/offer_model.dart';
// import 'package:esr/Api/Review/review_service.dart';
// import 'package:esr/constants/app_colors.dart';
// import 'package:esr/constants/app_string.dart';
// import 'package:esr/constants/assets.dart';
// import 'package:esr/constants/constants.dart';
// import 'package:esr/controller/dashboard/dashboard_controller.dart';
// import 'package:esr/controller/share_review_details_controller.dart';
// import 'package:esr/helper/helper.dart';
// import 'package:esr/widgets/app_bar/inline_app_bar.dart';
// import 'package:esr/widgets/bottom_sheets/instruction_sheet.dart';
// import 'package:esr/widgets/button/custom_border_button.dart';
// import 'package:esr/widgets/button/custom_icon_button.dart';
// import 'package:esr/widgets/loader.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_rating_bar/flutter_rating_bar.dart';
// import 'package:get/get.dart';
// import 'package:sizer/sizer.dart';

// class ShareDetailSheet extends StatelessWidget {
//   ShareDetailSheet({Key? key, required this.offer}) : super(key: key);
//   final DashboardController _dashboardController = Get.find();

//   final OfferModel offer;

//   @override
//   Widget build(BuildContext context) {
//     return GetBuilder<ShareReviewDetailsController>(
//       init: ShareReviewDetailsController(),
//       builder: (controller) {
//         return Container(
//           color: Colors.white,
//           child: Column(
//             mainAxisSize: MainAxisSize.min,
//             children: [
//               InLineAppBar(
//                 showBack: true,
//                 title: "Review",
//               ),
//               Padding(
//                 padding: EdgeInsets.all(16.sp),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text(
//                       "Share details",
//                       style: Helper.setTextStyle(
//                         16.sp,
//                         FontWeight.w700,
//                         color: AppColors.text,
//                       ),
//                     ),
//                     Divider(
//                       thickness: 2,
//                       color: AppColors.lightGrey,
//                     ),
//                     SizedBox(height: 5.sp),
//                     Container(
//                       padding: EdgeInsets.all(10),
//                       decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(10),
//                         border:
//                             Border.all(color: AppColors.lightGrey, width: 2),
//                       ),
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Text(
//                             "1. Write a Review",
//                             style: Helper.setTextStyle(10.sp, FontWeight.w400,
//                                 color: AppColors.text.withOpacity(0.7)),
//                           ),
//                           SizedBox(height: 10.sp),
//                           TextFormField(
//                             controller: controller.tfReview,
//                             maxLines: 4,
//                             cursorColor: AppColors.text,
//                             style: Helper.setTextStyle(12.sp, FontWeight.w400),
//                             decoration: InputDecoration(
//                               fillColor: AppColors.lightGrey,
//                               filled: true,
//                               hintText: "Share your thoughts..",
//                               border: OutlineInputBorder(
//                                   borderRadius: BorderRadius.circular(10),
//                                   borderSide: BorderSide.none),
//                             ),
//                           ),
//                           SizedBox(height: 8.sp),
//                           Divider(
//                             thickness: 2,
//                             color: AppColors.lightGrey,
//                           ),
//                           SizedBox(height: 8.sp),
//                           Text(
//                             "2. Add Photos here",
//                             style: Helper.setTextStyle(10.sp, FontWeight.w400,
//                                 color: AppColors.text.withOpacity(0.7)),
//                           ),
//                           SizedBox(height: 10.sp),
//                           Obx(
//                             () => Row(
//                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                               children: [
//                                 controller.image.isEmpty
//                                     ? Column(
//                                         crossAxisAlignment:
//                                             CrossAxisAlignment.start,
//                                         children: [
//                                           Text(
//                                             "No Photos added yet",
//                                             style: Helper.setTextStyle(
//                                                 16.sp, FontWeight.w600,
//                                                 color: AppColors.text),
//                                           ),
//                                           Text(
//                                             "Tap the Icon to add photos",
//                                             style: Helper.setTextStyle(
//                                                 12.sp, FontWeight.w400,
//                                                 color: AppColors.text
//                                                     .withOpacity(0.7)),
//                                           ),
//                                         ],
//                                       )
//                                     : Expanded(
//                                         child: SizedBox(
//                                           height: 40.sp,
//                                           child: ListView.builder(
//                                             scrollDirection: Axis.horizontal,
//                                             itemCount: controller.image.length,
//                                             itemBuilder: (BuildContext context,
//                                                 int index) {
//                                               return Container(
//                                                 width: 50.sp,
//                                                 margin:
//                                                     EdgeInsets.only(right: 5),
//                                                 child: ClipRRect(
//                                                   borderRadius:
//                                                       BorderRadius.circular(8),
//                                                   child: Image.file(
//                                                     controller.image[index],
//                                                     fit: BoxFit.cover,
//                                                   ),
//                                                 ),
//                                               );
//                                             },
//                                           ),
//                                         ),
//                                       ),
//                                 InkWell(
//                                   onTap: () {
//                                     controller.pickImage();
//                                   },
//                                   child: Container(
//                                     padding: EdgeInsets.all(15),
//                                     decoration: BoxDecoration(
//                                       borderRadius: BorderRadius.circular(10),
//                                       boxShadow: [
//                                         BoxShadow(
//                                             offset: Offset(0, 2),
//                                             blurRadius: 8,
//                                             spreadRadius: 1,
//                                             color:
//                                                 Colors.black.withOpacity(0.2))
//                                       ],
//                                       color: Colors.white,
//                                     ),
//                                     child: Image.asset(
//                                       AppIcons.add,
//                                       width: 20.sp,
//                                     ),
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                     SizedBox(height: 15.sp),
//                     Row(
//                       children: [
//                         InkWell(
//                           onTap: () {
//                             do{
//                               Get.back();
//                             }while(Get.isBottomSheetOpen??false);

//                             Get.bottomSheet(InstructionSheet(offer: offer), isScrollControlled: true,);
//                           },
//                           child: Text(
//                             "Skip Review",
//                             style: Helper.setTextStyle(16.sp, FontWeight.w600,
//                                 color: AppColors.theme),
//                           ),
//                         ),
//                         Spacer(flex: 2),
//                         Expanded(
//                           flex: 3,
//                           child: CustomBorderButton(
//                             title: "Submit",
//                             onTap: () async {
//                               Get.dialog(Loader());
//                               int reviewId =
//                               await ReviewService.postReview(
//                                   userId: AppStrings.userInfo.userInfo!.id!,
//                                   restaurantId: offer.restaurantId!,
//                                   offerId: offer.id!,
//                                   tasteRating:
//                                       _dashboardController.taste_rating.toInt(),
//                                   ambianceRating: _dashboardController
//                                       .ambiance_rating
//                                       .toInt(),
//                                   qualityRating: _dashboardController
//                                       .service_rating
//                                       .toInt(),
//                                   valueRating:
//                                       _dashboardController.value_rating.toInt(),
//                                   tags: _dashboardController.tagsList,
//                                   comment: controller.tfReview.text);
//                               if(reviewId!=-1 && controller.image.isNotEmpty)
//                                 await ReviewService.postImages(reviewId: reviewId, images: controller.image);

//                               Get.back();
//                               do{
//                                 Get.back();
//                               }while(Get.isBottomSheetOpen??false);
//                               Get.bottomSheet(
//                                 InstructionSheet(offer: offer,),
//                                 isScrollControlled: true,
//                               );
//                             },
//                           ),
//                         )
//                       ],
//                     ),
//                     SizedBox(height: 10.sp),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         );
//       },
//     );
//   }
// }
