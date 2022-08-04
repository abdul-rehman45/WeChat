// import 'package:esr/constants/app_colors.dart';
// import 'package:esr/helper/helper.dart';
// import 'package:esr/widgets/button/custom_button.dart';
// import 'package:flutter/material.dart';
// import 'package:sizer/sizer.dart';

// class UsedDiscountCard extends StatelessWidget {
//   const UsedDiscountCard({
//     Key? key,
//     this.iconPath,
//     required this.title,
//     required this.off,
//     required this.time,
//   }) : super(key: key);
//   final String? iconPath;
//   final String title, off, time;

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       decoration: BoxDecoration(
//           color: Colors.white,
//           borderRadius: BorderRadius.circular(15),
//           boxShadow: [
//             BoxShadow(
//                 offset: Offset(0, 2),
//                 blurRadius: 8,
//                 spreadRadius: 1,
//                 color: Colors.black.withOpacity(0.2))
//           ]),
//       padding: EdgeInsets.symmetric(horizontal: 10.sp, vertical: 15.sp),
//       margin: EdgeInsets.fromLTRB(12.sp, 0, 12.sp, 12.sp),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Row(
//             children: [
//               if (iconPath != null || iconPath != "")
//                 CircleAvatar(
//                   foregroundImage: NetworkImage(iconPath!),
//                 ),
//               SizedBox(width: 5.sp),
//               Expanded(
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text(
//                       title,
//                       overflow: TextOverflow.ellipsis,
//                       style: Helper.setTextStyle(14.sp, FontWeight.w600,
//                           color: AppColors.text),
//                     ),
//                     SizedBox(height: 2.sp),
//                     Text(
//                       time,
//                       style: Helper.setTextStyle(10.sp, FontWeight.w400,
//                           color: AppColors.text),
//                     ),
//                   ],
//                 ),
//               ),
//               SizedBox(width: 5.sp),
//               CustomButton(
//                   title: "${off.toString().substring(0, 2)}%OFF", onTap: () {})
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }
