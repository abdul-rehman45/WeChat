
// import 'package:flutter/material.dart';
// import 'package:flutter_rating_bar/flutter_rating_bar.dart';
// import 'package:get/get.dart';
// import 'package:shimmer/shimmer.dart';
// import 'package:sizer/sizer.dart';

// class ReviewCardShimmer {
//   static Widget reviewcard({bool? istoprated = true}) {
//     return Column(
//       mainAxisAlignment: MainAxisAlignment.start,
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         istoprated == true
//             ? Padding(
//                 padding: EdgeInsets.only(
//                   bottom: 5.sp,
//                   top: 10.sp,
//                   left: 10.sp,
//                   right: 10.sp,
//                 ),
//                 child: Shimmer.fromColors(
//                   baseColor: Colors.grey.shade200,
//                   highlightColor: Colors.grey.shade100,
//                   child: Container(
//                     width: 150.sp,
//                     height: 20.sp,
//                     decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(10.sp),
//                       color: Colors.white,
//                     ),
//                   ),
//                 ),
//               )
//             : SizedBox.shrink(),
//         istoprated == true
//             ? Padding(
//                 padding:
//                     EdgeInsets.only(bottom: 5.sp, left: 10.sp, right: 10.sp),
//                 child: Shimmer.fromColors(
//                   baseColor: Colors.grey.shade200,
//                   highlightColor: Colors.grey.shade100,
//                   child: Divider(
//                     thickness: 1.sp,
//                     color: Colors.white,
//                   ),
//                 ),
//               )
//             : SizedBox.shrink(),
//         Container(
//             height: Get.height * 0.2.sp,
//             child: ListView.builder(
//                 shrinkWrap: true,
//                 itemCount: istoprated == true ? 3 : 5,
//                 physics: ScrollPhysics(),
//                 scrollDirection:
//                     istoprated == true ? Axis.horizontal : Axis.vertical,
//                 itemBuilder: (context, index) {
//                   return Container(
//                     width: Get.width * 0.7,
//                     padding:
//                         EdgeInsets.symmetric(horizontal: 10.sp, vertical: 5.sp),
//                     decoration: BoxDecoration(
//                       boxShadow: [Helper.setBoxShadow(blurradius: 3)],
//                       borderRadius: BorderRadius.circular(15),
//                       color: Colors.white,
//                     ),
//                     margin:
//                         EdgeInsets.symmetric(horizontal: 10.sp, vertical: 3.sp),
//                     //color: Colors.white,
//                     child: Shimmer.fromColors(
//                       baseColor: Colors.grey.shade200,
//                       highlightColor: Colors.grey.shade100,
//                       child: Column(
//                         mainAxisAlignment: MainAxisAlignment.start,
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Row(
//                             mainAxisAlignment: MainAxisAlignment.start,
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               Container(
//                                 width: 40.sp,
//                                 height: 40.sp,
//                                 decoration: BoxDecoration(
//                                     borderRadius: BorderRadius.circular(20.sp),
//                                     color: Colors.white),
//                               ),
//                               SizedBox(
//                                 width: 5.sp,
//                               ),
//                               Padding(
//                                 padding: EdgeInsets.only(top: 8.0),
//                                 child: Container(
//                                   width: 100.sp,
//                                   height: 15.sp,
//                                   decoration: BoxDecoration(
//                                     borderRadius: BorderRadius.circular(5.sp),
//                                     color: Colors.white,
//                                   ),
//                                 ),
//                               ),
//                             ],
//                           ),
//                           Padding(
//                             padding: EdgeInsets.only(top: 5.0, right: 30),
//                             child: Container(
//                               height: 15,
//                               decoration: BoxDecoration(
//                                 borderRadius: BorderRadius.circular(5.sp),
//                                 color: Colors.white,
//                               ),
//                             ),
//                           ),
//                           Padding(
//                             padding: EdgeInsets.only(top: 5.0, right: 50),
//                             child: Container(
//                               height: 15,
//                               decoration: BoxDecoration(
//                                 borderRadius: BorderRadius.circular(5.sp),
//                                 color: Colors.white,
//                               ),
//                             ),
//                           ),
//                           Padding(
//                             padding: EdgeInsets.only(top: 5.0, right: 75),
//                             child: Container(
//                               height: 15,
//                               decoration: BoxDecoration(
//                                 borderRadius: BorderRadius.circular(5.sp),
//                                 color: Colors.white,
//                               ),
//                             ),
//                           ),
//                           Padding(
//                             padding: EdgeInsets.only(
//                               top: 5.0,
//                             ),
//                             child: RatingBarIndicator(
//                               rating: 5,
//                               itemBuilder: (context, index) => Icon(
//                                 Icons.star,
//                                 color: AppColors.text,
//                               ),
//                               itemCount: 5,
//                               itemSize: 15.0,
//                               direction: Axis.horizontal,
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   );
//                 })),
//       ],
//     );
//   }

//   static Widget myreviewcard() {
//     return Container(
//         child: ListView.builder(
//             shrinkWrap: true,
//             itemCount: 5,
//             physics: ScrollPhysics(),
//             scrollDirection: Axis.vertical,
//             itemBuilder: (context, index) {
//               return Container(
//                 padding:
//                     EdgeInsets.symmetric(horizontal: 10.sp, vertical: 10.sp),
//                 margin: EdgeInsets.all(10.sp),
//                 decoration: BoxDecoration(
//                   boxShadow: [Helper.setBoxShadow(blurradius: 3)],
//                   borderRadius: BorderRadius.circular(15),
//                   color: Colors.white,
//                 ),
//                 child: Shimmer.fromColors(
//                   baseColor: Colors.grey.shade200,
//                   highlightColor: Colors.grey.shade100,
//                   child: Column(
//                     mainAxisAlignment: MainAxisAlignment.start,
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.start,
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Container(
//                             width: 30.sp,
//                             height: 30.sp,
//                             decoration: BoxDecoration(
//                                 borderRadius: BorderRadius.circular(15.sp),
//                                 color: Colors.white),
//                           ),
//                           SizedBox(
//                             width: 5.sp,
//                           ),
//                           Padding(
//                             padding: EdgeInsets.only(top: 8.0),
//                             child: Container(
//                               width: 100.sp,
//                               height: 15.sp,
//                               decoration: BoxDecoration(
//                                 borderRadius: BorderRadius.circular(5.sp),
//                                 color: Colors.white,
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                       Row(
//                         children: [
//                           Expanded(
//                             child: Padding(
//                               padding: EdgeInsets.only(top: 5.0, right: 30),
//                               child: Container(
//                                 height: 15.sp,
//                                 decoration: BoxDecoration(
//                                   borderRadius: BorderRadius.circular(5.sp),
//                                   color: Colors.white,
//                                 ),
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                       Row(
//                         children: [
//                           Expanded(
//                             child: Padding(
//                               padding: EdgeInsets.only(top: 5.0, right: 10),
//                               child: Container(
//                                 height: 15,
//                                 decoration: BoxDecoration(
//                                   borderRadius: BorderRadius.circular(5.sp),
//                                   color: Colors.white,
//                                 ),
//                               ),
//                             ),
//                           ),
//                           Padding(
//                             padding: EdgeInsets.only(
//                               top: 5.0,
//                             ),
//                             child: RatingBarIndicator(
//                               rating: 5,
//                               itemBuilder: (context, index) => Icon(
//                                 Icons.star,
//                                 color: AppColors.text,
//                               ),
//                               itemCount: 5,
//                               itemSize: 15.0,
//                               direction: Axis.horizontal,
//                             ),
//                           ),
//                         ],
//                       ),
//                       SizedBox(
//                         height: 20,
//                       )
//                     ],
//                   ),
//                 ),
//               );
//             }));
//   }

//   static Widget retaurantRatingCard() {
//     return Column(
//       children: [
//         Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             Expanded(child: ratingcard()),
//             SizedBox(
//               width: 10.sp,
//             ),
//             Expanded(child: ratingcard()),
//           ],
//         ),
//         SizedBox(height: 10.sp),
//         Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             Expanded(child: ratingcard()
//                 //   _ratingcard(
//                 //       title: "Service",
//                 //       color: AppColors.theme,
//                 //       ratingtext: "4.0",
//                 //       rating: 4),
//                 ),
//             SizedBox(width: 10.sp),
//             Expanded(child: ratingcard()),
//           ],
//         ),
//         reviewcard(),
//       ],
//     );
//   }

//   static Widget ratingcard() {
//     return Container(
//         height: 100.sp,
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(10.sp),
//           boxShadow: [Helper.setBoxShadow(blurradius: 5)],
//           color: Colors.white,
//         ),
//         child: Shimmer.fromColors(
//             baseColor: Colors.grey.shade200,
//             highlightColor: Colors.grey.shade100,
//             child: Container(
//               margin: EdgeInsets.all(1.sp),
//               padding: EdgeInsets.all(10.sp),
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(10.sp),
//               ),
//               child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Container(
//                       height: 20,
//                       width: 100,
//                       decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular(5.sp),
//                           color: Colors.white),
//                     ),
//                     Spacer(),
//                     Container(
//                       height: 20,
//                       width: 35,
//                       decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular(5.sp),
//                           color: Colors.white),
//                     ),
//                     RatingBarIndicator(
//                         rating: 4,
//                         itemBuilder: (context, index) => Icon(
//                               Icons.star,
//                               color: Colors.white,
//                             ),
//                         itemCount: 5,
//                         itemSize: 15.0,
//                         direction: Axis.horizontal,
//                         unratedColor: Colors.white),
//                   ]),
//             )));
//   }
// }
