import 'package:chat/model/imageUrl.dart';
import 'package:flutter/material.dart';

class ImageDetailPage extends StatefulWidget {
  const ImageDetailPage({this.imageModel, Key? key}) : super(key: key);
  final ImageModel? imageModel;

  @override
  _ImageDetailPageState createState() => _ImageDetailPageState();
}

class _ImageDetailPageState extends State<ImageDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.imageModel!.name!),
        ),
        body: SingleChildScrollView(
          child: Container(
            margin: const EdgeInsets.only(bottom: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                      bottomRight: Radius.circular(10),
                      bottomLeft: Radius.circular(10)),
                  child: Image.network(
                    widget.imageModel!.url!,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text("Path: " + widget.imageModel!.path!.toString()),
                const SizedBox(
                  height: 10,
                ),
                Text("Discription: " +
                    widget.imageModel!.description!.toString()),
                const SizedBox(
                  height: 10,
                ),
                Text("uploaded By: " +
                    widget.imageModel!.uploadedBy!.toString()),
              ],
            ),
          ),
        ));
  }
}
