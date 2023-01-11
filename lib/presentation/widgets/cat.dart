import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class Cat extends StatelessWidget {
  const Cat({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 300,
        width: 300,
        child: Image.network('https://i.imgur.com/QwhZRyL.png'));
  }
}
