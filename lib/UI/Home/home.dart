import 'package:chat/UI/chat/chatList.dart';
import 'package:chat/UI/chat/chatScreen.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({this.name, Key? key}) : super(key: key);
  final String? name;
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "WeChat",
        ),
      ),
      body: MessageTile(
          name: widget.name,
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => ChatScreen(
                          name: widget.name,
                        )));
          }),
    );
  }
}
