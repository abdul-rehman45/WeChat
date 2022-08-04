import 'package:chat/constants/app_colors.dart';
import 'package:flutter/material.dart';

class MessageTile extends StatelessWidget {
  MessageTile(
      {Key? key,
      this.imageUrl,
      this.isNetwork = false,
      this.isRead = false,
      this.online = false,
      this.message,
      this.name,
      this.time,
      this.onTap,
      this.unreadCount})
      : super(key: key);
  String? name, message, time, imageUrl;
  int? unreadCount;
  bool isNetwork;
  final bool isRead, online;
  VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        color: isRead == true ? AppColors.bgColor : AppColors.messageBg,
        child: Column(
          children: [
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: Row(
                children: [
                  ImageAvatar(
                    image: imageUrl,
                    isNetwork: isNetwork,
                    size: MediaQuery.of(context).size.width * 0.15,
                    isOnline: online,
                    isChat: true,
                  ),
                  const SizedBox(width: 15),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          name ?? '',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: Colors.black,
                          ),
                        ),
                        const SizedBox(height: 6),
                        Text(
                          message ?? '',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: AppColors.textColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Column(
                    children: [
                      Text(
                        time ?? '',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: AppColors.textColor,
                        ),
                      ),
                      const SizedBox(height: 10),
                      if (unreadCount != null && isRead == false)
                        unreadCount! > 0
                            ? CountCircle(
                                size: 18,
                                count: unreadCount,
                              )
                            : Container(),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            Divider(
              height: 1,
              thickness: 1,
              color: AppColors.lightBlue,
            ),
          ],
        ),
      ),
    );
  }
}

// class AppColors {
//   static Color lightGreen = Color(0xFF45E3D5);
//   static Color tfBorder = Color(0xFFCAE6FD);
//   static Color grey = Color(0xFF787878);
//   static Color black = Color(0xFF383838);
//   static Color white = Color(0xFFFFFFFF);

//   static Color lightBlue = Color(0xFFCAE6FD);
//   static Color bgColor = Color(0xFFF9FCFF);
//   static Color graphBg = Color(0xFFEBF6FF);
//   static Color dialogColor = white;
//   static Color textColor = Color(0xFF383838);
//   static Color greyTextColor = Color(0xFF656565);
//   static Color g2Color = Color(0xFF00CAE8);
//   static Color g3Color = Color(0xFF00ACF1);
//   static Color g4Color = Color(0xFF4689E4);
//   static Color g5Color = Color(0xFF8760BD);
//   static Color g6Color = Color(0xFFA22F80);
//   static Color iconBgColor = Color(0xFFA9D9FF);
//   static Color shadowColor = Color(0xFF005190);
//   static Color onlineColor = Color(0xFF65E345);
//   static Color oflineColor = Color(0xFFBDBDBD);
//   static Color messageBg = Color(0xFFE8F5FF);
//   static Color red = Color(0xFFD62D30);
//   static Color orange = Color(0xFFF8981D);
//   static Color barColor = iconBgColor;
//   static Color monthsBg = white;
//   // static Color itemDetailBg = Color(0xFFC4C4C4);

//   static setThemeColor(bool isDark) {
//     // print("isdark ......$isDark");
//     bgColor = isDark ? Color(0xFF1E2429) : Color(0xFFF9FCFF);
//     textColor = isDark ? white : Color(0xFF383838);
//     dialogColor = isDark ? Color(0xFF2F353A) : white;
//     iconBgColor = isDark ? dialogColor : Color(0xFFA9D9FF);
//     greyTextColor = isDark ? white : Color(0xFF656565);
//     shadowColor = isDark ? Color(0xFF252C32) : Color(0xFF005190);
//     messageBg = isDark ? Color(0xFF2F353A) : Color(0xFFE8F5FF);
//     graphBg = isDark ? Color(0xFF2D3338) : Color(0xFFEBF6FF);
//     barColor = isDark ? Color(0xFF434A50) : Color(0xFFA9D9FF);
//     monthsBg = isDark ? Color(0xFF434A50) : white;
//     // itemDetailBg = isDark ? Color(0xFF2D3338) : Color(0xFFF9FCFF);
//   }
// }

