// import 'package:chat/UI/widgets/button/custom_button.dart';
// import 'package:chat/constants/app_colors.dart';
// import 'package:chat/helper/helper.dart';
// import 'package:flutter/material.dart';
// import 'package:sizer/sizer.dart';

// class OfferCard extends StatelessWidget {
//   const OfferCard(
//       {Key? key,
//       required this.discount,
//       required this.isBumper,
//       required this.onTap,
//       required this.onButtonTap})
//       : super(key: key);
//   final String discount;
//   final bool isBumper;

//   final VoidCallback? onTap;
//   final VoidCallback onButtonTap;
//   @override
//   @override
//   Widget build(BuildContext context) {
//     return InkWell(
//       onTap: onTap,
//       child: Container(
//           padding: EdgeInsets.all(10.sp),
//           decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(10.sp),
//               boxShadow: [
//                 Helper.setBoxShadow(blurradius: 5),
//               ],
//               color: Colors.white),
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
//                 RichText(
//                   text: TextSpan(
//                       text: discount,
//                       style: TextStyle(
//                         fontSize: 30.sp,
//                         fontWeight: FontWeight.w700,
//                         color: AppColors.theme,
//                       ),
//                       children: [
//                         TextSpan(
//                           text: " %",
//                           style: TextStyle(
//                             fontSize: 16.sp,
//                             fontWeight: FontWeight.w400,
//                             color: AppColors.theme,
//                           ),
//                         ),
//                       ]),
//                 ),
//                 Text(
//                   "Discount",
//                   style: TextStyle(
//                     fontSize: 16.sp,
//                     fontWeight: FontWeight.w400,
//                     color: AppColors.theme,
//                   ),
//                 ),
//               ]),
//               isBumper == true
//                   ? CustomButton(
//                       title: "Bumper activity",
//                       onTap: onButtonTap,
//                       padding: EdgeInsets.all(10.sp),
//                       textStyle: Helper.setTextStyle(
//                         12.sp,
//                         FontWeight.w700,
//                         color: Colors.white,
//                       ),
//                     )
//                   : InkWell(
//                       onTap: onButtonTap,
//                       child: Container(
//                         padding: EdgeInsets.all(10.sp),
//                         decoration: BoxDecoration(
//                             borderRadius: BorderRadius.circular(10.sp),
//                             boxShadow: [
//                               Helper.setBoxShadow(blurradius: 5),
//                             ],
//                             color: AppColors.theme),
//                         child: const Icon(
//                           Icons.favorite_outline,
//                           color: Colors.white,
//                           //size: 15,
//                         ),
//                       ),
//                     )
//             ],
//           )),
//     );
//   }
// }
