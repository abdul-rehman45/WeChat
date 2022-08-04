import 'package:chat/constants/app_colors.dart';
import 'package:flutter/material.dart';

class ReviewRating extends StatelessWidget {
  const ReviewRating({Key? key, this.rating}) : super(key: key);
  final double? rating;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        // add asset Icon
        // Image.asset(
        //   AppIcons.star3,
        //   width: 10,
        // ),
        const Icon(
          Icons.star,
          size: 10,
        ),
        const SizedBox(width: 2),
        RichText(
          textAlign: TextAlign.right,
          text: TextSpan(
              text: rating != null ? rating!.toStringAsFixed(1) : "0",
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: AppColors.text,
              ),
              children: [
                TextSpan(
                  text: "/5",
                  style: TextStyle(
                      fontSize: 12, color: AppColors.text.withOpacity(0.7)),
                ),
              ]),
        ),
      ],
    );
  }
}
