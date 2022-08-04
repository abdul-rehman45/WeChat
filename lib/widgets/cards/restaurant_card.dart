// import 'package:esr/constants/app_colors.dart';
// import 'package:esr/constants/assets.dart';
// import 'package:esr/helper/helper.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_rating_bar/flutter_rating_bar.dart';
// import 'package:sizer/sizer.dart';

// class RestaurantCard extends StatefulWidget {
//   RestaurantCard(
//       {Key? key,
//       required this.name,
//       this.description,
//       this.logo,
//       this.price,
//       required this.rating,
//       this.qty,
//       required this.isdetail})
//       : super(key: key);

//   String name;
//   final String? description;
//   String? logo;
//   final double? price;
//   double? rating;
//   int? qty;
//   bool isdetail = true;

//   @override
//   State<RestaurantCard> createState() => _RestaurantCardState();
// }

// class _RestaurantCardState extends State<RestaurantCard> {
//   @override
//   void initState() {
//     super.initState();
//     widget.qty = 0;
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//         padding: EdgeInsets.symmetric(horizontal: 10.sp, vertical: 5.sp),
//         decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(10.sp),
//             boxShadow: [
//               Helper.setBoxShadow(blurradius: 5),
//             ],
//             color: Colors.white),
//         child: Row(
//           mainAxisAlignment: widget.isdetail == true
//               ? MainAxisAlignment.start
//               : MainAxisAlignment.center,
//           crossAxisAlignment: widget.isdetail == true
//               ? CrossAxisAlignment.start
//               : CrossAxisAlignment.center,
//           // mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             widget.logo != null && widget.logo != ""
//                 ? CircleAvatar(
//                     radius: 30.sp,
//                     backgroundImage: NetworkImage(widget.logo!),
//                   )
//                 : CircleAvatar(
//                     radius: 30.sp,
//                     backgroundImage: AssetImage(AppImages.logo),
//                   ),
//             SizedBox(
//               width: 10.sp,
//             ),
//             Expanded(
//               child: Column(
//                   mainAxisAlignment: widget.isdetail == true
//                       ? MainAxisAlignment.start
//                       : MainAxisAlignment.center,
//                   crossAxisAlignment: widget.isdetail == true
//                       ? CrossAxisAlignment.start
//                       : CrossAxisAlignment.start,
//                   children: [
//                     Text(
//                       widget.name,
//                       style: TextStyle(
//                         fontSize: 16.sp,
//                         fontWeight: FontWeight.w600,
//                         color: AppColors.text,
//                       ),
//                       softWrap: true,
//                       overflow: TextOverflow.ellipsis,
//                     ),
//                     widget.isdetail == true
//                         ? Text(
//                             widget.description ?? "",
//                             style: TextStyle(
//                               fontSize: 8.sp,
//                               fontWeight: FontWeight.w400,
//                               color: AppColors.text,
//                             ),
//                             softWrap: true,
//                             overflow: TextOverflow.ellipsis,
//                           )
//                         : SizedBox.shrink(),
//                     SizedBox(
//                       height: 5.sp,
//                     ),
//                     widget.isdetail == true
//                         ? Text(
//                             "${widget.price}",
//                             style: TextStyle(
//                               fontSize: 12.sp,
//                               fontWeight: FontWeight.w600,
//                               color: AppColors.text,
//                             ),
//                           )
//                         : SizedBox.shrink(),
//                     widget.isdetail == true
//                         ? Row(
//                             children: [
//                               RatingBarIndicator(
//                                 rating: widget.rating ?? 0,
//                                 itemBuilder: (context, index) => Icon(
//                                   Icons.star,
//                                   color: Colors.amber,
//                                 ),
//                                 itemCount: 5,
//                                 itemSize: 15.0,
//                                 direction: Axis.horizontal,
//                                 // unratedColor: color == Colors.white ? Colors.black : Colors.white,
//                               ),
//                             ],
//                           )
//                         : Row(
//                             children: [
//                               Icon(
//                                 Icons.star,
//                                 color: AppColors.text,
//                               ),
//                               Text(
//                                 "${widget.rating!.toStringAsFixed(1)}",
//                                 style: Helper.setTextStyle(
//                                     14.sp, FontWeight.w600,
//                                     color: AppColors.text),
//                               )
//                             ],
//                           )
//                   ]),
//             ),
//           ],
//         ));
//   }
// }
