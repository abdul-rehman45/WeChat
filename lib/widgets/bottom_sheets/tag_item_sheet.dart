// import 'package:esr/Api/Module/offers/offer_model.dart';
// import 'package:esr/constants/app_colors.dart';
// import 'package:esr/constants/assets.dart';
// import 'package:esr/controller/dashboard/dashboard_controller.dart';
// import 'package:esr/helper/helper.dart';
// import 'package:esr/widgets/app_bar/inline_app_bar.dart';
// import 'package:esr/widgets/bottom_sheets/instruction_sheet.dart';
// import 'package:esr/widgets/bottom_sheets/rate_food_sheet.dart';
// import 'package:esr/widgets/button/custom_icon_button.dart';
// import 'package:esr/widgets/tags.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:sizer/sizer.dart';

// class TagItemSheet extends StatelessWidget {
//   TagItemSheet({Key? key, required this.offer}) : super(key: key);
//   final OfferModel offer;

//   final DashboardController _controller = Get.find();
//   TextEditingController tagSearchController = TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     return SingleChildScrollView(
//       child: Container(
//         color: Colors.white,
//         child: Column(
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             InLineAppBar(
//               showBack: true,
//               title: "Review",
//             ),
//             Padding(
//               padding: EdgeInsets.all(16.sp),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(
//                     "What did you have?",
//                     style: Helper.setTextStyle(16.sp, FontWeight.w700,
//                         color: AppColors.text),
//                   ),
//                   Divider(
//                     thickness: 2,
//                     color: AppColors.lightGrey,
//                   ),
//                   SizedBox(height: 5.sp),
//                   ExpansionTile(
//                     iconColor: AppColors.theme,
//                     title: Text(
//                       "Search for tags",
//                       style: Helper.setTextStyle(14.sp, FontWeight.w500,
//                           color: AppColors.text),
//                     ),
//                     children: <Widget>[
//                       CupertinoSearchTextField(
//                           controller: tagSearchController,
//                           backgroundColor: AppColors.theme,
//                           itemColor: Colors.white,
//                           placeholder: "Search for tags",
//                           placeholderStyle: Helper.setTextStyle(
//                             12.sp,
//                             FontWeight.w400,
//                             color: Colors.white,
//                           ),
//                           style: Helper.setTextStyle(
//                             12.sp,
//                             FontWeight.w400,
//                             color: Colors.white,
//                           ),
//                           onChanged: (value) {
//                             // _controller.tagsSearch(value);
//                             _controller.tagsList.refresh();
//                           }),
//                       Obx(
//                         () => ListView.builder(
//                           itemCount: _controller.tagsList.length,
//                           shrinkWrap: true,
//                           itemBuilder: (BuildContext context, int index) {
//                             return _controller.tagsList[index].name
//                                     .contains(tagSearchController.text)
//                                 ? InkWell(
//                                     onTap: () =>
//                                         _controller.tagsSelection(index),
//                                     child: Padding(
//                                       padding: const EdgeInsets.only(
//                                         left: 8,
//                                         bottom: 4,
//                                         top: 4,
//                                       ),
//                                       child: Row(
//                                         children: [
//                                           Text(
//                                             _controller.tagsList[index].name,
//                                             style: Helper.setTextStyle(
//                                                 12.sp, FontWeight.w400,
//                                                 color: AppColors.text),
//                                           ),
//                                           if (_controller
//                                               .tagsList[index].selected)
//                                             Icon(
//                                               Icons.check,
//                                               color: AppColors.theme,
//                                             ),
//                                         ],
//                                       ),
//                                     ),
//                                   )
//                                 : SizedBox.shrink();
//                           },
//                         ),
//                       ),
//                     ],
//                   ),
//                   SizedBox(height: 15.sp),
//                   Row(
//                     children: [
//                       Text(
//                         "Your tags",
//                         style: Helper.setTextStyle(10.sp, FontWeight.w400,
//                             color: AppColors.text.withOpacity(0.7)),
//                       ),
//                       Expanded(
//                         child: Container(
//                           height: 2.sp,
//                           color: AppColors.lightGrey,
//                         ),
//                       ),
//                     ],
//                   ),
//                   SizedBox(height: 10.sp),
//                   Obx(
//                     () => !_controller.anyTagSelected.value
//                         ? Center(
//                             child: Column(
//                               crossAxisAlignment: CrossAxisAlignment.center,
//                               children: [
//                                 Image.asset(
//                                   AppIcons.empty_search,
//                                   width: 48.sp,
//                                 ),
//                                 SizedBox(height: 8.sp),
//                                 Text(
//                                   "It’s a bit lonely here",
//                                   style: Helper.setTextStyle(
//                                       16.sp, FontWeight.w600,
//                                       color: AppColors.text),
//                                   textAlign: TextAlign.center,
//                                 ),
//                                 SizedBox(height: 4.sp),
//                                 Text(
//                                   "Use the search bar to find food items",
//                                   style: Helper.setTextStyle(
//                                     14.sp,
//                                     FontWeight.w400,
//                                     color: AppColors.text.withOpacity(0.7),
//                                   ),
//                                   textAlign: TextAlign.center,
//                                 ),
//                               ],
//                             ),
//                           )
//                         : Wrap(children: [
//                             for (int i = 0;
//                                 i < _controller.tagsList.length;
//                                 i++)
//                               if (_controller.tagsList[i].selected)
//                                 Tags(
//                                   title: _controller.tagsList[i].name,
//                                   onTap: () {
//                                     print("Tapped");
//                                     _controller.tagsList[i].selected =
//                                         !_controller.tagsList[i].selected;
//                                     _controller.tagsList.refresh();
//                                   },
//                                 ),
//                           ]
//                             // _controller.selectedTags
//                             //     .map((e) => Tags(
//                             //           title: e,
//                             //           onTap: () {},
//                             //         ))
//                             //     .toList(),
//                             // ),
//                             ),
//                   ),
//                   SizedBox(height: 25.sp),
//                   Row(
//                     children: [
//                       InkWell(
//                         onTap: () {
//                           // for(int i=0; i<_controller.sheetsCount;i++)
//                           //   Get.back();

//                           do {
//                             Get.back();
//                           } while (Get.isBottomSheetOpen ?? false);

//                           Get.bottomSheet(
//                             InstructionSheet(offer: offer),
//                             isScrollControlled: true,
//                           );
//                         },
//                         child: Text(
//                           "Skip Review",
//                           style: Helper.setTextStyle(16.sp, FontWeight.w600,
//                               color: AppColors.theme),
//                         ),
//                       ),
//                       Spacer(flex: 2),
//                       Expanded(
//                         flex: 3,
//                         child: CustomIconButton(
//                           showNextIcon: true,
//                           title: "Next",
//                           onTap: () {
//                             Get.bottomSheet(
//                                 RateFoodSheet(
//                                   offer: offer,
//                                 ),
//                                 isScrollControlled: true);
//                           },
//                         ),
//                       )
//                     ],
//                   )
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
