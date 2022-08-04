// import 'package:flutter/material.dart';
// import 'package:shimmer/shimmer.dart';
// import 'package:sizer/sizer.dart';

// class CardShimmer {
//   static Widget card({
//     bool? iscircle = false,
//     bool? ismyfav = false,
//   }) {
//     return ListView.builder(
//         shrinkWrap: true,
//         itemCount: 5,
//         padding: EdgeInsets.zero,
//         physics: ScrollPhysics(),
//         scrollDirection: Axis.vertical,
//         itemBuilder: (context, index) {
//           return Container(
//               width: double.infinity,
//               padding: EdgeInsets.symmetric(horizontal: 10.sp, vertical: 10.sp),
//               margin: EdgeInsets.all(10.sp),
//               decoration: BoxDecoration(
//                 boxShadow: [Helper.setBoxShadow(blurradius: 3)],
//                 borderRadius: BorderRadius.circular(15),
//                 color: Colors.white,
//               ),
//               child: Shimmer.fromColors(
//                   baseColor: Colors.grey.shade200,
//                   highlightColor: Colors.grey.shade100,
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.start,
//                     children: [
//                       iscircle != false
//                           ? Container(
//                               width: 60.sp,
//                               height: 60.sp,
//                               decoration: BoxDecoration(
//                                   borderRadius: BorderRadius.circular(30.sp),
//                                   color: Colors.white),
//                             )
//                           : SizedBox.shrink(),
//                       SizedBox(
//                         width: iscircle != false ? 10.sp : 0,
//                       ),
//                       Column(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Container(
//                             width: 100.sp,
//                             height: 20.sp,
//                             decoration: BoxDecoration(
//                               borderRadius: BorderRadius.circular(10.sp),
//                               color: Colors.white,
//                             ),
//                           ),
//                           SizedBox(
//                             height: 5.sp,
//                           ),
//                           Container(
//                             width: 30.sp,
//                             height: 15.sp,
//                             decoration: BoxDecoration(
//                               borderRadius: BorderRadius.circular(10.sp),
//                               color: Colors.white,
//                             ),
//                           ),
//                         ],
//                       ),
//                       Spacer(),
//                       iscircle != false
//                           ? SizedBox.shrink()
//                           : ismyfav != true
//                               ? Container(
//                                   width: 70.sp,
//                                   height: 30.sp,
//                                   decoration: BoxDecoration(
//                                     borderRadius: BorderRadius.circular(10.sp),
//                                     color: Colors.white,
//                                   ),
//                                 )
//                               : Image.asset(AppIcons.favorite,
//                                   width: 24.sp, color: Colors.white)
//                     ],
//                   )));
//         });
//   }
// }
