import 'package:flutter/material.dart';

class ImageModel {
  String title;
  int id;
  String url;
  ImageModel(this.id, this.title, this.url);

  ImageModel.fromJson(parsedJson)
      : id = parsedJson['id'],
        title = parsedJson['title'],
        url = parsedJson['url'];
}
