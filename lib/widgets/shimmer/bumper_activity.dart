// import 'package:flutter/material.dart';
// import 'package:shimmer/shimmer.dart';
// import 'package:sizer/sizer.dart';

// class BumperActivityCardShimmer {
//   static Widget restaurantcard({
//     bool? isNotification = false,
//     bool? isScrollHorizantal = true,
//     int? itemlenght,
//   }) {
//     return Container(
//         height: isScrollHorizantal != false ? null : SizerUtil.height * 0.31,
//         child: ListView.builder(
//             shrinkWrap: true,
//             itemCount: itemlenght ?? 5,
//             physics: ScrollPhysics(),
//             scrollDirection:
//                 isScrollHorizantal != false ? Axis.vertical : Axis.horizontal,
//             itemBuilder: (context, index) {
//               return Container(
//                 padding:
//                     EdgeInsets.symmetric(horizontal: 10.sp, vertical: 2.sp),
//                 color: Colors.white,
//                 width: isScrollHorizantal != false
//                     ? double.infinity
//                     : SizerUtil.height * 0.3,
//                 child: Shimmer.fromColors(
//                   baseColor: Colors.grey.shade200,
//                   highlightColor: Colors.grey.shade100,
//                   child: Column(
//                       mainAxisAlignment: MainAxisAlignment.start,
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         isNotification != false
//                             ? Row(
//                                 children: [
//                                   Container(
//                                     width: 40.sp,
//                                     height: 40.sp,
//                                     decoration: BoxDecoration(
//                                         borderRadius:
//                                             BorderRadius.circular(20.sp),
//                                         color: Colors.white),
//                                   ),
//                                   SizedBox(
//                                     width: 10.sp,
//                                   ),
//                                   Column(
//                                     crossAxisAlignment:
//                                         CrossAxisAlignment.start,
//                                     children: [
//                                       Container(
//                                         width: 100.sp,
//                                         height: 20.sp,
//                                         decoration: BoxDecoration(
//                                           borderRadius:
//                                               BorderRadius.circular(10.sp),
//                                           color: Colors.white,
//                                         ),
//                                       ),
//                                       SizedBox(
//                                         height: 5.sp,
//                                       ),
//                                       Container(
//                                         width: 30.sp,
//                                         height: 15.sp,
//                                         decoration: BoxDecoration(
//                                           borderRadius:
//                                               BorderRadius.circular(10.sp),
//                                           color: Colors.white,
//                                         ),
//                                       ),
//                                     ],
//                                   ),
//                                   Spacer(),
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
//                               )
//                             : SizedBox.shrink(),
//                         Container(
//                           width: isScrollHorizantal != false
//                               ? double.infinity
//                               : SizerUtil.height * 0.3,
//                           height: 100.sp,
//                           decoration: BoxDecoration(
//                             borderRadius: BorderRadius.circular(10.sp),
//                             color: Colors.white,
//                           ),
//                         ),
//                         SizedBox(
//                           height: 5.sp,
//                         ),
//                         isNotification != true
//                             ? Row(
//                                 children: [
//                                   Container(
//                                     width: 40.sp,
//                                     height: 40.sp,
//                                     decoration: BoxDecoration(
//                                         borderRadius:
//                                             BorderRadius.circular(20.sp),
//                                         color: Colors.white),
//                                   ),
//                                   SizedBox(
//                                     width: 10.sp,
//                                   ),
//                                   Expanded(
//                                     child: Column(
//                                       // mainAxisSize: MainAxisSize.max,
//                                       crossAxisAlignment:
//                                           CrossAxisAlignment.start,
//                                       children: [
//                                         Container(
//                                           height: 20.sp,
//                                           decoration: BoxDecoration(
//                                             borderRadius:
//                                                 BorderRadius.circular(10.sp),
//                                             color: Colors.white,
//                                           ),
//                                         ),
//                                         SizedBox(
//                                           height: 5.sp,
//                                         ),
//                                         Container(
//                                           width: 30.sp,
//                                           height: 15.sp,
//                                           decoration: BoxDecoration(
//                                             borderRadius:
//                                                 BorderRadius.circular(10.sp),
//                                             color: Colors.white,
//                                           ),
//                                         ),
//                                       ],
//                                     ),
//                                   ),
//                                   //Spacer(),
//                                   isScrollHorizantal != false
//                                       ? Padding(
//                                           padding: EdgeInsets.only(left: 8.0),
//                                           child: Container(
//                                             width: 30.sp,
//                                             height: 15.sp,
//                                             decoration: BoxDecoration(
//                                               borderRadius:
//                                                   BorderRadius.circular(10.sp),
//                                               color: Colors.white,
//                                             ),
//                                           ),
//                                         )
//                                       : SizedBox.shrink(),
//                                 ],
//                               )
//                             : SizedBox.shrink(),
//                       ]),
//                 ),
//               );
//             }));
//   }
// }
