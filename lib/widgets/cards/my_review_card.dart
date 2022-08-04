// import 'package:flutter/material.dart';

// import 'package:sizer/sizer.dart';

// class MyReviewCard extends StatelessWidget {
//   const MyReviewCard({
//     Key? key,
//     this.logo,
//     required this.title,
//     required this.description,
//     required this.time,
//     required this.rating,
//     required this.isMyReview,
//     this.onTap,
//   }) : super(key: key);
//   final String? logo;
//   final String title, description, time;
//   final double rating;
//   final bool isMyReview;
//   final VoidCallback? onTap;

//   @override
//   Widget build(BuildContext context) {
//     return InkWell(
//       onTap: onTap,
//       child: Container(
//         decoration: BoxDecoration(
//             color: Colors.white,
//             borderRadius: BorderRadius.circular(15),
//             boxShadow: [
//               Helper.setBoxShadow(blurradius: 3.sp)
//               // BoxShadow(
//               //     offset: Offset(0, 2),
//               //     blurRadius: 8,
//               //     spreadRadius: 1,
//               //     color: Colors.black.withOpacity(0.2))
//             ]),
//         padding: EdgeInsets.all(15.sp),
//         margin: isMyReview == true
//             ? EdgeInsets.fromLTRB(12.sp, 0, 12.sp, 12.sp)
//             : EdgeInsets.only(right: 10.sp),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Row(
//               children: [
//                 logo != null && logo != ""
//                     ? CircleAvatar(
//                         backgroundColor: Colors.white,
//                         foregroundImage: NetworkImage(logo!),
//                       )
//                     : CircleAvatar(
//                         backgroundColor: Colors.white,
//                         foregroundImage: AssetImage(AppIcons.person),
//                       ),
//                 SizedBox(width: 5.sp),
//                 SizedBox(
//                   width: 150,
//                   child: Text(
//                     title,
//                     style: Helper.setTextStyle(14.sp, FontWeight.w600,
//                         color: AppColors.text),
//                     overflow: TextOverflow.ellipsis,
//                   ),
//                 ),
//                 const Spacer(),
//                 Text(
//                   time,
//                   style: Helper.setTextStyle(14.sp, FontWeight.w400,
//                       color: AppColors.text),
//                 ),
//               ],
//             ),
//             SizedBox(height: 8.sp),
//             isMyReview == true
//                 ? Row(
//                     children: [
//                       Expanded(
//                         child: Text(
//                           description,
//                           overflow: TextOverflow.ellipsis,
//                           style: Helper.setTextStyle(14.sp, FontWeight.w400,
//                               color: AppColors.text),
//                         ),
//                       ),
//                       Text(
//                         rating.toStringAsFixed(2),
//                         style: Helper.setTextStyle(14.sp, FontWeight.w400,
//                             color: AppColors.theme),
//                       ),
//                       SizedBox(width: 2.sp),
//                       RatingBarIndicator(
//                         rating: double.parse(rating.toStringAsFixed(1)),
//                         itemBuilder: (context, index) => const Icon(
//                           Icons.star,
//                           color: Colors.amber,
//                         ),
//                         itemCount: 5,
//                         itemSize: 15.0,
//                         direction: Axis.horizontal,
//                       ),
//                     ],
//                   )
//                 : Expanded(
//                     child: Wrap(
//                       children: [
//                         Text(
//                           description,
//                           overflow: TextOverflow.ellipsis,
//                           // textAlign: TextAlign.justify,
//                           // softWrap: true,
//                           maxLines: 4,
//                           style: Helper.setTextStyle(12.sp, FontWeight.w400,
//                               color: AppColors.text),
//                         ),
//                       ],
//                     ),
//                   ),
//             SizedBox(
//               height: 5.sp,
//             ),
//             isMyReview != true
//                 ? Row(
//                     children: [
//                       Text(
//                         rating.toStringAsFixed(1),
//                         style: Helper.setTextStyle(14.sp, FontWeight.w400,
//                             color: AppColors.theme),
//                       ),
//                       SizedBox(width: 2.sp),
//                       RatingBarIndicator(
//                         rating: rating,
//                         itemBuilder: (context, index) => Icon(
//                           Icons.star,
//                           color: AppColors.text,
//                         ),
//                         itemCount: 5,
//                         itemSize: 15.0,
//                         direction: Axis.horizontal,
//                       ),
//                     ],
//                   )
//                 : const SizedBox.shrink(),
//           ],
//         ),
//       ),
//     );
//   }
// }
