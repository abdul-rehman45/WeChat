// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:shimmer/shimmer.dart';
// import 'package:sizer/sizer.dart';

// class RestaurantCardShimmer {
//   static Widget restaurantcard({bool? istoprated = true}) {
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
//             : const SizedBox.shrink(),
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
//             : const SizedBox.shrink(),
//         SizedBox(
//             height: istoprated == true ? Get.height * 0.1.sp : null,
//             child: ListView.builder(
//                 padding: EdgeInsets.zero,
//                 shrinkWrap: true,
//                 itemCount: istoprated == true ? 3 : 5,
//                 physics: const ScrollPhysics(),
//                 scrollDirection:
//                     istoprated == true ? Axis.horizontal : Axis.vertical,
//                 itemBuilder: (context, index) {
//                   return Container(
//                       width: istoprated == true
//                           ? Get.width * 0.8
//                           : double.infinity,
//                       decoration: BoxDecoration(
//                         boxShadow: [Helper.setBoxShadow(blurradius: 3)],
//                         borderRadius: BorderRadius.circular(15),
//                         color: Colors.white,
//                       ),
//                       padding: EdgeInsets.symmetric(
//                           horizontal: 10.sp, vertical: 5.sp),
//                       margin: const EdgeInsets.symmetric(
//                           horizontal: 10, vertical: 5),
//                       child: Shimmer.fromColors(
//                           baseColor: Colors.grey.shade200,
//                           highlightColor: Colors.grey.shade100,
//                           child: Row(
//                             children: [
//                               Container(
//                                 width: 60.sp,
//                                 height: 60.sp,
//                                 decoration: BoxDecoration(
//                                     borderRadius: BorderRadius.circular(30.sp),
//                                     color: Colors.white),
//                               ),
//                               SizedBox(
//                                 width: 10.sp,
//                               ),
//                               Column(
//                                 mainAxisAlignment: MainAxisAlignment.center,
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: [
//                                   Container(
//                                     width: 100.sp,
//                                     height: 20.sp,
//                                     decoration: BoxDecoration(
//                                       borderRadius:
//                                           BorderRadius.circular(10.sp),
//                                       color: Colors.white,
//                                     ),
//                                   ),
//                                   SizedBox(
//                                     height: 5.sp,
//                                   ),
//                                   Container(
//                                     width: 30.sp,
//                                     height: 15.sp,
//                                     decoration: BoxDecoration(
//                                       borderRadius:
//                                           BorderRadius.circular(10.sp),
//                                       color: Colors.white,
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             ],
//                           )));
//                 })),
//       ],
//     );
//   }
// }