class CountCircle extends StatelessWidget {
  CountCircle({Key? key, this.size = 25, this.count}) : super(key: key);
  final double size;
  int? count;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size,
      width: size,
      decoration: const BoxDecoration(
        color: AppColors.lightGreen,
        shape: BoxShape.circle,
      ),
      child: Center(
        child: Text(
          count?.toString() ?? '0',
          style: const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}

class ImageAvatar extends StatelessWidget {
  ImageAvatar({
    Key? key,
    this.image,
    this.name,
    this.size = 30,
    this.iconTap,
    this.onImageTap,
    this.isNetwork = true,
    this.showCamera = false,
    this.showDelete = false,
    this.isSelected = false,
    this.isChat = false,
    this.isOnline = false,
  }) : super(key: key);
  final double size;
  String? image, name;
  final VoidCallback? iconTap, onImageTap;

  final bool isNetwork;
  final bool showCamera;
  final bool isSelected;
  final bool showDelete;
  final bool isChat;
  final bool isOnline;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Stack(
          fit: StackFit.loose,
          clipBehavior: Clip.none,
          children: [
            Positioned(
              child: Center(
                child: GestureDetector(
                  onTap: onImageTap,
                  child: image != null
                      ? Container(
                          height: size,
                          width: size,
                          decoration: BoxDecoration(
                            color: AppColors.iconBgColor,
                            //color: Color.alphaBlend(AppColors.bgColor, Colors.grey),
                            shape: BoxShape.circle,
                            image: DecorationImage(
                              image:
                                  // image != null
                                  // ?
                                  NetworkImage(image!),
                              // : Image.asset(
                              //     AppIcons.buddyLogo,
                              //   ).image,
                              fit: BoxFit.cover,
                            ),
                            border: isSelected
                                ? Border.all(
                                    color: AppColors.lightGreen, width: 4)
                                : null,
                          ),
                          // child: image != null
                          //     ? Image.network(image!)
                          //     : Image.asset(AppIcons.buddyLogo),
                        )
                      : CircleAvatar(
                          radius: size / 2,
                          backgroundColor: AppColors.iconBgColor,
                          child: const Icon(Icons.person)),
                ),
              ),
            ),
            if (showCamera)
              // Positioned(
              //   bottom: 5,
              //   // right: -40,
              //   // left: 50,
              //   left: MediaQuery.of(context).size.width * 0.56,
              //   child: ImagePickerDialogItem(
              //     width: 40,
              //     image: Icon(Icons.camera),
              //     isNetwork: false,
              //     withtitle: false,
              //     onTap: iconTap,
              //   ),
              // ),
              if (showDelete)
                Positioned(
                  top: -5,
                  right: -10,
                  left: 50,
                  child: InkWell(
                    onTap: iconTap,
                    child: Container(
                      height: 25,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: AppColors.iconBgColor,
                      ),
                      child: const Center(
                        child: Icon(
                          Icons.close,
                          color: Colors.white,
                          size: 20,
                        ),
                      ),
                    ),
                  ),
                ),
            if (isChat)
              Positioned(
                bottom: 2,
                right: -(size / 4),
                left: size / 2,
                child: Container(
                  height: size / 4,
                  padding: const EdgeInsets.all(2),
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: isOnline
                          ? AppColors.onlineColor
                          : AppColors.oflineColor,
                    ),
                  ),
                ),
              ),
          ],
        ),
        if (name != null)
          Flexible(
            child: Container(
              margin: const EdgeInsets.only(top: 5),
              padding: const EdgeInsets.only(left: 5),
              width: size,
              child: Text(
                "$name",
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 14,
                    color: AppColors.textColor,
                    fontWeight: FontWeight.w400),
              ),
            ),
          ),
      ],
    );

    // child: isNetwork
    //     ? CircleAvatar(
    //         radius: size,
    //         backgroundImage: NetworkImage(
    //           image ?? AppImages.defaultDog,
    //         ),
    //       )
    //     : CircleAvatar(
    //         radius: size,
    //         backgroundImage: AssetImage(image ?? ''),
    //       ),
  }
}
