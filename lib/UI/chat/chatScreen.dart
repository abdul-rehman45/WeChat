import 'package:chat/Services/firebaseServices/firebaseChatSerive/chatService.dart';
import 'package:chat/UI/chat/send_message_field.dart';
import 'package:chat/constants/app_colors.dart';
import 'package:chat/constants/constants.dart';
import 'package:chat/helper/convertDate.dart';
import 'package:chat/widgets/incomingMessage.dart';
import 'package:chat/widgets/outgoingMessages.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({this.name, Key? key}) : super(key: key);
  final String? name;

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final ScrollController _scrollViewController = ScrollController();
  bool _showSearch = true;
  bool isScrollingDown = false;
  bool _showemoji = false;
  final bool _isReadLast = false;
  String? chatId;
  // String message = '';
  final TextEditingController _messageController = TextEditingController();
  final TextEditingController _searchController = TextEditingController();

  final FirebaseFirestore firestoreInstance = FirebaseFirestore.instance;
  final List<QueryDocumentSnapshot> _searchResults = [];
  List<QueryDocumentSnapshot> _allMessages = [];

  @override
  void initState() {
    super.initState();
    _addScrollListener();
    _createChatId();

    // chkFirebaseUSer();
    // checkChatExist();
    //show at the bottom of chat // end of list at start
    // WidgetsBinding.instance!.addPostFrameCallback((_) {
    //   _scrollViewController
    //       .jumpTo(_scrollViewController.position.maxScrollExtent);
    // });
  }

  _addScrollListener() {
    _scrollViewController.addListener(() {
      if (_scrollViewController.position.userScrollDirection ==
          ScrollDirection.reverse) {
        // if user is going down
        if (!isScrollingDown) {
          // if user is scrolling down
          isScrollingDown = true;
          _showSearch = false;
          // setState(() {});
        }
      }

      if (_scrollViewController.position.userScrollDirection ==
          ScrollDirection.forward) {
        // if user is going up
        if (isScrollingDown) {
          // if user is scrolling up
          isScrollingDown = false;
          _showSearch = true;
          // setState(() {});
        }
      }
    });
  }

  _createChatId() {
    chatId = "rehman-usman";
    // chatId = "${widget.userId}-213";
    print('chatId: $chatId');
  }
  // _readChat() {
  //   if (chatId != null) {
  //     firestoreInstance
  //         .collection('inbox/messages/${widget.userId}')
  //         .doc(AppGlobals.userId.toString())
  //         .snapshots()
  //         .listen((event) {
  //       //print('event: ${event.data()}');
  //       Map<String, dynamic>? data = event.data() as Map<String, dynamic>;
  //       if (data != null) {
  //         int? unread = data['unreadCount'];
  //         if (unread != null && unread == 0) {
  //           _isReadLast = true;
  //         } else {
  //           _isReadLast = false;
  //         }
  //       }
  //     });
  //     // _setState();

  //     // set reading status to true in my inbox
  //     firestoreInstance
  //         .collection('inbox/messages/${AppGlobals.userId}')
  //         .doc(widget.userId.toString())
  //         .update({"unreadCount": 0});
  //   }
  // }

  void _setState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // centerTitle: true,
        title: Text(
          widget.name!,
        ),
      ),
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            showChatMessages(),
            SendMessageField(
              onEmojiTap: () {
                FocusManager.instance.primaryFocus?.unfocus();

                setState(() {
                  _showemoji = !_showemoji;
                });
              },
              onFileTap: () {
                setState(() {
                  if (_showemoji == false) {
                  } else {
                    _showemoji = !_showemoji;
                  }
                });
                _showImagePickerDialog(context);
              },
              controller: _messageController,
              keyPadTapped: () {
                setState(() {
                  if (_showemoji == false) {
                  } else {
                    _showemoji = !_showemoji;
                  }
                });
              },
              sendTap: () {
                String? message = _messageController.text.trim();
                if (message.isNotEmpty) {
                  ChatService().sendMessage(
                    "text",
                    chatId: '$chatId',
                    // url: '',
                    message: message,
                    userid: AppGlobals.username,
                    name: widget.name,
                    image: "",
                  );
                  scrollToBottom(_scrollViewController);
                  setState(() {
                    _messageController.text = '';
                  });
                }
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget showChatMessages() {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: StreamBuilder<QuerySnapshot>(
          stream: firestoreInstance
              .collection("Chat/Chatting/" "$chatId")
              .orderBy('time', descending: true)
              .snapshots(),
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            // if (snapshot.hasError) return new Text('Error: ${snapshot.error}');
            // switch (snapshot.connectionState) {
            //   case ConnectionState.waiting:
            //     return new Text('Loading...',style: TextStyle(color: _themeChanger.textColor()),);
            //   default:
            //     if (snapshot.data.documents.isEmpty) {
            //       //Future.delayed(Duration(seconds: 1), () {});
            //     }
            if (!snapshot.hasData) {
              return const Center(child: CircularProgressIndicator());
            }
            if (snapshot.hasError) {
              return Center(
                child: Text(
                  "Error: ${snapshot.error}", //AppStrings.somethingWrong,
                  style: TextStyle(
                    fontSize: 14,
                    color: AppColors.textColor,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              );
            } else {
              if (snapshot.data != null) {
                if (snapshot.data!.docs.isNotEmpty) {
                  _allMessages = List.from(snapshot.data!.docs);
                  scrollToBottom(_scrollViewController);
                  //_readChat();

                  return _searchResults.isNotEmpty ||
                          _searchController.text.isNotEmpty
                      ? _messagesListView(_searchResults)
                      : _messagesListView(snapshot.data!.docs);
                } else {
                  return _noMessages();
                }
              } else {
                return _noMessages();
              }
            }
          },
        ),
      ),
    );
  }

  Widget _messagesListView(List<QueryDocumentSnapshot> snapshotDocs) {
    List list = List.from(snapshotDocs.reversed);

    int firstIndex = list.indexWhere((element) {
      Map data = element.data() as Map<String, dynamic>;
      // print("uid: ${data['uid']}");
      return data["uid"] == AppGlobals.username;
    });
    // print("snapshotDocs: ${snapshotDocs.length} firstIndex: $firstIndex");

    return ListView.builder(
      controller: _scrollViewController,
      itemCount: snapshotDocs.length,
      shrinkWrap: true,
      reverse: true,
      physics: const ScrollPhysics(),
      itemBuilder: (BuildContext context, int index) {
        Map data = snapshotDocs[index].data() as Map<String, dynamic>;

        Timestamp timestamp = data['time'];
        DateTime dateTime = timestamp.toDate();
        String? msgTime = ConvertDate.formatTime(dateTime.toString());
        bool lastMsg = false;

        print("firstIndex $firstIndex, index: $index");
        if (data["uid"] == AppGlobals.username) {
          return OutgoingMsgCard(
            outgoingMsgTx: data["msg"],
            dataAndTimeTx: msgTime,
            mediaUrl: data["msg"],
            type: data["type"],
            isMedia: data["type"] == "text" ? false : true,
            isLast: // firstIndex != -1,
                index == (firstIndex - 1) ? true : false,
            isRead: _isReadLast,
          );
        } else {
          print(".....................#######${data["uid"]}");
          return IncomingMsgCard(
            userName: data["sendby"],
            incomingMsgTx: data["msg"],
            dataAndTimeTx: msgTime,
            isRead: data["isRead"],
            isMedia: data["type"] == "text" ? false : true,
            mediaUrl: data["msg"],
            type: data["type"],
          );
        }
      },
    );
  }

  onSearchTextChanged(String text) async {
    _searchResults.clear();
    if (text.isEmpty) {
      setState(() {});
      return;
    }

    for (var msg in _allMessages) {
      Map data = msg.data() as Map<String, dynamic>;
      if (data['msg'] != null) {
        String msgText = (data["msg"]).toLowerCase();
        String query = text.trim().toLowerCase();

        if (msgText.startsWith(query) || msgText.contains(query)) {
          _searchResults.add(msg);
        }
      }
    }

    setState(() {});
  }

  Widget _noMessages() {
    return Center(
      child: Text(
        "......sed No Message",
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 14,
          color: AppColors.textColor,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }

  // _goToBottom() {
  //   // _scrollViewController
  //   //     .jumpTo(_scrollViewController.position.maxScrollExtent);
  //   _scrollViewController.animateTo(
  //     _scrollViewController.position.maxScrollExtent,
  //     duration: Duration(milliseconds: 50),
  //     curve: Curves.easeInOut,
  //   );
  // }

  Future scrollToBottom(ScrollController controller) async {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      // while (scrollController.position.pixels !=
      //     scrollController.position.maxScrollExtent) {
      if (controller.hasClients) {
        // controller.jumpTo(controller.position.maxScrollExtent);
        controller.jumpTo(0);
      } else {
        // setState(() => null);
      }
      // controller.jumpTo(controller.position.maxScrollExtent);
      // }
    });
    // await SchedulerBinding.instance!.endOfFrame;
  }

  // @override
  // void dispose() {
  //   // _scrollViewController.dispose();
  //   // _scrollViewController.removeListener(() {});
  //   super.dispose();
  // }

  void deleteAllChat() async {
    showDialog(
      context: context,
      barrierDismissible: false,
      barrierColor: AppColors.g3Color.withOpacity(0.5),
      builder: (scontext) => Container(),
      //  CustomDialog(
      //   iconPath: AppImages.dog38,
      //   title: 'Are you sure you want to delete all messages?',
      //   leftButtonTitle: 'NO',
      //   rightButtonTitle: "YES",
      //   onRightButtonTap: () {},
      //   // async {
      //   //   Navigator.pop(context);
      //   //   ChatService()
      //   //       .deleteChat(chatId: chatId, userId: widget.userId.toString());
      //   // },
      // ),
    );
  }

  void unMatch() async {
    showDialog(
      context: context,
      barrierDismissible: false,
      barrierColor: AppColors.g3Color.withOpacity(0.5),
      builder: (scontext) => Container(),
      // CustomDialog(
      //   iconPath: AppImages.dog38,
      //   title: 'Are you sure you want to Unmatch?',
      //   leftButtonTitle: 'NO',
      //   rightButtonTitle: "YES",
      //   onRightButtonTap: () {},
      //   async {
      //     Navigator.pop(context);
      //     var res = await UserMatches.unMatch(
      //         widget.userId!.toInt(), "I don't like anymore");
      //     if (res == true) {
      //       final navServices = Get.find<NavBarService>();
      //       navServices.navIndex.value = 3;
      //       Get.offAll(
      //         () => Home(),
      //       );
      //     }
      //   },
      // ),
    );
  }

  void reportAndBlock() {
    showDialog(
        context: context,
        barrierDismissible: false,
        barrierColor: AppColors.g3Color.withOpacity(0.5),
        builder: (context) {
          return Container();
          //  BlockAndReportDialog(
          //   leftButtonTitle: 'NO',
          //   rightButtonTitle: "YES",
          //   reportUserId: widget.userId,
          // );
        });
  }

  // void _showCustomBottomSheet(BuildContext ctx) {
  //   showModalBottomSheet(
  //       elevation: 10,
  //       backgroundColor: Colors.amber,
  //       context: ctx,
  //       builder: (ctx) => Container(
  //             width: 300,
  //             height: 250,
  //             color: Colors.white54,
  //             alignment: Alignment.center,
  //             child: const Text('Breathe in... Breathe out...'),
  //           ));
  // }

  _showImagePickerDialog(BuildContext context) {
    bool fromTop = true;
    showGeneralDialog(
      barrierLabel: "Image Picker",
      barrierDismissible: true,
      barrierColor: AppColors.g3Color.withOpacity(0.5),
      transitionDuration: const Duration(milliseconds: 400),
      context: context,
      transitionBuilder: (context, anim1, anim2, child) {
        return SlideTransition(
          position: Tween(
            begin: Offset(0, fromTop ? -1 : 1),
            end: const Offset(0, 0),
          ).animate(anim1),
          child: child,
        );
      },
      pageBuilder: (context, anim1, anim2) {
        return Container();
        // ChatImagePicker(
        //   fromTop: _fromTop,
        // );
      },
    );
  }
}
