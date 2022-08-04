import 'dart:io';
import 'package:chat/Services/firebaseServices/firebaseStorage/firebaseStorage.dart';
import 'package:chat/UI/Images/imageDetailPage.dart';
import 'package:chat/helper/imagePicker.dart';
import 'package:chat/model/imageUrl.dart';
import 'package:flutter/material.dart';

class AllImage extends StatefulWidget {
  AllImage({this.file, Key? key}) : super(key: key);
  File? file;
  @override
  _ImageState createState() => _ImageState();
}

class _ImageState extends State<AllImage> {
  bool isLoading = true;
  File? file;
  List<String>? imagesUrl;
  List<ImageModel> url = [];
  @override
  void initState() {
    super.initState();
    getImage();
  }

  void getImage() async {
    url = await FirebaseStorageService().loadImages();
    //  if(url)
    isLoading = false;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          (isLoading)
              ? const Expanded(
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                )
              : Expanded(
                  child: Container(
                    // color: Colors.green,
                    padding: const EdgeInsets.all(10),
                    // child: imageuilder(widget.file!),
                    child: GridView.builder(
                        gridDelegate:
                            const SliverGridDelegateWithMaxCrossAxisExtent(
                                maxCrossAxisExtent: 300,
                                childAspectRatio: 5,
                                mainAxisExtent: 300,
                                crossAxisSpacing: 5,
                                mainAxisSpacing: 5
                                // crossAxisCount: 3,
                                //childAspectRatio: 2,
                                //crossAxisSpacing: 5,
                                //mainAxisExtent: 300,
                                //  mainAxisSpacing: 5,
                                ),
                        shrinkWrap: true,
                        itemCount: url.length,
                        itemBuilder: (BuildContext context, index) {
                          if (url.isEmpty) {
                            return const Text("no Images added");
                          } else {
                            return imageuilder(url[index]);
                          }
                          //    BoxDecoration(borderRadius: BorderRadius.circular(20)),
                        }),
                  ),
                ),
          // Align(
          //   alignment: Alignment.bottomCenter,
          //   child: GestureDetector(
          //     onTap: () async {
          //       file = await Imagepicker().pickImage(false, context);
          //       setState(() {});
          //       FirebaseStorageService()
          //           .uploadImage(file, "user1", "test Images");
          //     },
          //     child: Container(
          //       margin: const EdgeInsets.symmetric(vertical: 20),
          //       decoration: BoxDecoration(
          //         borderRadius: BorderRadius.circular(50),
          //         color: Theme.of(context).primaryColor,
          //       ),
          //       height: 50,
          //       width: 50,
          //       child: const Icon(
          //         Icons.image,
          //         color: Colors.white,
          //       ),
          //     ),
          //   ),
          // ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,
      floatingActionButton: FloatingActionButton(
        // foregroundColor: Colors.,

        onPressed: () async {
          file = await Imagepicker().pickImage(false, context);
          setState(() {});
          FirebaseStorageService().uploadImage(file, "user1", "test Images");
        },
        tooltip: 'Upload Image',
        child: const Icon(Icons.image),
      ),
    );
  }

  Widget imageuilder(ImageModel file) {
    return Card(
      elevation: 5,
      //color: Colors.blue,
      shadowColor: Colors.transparent,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => ImageDetailPage(imageModel: file)));
        },
        child: ClipRRect(
          child: Image.network(
            file.url.toString(),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
