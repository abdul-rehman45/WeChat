import 'package:chat/constants/app_colors.dart';
import 'package:chat/helper/helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NotificationCard extends StatelessWidget {
  const NotificationCard(
      {Key? key,
      this.logo,
      this.title,
      this.offer,
      this.descrption,
      this.image})
      : super(key: key);
  final String? logo, title, offer, image, descrption;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
          boxShadow: [Helper.setBoxShadow(blurradius: 5)],
          borderRadius: BorderRadius.circular(20),
          color: Colors.white),
      child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: Row(
                    children: [
                      CircleAvatar(
                        radius: 20,
                        backgroundImage: NetworkImage(
                          logo ??
                              "https://media-exp1.licdn.com/dms/image/C511BAQEtFclPL5sppQ/company-background_10000/0/1568823629493?e=2147483647&v=beta&t=4OqNCeof7tf7IzChVpUHTATKJHXAxPUPVD0pEKjwLcM",
                        ),
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      Expanded(
                        child: Text(
                          title ?? "Daily Deli Co ",
                          style: Helper.setTextStyle(
                            14,
                            FontWeight.w600,
                            color: //AppColors.
                                const Color(0xff4A4A68),
                          ),
                          //softWrap: true,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Container(
                        alignment: Alignment.topRight,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: AppColors.theme,
                        ),
                        padding: const EdgeInsets.all(8),
                        child: Text(
                          offer ?? "Flat 20% off",
                          style: Helper.setTextStyle(14, FontWeight.normal,
                              color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ),
                // Icon(
                //   Icons.cancel,
                //   color: AppColors.theme,
                // ),
              ],
            ),
            const Divider(),
            Container(
              height: 100.w,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
              ),
              clipBehavior: Clip.hardEdge,
              child: Image.network(
                image ??
                    "https://media-exp1.licdn.com/dms/image/C511BAQEtFclPL5sppQ/company-background_10000/0/1568823629493?e=2147483647&v=beta&t=4OqNCeof7tf7IzChVpUHTATKJHXAxPUPVD0pEKjwLcM",
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Text(
                descrption ??
                    "This is notification descriptoon. this is notification description",
                style: Helper.setTextStyle(
                  14,
                  FontWeight.w400,
                  color: const Color(0xff4A4A68),
                ),
                textAlign: TextAlign.justify,
              ),
            ),
          ]),
    );
  }
}
