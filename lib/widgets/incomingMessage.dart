import 'package:chat/constants/app_colors.dart';
import 'package:chat/constants/constants.dart';
import 'package:flutter/material.dart';

class IncomingMsgCard extends StatefulWidget {
  final String? incomingMsgTx;
  final String? dataAndTimeTx;
  final bool? isRead;
  final bool isMedia;
  final String? mediaUrl, userName, type;

  const IncomingMsgCard(
      {this.incomingMsgTx,
      this.dataAndTimeTx,
      this.isRead = false,
      this.mediaUrl,
      this.userName,
      this.isMedia = false,
      this.type});

  @override
  State<IncomingMsgCard> createState() => _IncomingMsgCardState();
}

class _IncomingMsgCardState extends State<IncomingMsgCard> {
  bool showMore = false;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: widget.type == "text"
          ? Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Flexible(
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    margin: const EdgeInsets.all(3),
                    // width: AppGlobals.screenWidth * 0.7,
                    decoration: BoxDecoration(
                      color: AppColors.messageBg,
                      borderRadius: const BorderRadius.only(
                        topRight: Radius.circular(10),
                        bottomRight: Radius.circular(10),
                        bottomLeft: Radius.circular(10),
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
                              Icons.lock_clock,
                              size: 8,
                            ),
                            const SizedBox(width: 4),
                            Text(
                              widget.dataAndTimeTx ?? '',
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                                color: AppColors.greyTextColor,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 6),
                        widget.incomingMsgTx != null
                            ? Padding(
                                padding: const EdgeInsets.only(left: 4.0),
                                child: widget.incomingMsgTx!.length >= 200 &&
                                        !showMore
                                    ? SelectableText(
                                        widget.incomingMsgTx!
                                                .substring(0, 200) +
                                            "....",
                                        // "${showMore ? '' : ' ....'}",
                                        // maxLines: showMore ? null : 8,
                                        textAlign: TextAlign.start,
                                        // overflow: TextOverflow.visible,
                                        style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400,
                                          color: AppColors.textColor,
                                        ),
                                      )
                                    : SelectableText(
                                        widget.incomingMsgTx ?? '',
                                        // maxLines: showMore ? null : 8,
                                        textAlign: TextAlign.start,
                                        // overflow: TextOverflow.visible,
                                        style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400,
                                          color: AppColors.textColor,
                                        ),
                                      ),
                              )
                            : const SizedBox.shrink(),
                        widget.incomingMsgTx!.length > 200
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
                SizedBox(width: AppGlobals.screenWidth * 0.1),
              ],
            )
          : widget.type == "url"
              ? GestureDetector(
                  onTap: () {},
                  // => Navigator.push(
                  //     context,
                  //     MaterialPageRoute(
                  //       builder: (ccontext) => CustomPhotoView(
                  //         image: widget.mediaUrl ?? '',
                  //         title: widget.userName,
                  //       ),
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
                                size: 8,
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
                                  color: AppColors.greyTextColor,
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
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.asset(
                            widget.mediaUrl ?? '',
                            // fit: BoxFit.cover,
                            height: AppGlobals.screenHeight * 0.1,
                            width: AppGlobals.screenWidth * 0.6,
                            alignment: Alignment.bottomLeft,
                            errorBuilder: (context, url, error) {
                              return const Icon(
                                Icons.person,
                                size: 8,
                              );
                            },
                          ),
                          Row(
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
                                  color: AppColors.textColor,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    )
                  : const SizedBox.shrink(),
    );
  }
}
