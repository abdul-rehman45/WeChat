import 'package:chat/constants/app_colors.dart';
import 'package:chat/constants/constants.dart';
import 'package:flutter/material.dart';

class OutgoingMsgCard extends StatefulWidget {
  final String? outgoingMsgTx;
  final String? dataAndTimeTx;
  final bool? isRead;
  final bool isMedia;
  final bool? isLast;
  final String? mediaUrl;
  final String? type;

  const OutgoingMsgCard(
      {this.outgoingMsgTx,
      this.dataAndTimeTx,
      this.mediaUrl,
      this.isRead = false,
      this.isLast = false,
      this.isMedia = false,
      this.type});

  @override
  State<OutgoingMsgCard> createState() => _OutgoingMsgCardState();
}

class _OutgoingMsgCardState extends State<OutgoingMsgCard> {
  bool showMore = false;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: widget.type == "text"
          ? Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    SizedBox(width: AppGlobals.screenWidth * 0.1),
                    Flexible(
                      child: Container(
                        padding: const EdgeInsets.all(10),
                        margin: const EdgeInsets.all(3),
                        // width: AppGlobals.screenWidth * 0.7,
                        decoration: BoxDecoration(
                          color: AppColors.messageBg,
                          borderRadius: const BorderRadius.only(
                            topRight: Radius.circular(10),
                            topLeft: Radius.circular(10),
                            bottomLeft: Radius.circular(10),
                          ),
                          gradient: LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: [
                              // AppColors.g6Color,
                              // AppColors.g4Color,
                              AppColors.g3Color,
                              AppColors.g5Color,

                              // AppColors.g2Color,
                              // AppColors.lightGreen,
                            ],
                          ),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                const Icon(
                                  Icons.person,
                                  size: 8,
                                ),
                                const SizedBox(width: 4),
                                Text(
                                  widget.dataAndTimeTx ?? '',
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400,
                                    color: AppColors.white,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 6),
                            widget.outgoingMsgTx != null
                                ? widget.outgoingMsgTx!.length >= 200 &&
                                        !showMore
                                    ? SelectableText(
                                        widget.outgoingMsgTx!
                                                .substring(0, 200) +
                                            "....",
                                        // "${showMore ? '' : ' ....'}",
                                        // maxLines: showMore ? null : 8,
                                        textAlign: TextAlign.start,
                                        // overflow: TextOverflow.visible,
                                        style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400,
                                          color: AppColors.white,
                                        ),
                                      )
                                    : SelectableText(
                                        widget.outgoingMsgTx ?? '',
                                        // maxLines: showMore ? null : 8,
                                        textAlign: TextAlign.start,
                                        // overflow: TextOverflow.visible,
                                        style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400,
                                          color: AppColors.white,
                                        ),
                                      )
                                : const SizedBox.shrink(),
                            widget.outgoingMsgTx!.length > 200
                                ? InkWell(
                                    onTap: () {
                                      setState(() {
                                        showMore = !showMore;
                                      });
                                    },
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: <Widget>[
                                        showMore
                                            ? Text(
                                                "Show Less",
                                                style: TextStyle(
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w400,
                                                  color: AppColors.g2Color,
                                                ),
                                              )
                                            : Text(
                                                "Show More",
                                                style: TextStyle(
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w400,
                                                  color: AppColors.g2Color,
                                                ),
                                              ),
                                      ],
                                    ),
                                  )
                                : const SizedBox.shrink(),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                if (widget.isRead == true && widget.isLast == true) viewed(),
              ],
            )
          : widget.type == "url"
              ? GestureDetector(
                  onTap: () {},
                  // => Get.to(
                  //   CustomPhotoView(image: widget.mediaUrl ?? ''),
                  // ),
                  // Navigator.push(
                  //     context,
                  //     MaterialPageRoute(
                  //       builder: (ccontext) =>
                  //           CustomPhotoView(image: widget.mediaUrl ?? ''),
                  //     )),
                  child: Container(
                    margin: const EdgeInsets.all(6),
                    child: Stack(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.network(
                            widget.mediaUrl ?? '',
                            fit: BoxFit.cover,
                            height: AppGlobals.screenHeight * 0.2,
                            width: AppGlobals.screenWidth * 0.6,
                            errorBuilder: (context, url, error) {
                              return const Icon(
                                Icons.person,
                              );
                            },
                          ),
                        ),
                        Positioned(
                          top: 10,
                          right: 10,
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const Icon(
                                Icons.lock_clock,
                                size: 8,
                              ),
                              const SizedBox(width: 4),
                              Text(
                                widget.dataAndTimeTx ?? '',
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                  color: AppColors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              : widget.type == "assets"
                  ? Container(
                      margin: const EdgeInsets.all(6),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Image.asset(
                            widget.mediaUrl ?? '',
                            // fit: BoxFit.cover,
                            height: AppGlobals.screenHeight * 0.1,
                            width: AppGlobals.screenWidth * 0.6,
                            alignment: Alignment.centerRight,
                            errorBuilder: (context, url, error) {
                              return const Icon(
                                Icons.person,
                              );
                            },
                          ),
                          Padding(
                            padding: const EdgeInsets.all(2.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(
                                  Icons.lock_clock,
                                  size: 8,
                                  color: AppColors.textColor,
                                ),
                                const SizedBox(width: 4),
                                Text(
                                  widget.dataAndTimeTx ?? '',
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400,
                                    color: AppColors.textColor,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    )
                  : const SizedBox.shrink(),
    );
  }

  Widget viewed() => widget.isRead == true && widget.isLast == true
      ? Padding(
          padding: EdgeInsets.only(left: AppGlobals.screenWidth * 0.1 + 12.0),
          child: Text(
            'Viewed',
            style: TextStyle(
              fontSize: 11,
              fontWeight: FontWeight.w400,
              color: AppColors.textColor,
            ),
          ),
        )
      : const SizedBox.shrink();
}
