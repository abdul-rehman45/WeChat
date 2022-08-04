
// import 'package:flutter/material.dart';
// import 'package:sizer/sizer.dart';

// class HomeDiscountCard extends StatefulWidget {
//   HomeDiscountCard({
//     Key? key,
//     this.onTap,
//    // required this.offer,
//   }) : super(key: key);

//   final VoidCallback? onTap;

//   //final OfferModel offer;

//   @override
//   State<HomeDiscountCard> createState() => _HomeDiscountCardState();
// }

// class _HomeDiscountCardState extends State<HomeDiscountCard> {
//   bool? isfav = false;
//   @override
//   Widget build(BuildContext context) {
   
//     return Padding(
//       padding: EdgeInsets.fromLTRB(0, 10, 10, 10),
//       child: InkWell(
//         onTap: widget.onTap,
//         child: Container(
//           width: 65.w,
//           height: 31.h,
//           decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(10),
//             boxShadow: [
//               BoxShadow(
//                   offset: Offset(-3, 3),
//                   blurRadius: 2,
//                   spreadRadius: 2,
//                   color: Color(0xffb9b9b9).withOpacity(0.2))
//             ],
//             color: Colors.white,
//           ),
//           child: Column(
//             mainAxisSize: MainAxisSize.min,
//             children: [
//               Expanded(
//                 child: Stack(
//                   children: [
//                     SizedBox(
//                       width: double.infinity,
//                       height: double.infinity,
//                       child: ClipRRect(
//                         borderRadius:
//                             BorderRadius.vertical(top: Radius.circular(10)),
//                         child: Image.network(
//                        "", //  your image
//                           fit: BoxFit.cover,
//                         ),
//                       ),
//                     ),
                 
//                     Positioned(
//                       bottom: 0,
//                       right: 0,
//                       child: Container(
//                         padding: EdgeInsets.all(10),
//                         child: RichText(
//                           textAlign: TextAlign.right,
//                           text: TextSpan(
//                               text:"", //"${widget.offer.discountPercentage ?? 0}",
//                               style: TextStyle(
//                                   fontSize: 22.sp,
//                                   fontWeight: FontWeight.w700,
//                                   color: Colors.white,
//                                   shadows: [
//                                     BoxShadow(
//                                         offset: Offset(3, 3),
//                                         blurRadius: 8,
//                                         spreadRadius: 2,
//                                         color: Colors.black),
//                                     BoxShadow(
//                                         offset: Offset(-3, -3),
//                                         blurRadius: 8,
//                                         spreadRadius: 2,
//                                         color: Colors.black),
//                                   ]),
//                               children: [
//                                 TextSpan(
//                                   text: "%",
//                                   style: TextStyle(fontSize: 16.sp),
//                                 ),
//                                 TextSpan(
//                                   text: "\nOFF",
//                                   style: TextStyle(
//                                       fontSize: 16.sp,
//                                       fontWeight: FontWeight.w600),
//                                 ),
//                               ]),
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//               Container(
//                 padding: EdgeInsets.all(9.sp),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Row(
//                       children: [
//                         widget.offer.restaurantLogo ==null
//                             ? CircleAvatar(
//                                 foregroundImage:
//                                     AssetImage(AppImages.profileImage),
//                                 radius: 15,
//                               )
//                             : CircleAvatar(
//                                 foregroundImage:
//                                     NetworkImage(widget.offer.restaurantLogo!),
//                               ),
//                         SizedBox(width: 5.sp),
//                         Expanded(
//                           child: Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             mainAxisAlignment: MainAxisAlignment.center,
//                             children: [
//                               Row(
//                                 mainAxisAlignment:
//                                     MainAxisAlignment.spaceBetween,
//                                 children: [
//                                   Expanded(
//                                     child: Text(
//                                       widget.offer.name ?? "",
//                                       overflow: TextOverflow.ellipsis,
//                                       style: Helper.setTextStyle(
//                                           14.sp, FontWeight.w600,
//                                           color: AppColors.text),
//                                     ),
//                                   ),
//                                   ReviewRating(
//                                     rating: widget.offer.rating!.avgRating,
//                                   ),
//                                 ],
//                               ),
//                               SizedBox(height: 2.sp),
//                               Row(
//                                 mainAxisAlignment:
//                                     MainAxisAlignment.spaceBetween,
//                                 children: [
//                                   Text(
//                                     widget.offer.restaurantCategory ?? "",
//                                     style: Helper.setTextStyle(
//                                         12.sp, FontWeight.w400,
//                                         color: AppColors.text.withOpacity(0.7)),
//                                   ),
//                                   Text(
//                                     "(${widget.offer.reviewsCount})",
//                                     style: Helper.setTextStyle(
//                                         12.sp, FontWeight.w400,
//                                         color: AppColors.text.withOpacity(0.7)),
//                                   ),
//                                 ],
//                               ),
//                             ],
//                           ),
//                         ),
//                       ],
//                     ),
//                   ],
//                 ),
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
