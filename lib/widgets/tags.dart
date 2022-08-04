import 'package:chat/constants/app_colors.dart';
import 'package:chat/helper/helper.dart';
import 'package:flutter/material.dart';

class Tags extends StatelessWidget {
  const Tags({Key? key, required this.title, required this.onTap})
      : super(key: key);

  final String title;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 5),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6),
          border: Border.all(color: AppColors.theme)),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(width: 8),
          Text(
            title,
            style:
                Helper.setTextStyle(12, FontWeight.w400, color: AppColors.text),
          ),
          InkWell(
            onTap: onTap,
            child: const Padding(
              padding: EdgeInsets.all(8.0),
              child: Icon(
                Icons.close,
                color: AppColors.text,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
