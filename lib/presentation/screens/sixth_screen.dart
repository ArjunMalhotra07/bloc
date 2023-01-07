import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' show get;
import 'package:test/logic/models/image_model.dart';

class SixthScreen extends StatefulWidget {
  const SixthScreen({super.key, required this.color});
  final Color color;

  @override
  State<SixthScreen> createState() => _SixthScreenState();
}

class _SixthScreenState extends State<SixthScreen> {
  var counter = 0;
  List<ImageModel> images = [];
  void fetchImage() async {
    counter += 1;
    final rawJson = await get(
        Uri.parse('https://jsonplaceholder.typicode.com/photos/$counter'));
    final parsedJson = json.decode(rawJson.body);
    final imageModelObject = ImageModel.fromJson(parsedJson);
    debugPrint(imageModelObject.id.toString());
    debugPrint(imageModelObject.title);
    setState(() {
      images.add(imageModelObject);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            automaticallyImplyLeading: false,
            title: const Text(
              'Screen 6',
              style: TextStyle(color: Colors.black),
            ),
            centerTitle: true,
            backgroundColor: widget.color),
        body: Center(
          child: ImageList(images: images),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: fetchImage,
        ));
  }
}

class ImageList extends StatelessWidget {
  final List<ImageModel> images;
  const ImageList({Key? key, required this.images}) : super(key: key);
  Widget buildImage(ImageModel image) => Container(
      decoration: BoxDecoration(border: Border.all(color: Colors.pink)),
      margin: const EdgeInsets.all(20.0),
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          Image(image: NetworkImage(image.url)),
          const SizedBox(
            height: 20,
          ),
          Text(image.title)
        ],
      ));
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        physics: const BouncingScrollPhysics(),
        itemCount: images.length,
        itemBuilder: ((context, index) => buildImage(images[index])));
  }
}
