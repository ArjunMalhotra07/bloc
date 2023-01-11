import 'package:flutter/material.dart';
import 'package:test/presentation/widgets/cat.dart';

class AnimationScreen extends StatefulWidget {
  const AnimationScreen({super.key});

  @override
  State<AnimationScreen> createState() => _AnimationScreenState();
}

class _AnimationScreenState extends State<AnimationScreen>
    with TickerProviderStateMixin {
  late Animation<double> catAnimation;
  late AnimationController catController;
  @override
  void initState() {
    super.initState();
    catController =
        AnimationController(vsync: this, duration: const Duration(seconds: 3));
    catAnimation = Tween(begin: 0.0, end: 500.0).animate(
        CurvedAnimation(parent: catController, curve: Curves.bounceOut));
    catController.forward();
  }

  Widget buildCatAnimation() {
    return AnimatedBuilder(
        animation: catAnimation,
        builder: (context, child) {
          return Container(
              margin: EdgeInsets.only(top: catAnimation.value), child: child);
        },
        child: const Center(
          child: Text(
            "Welcome Back",
            style: TextStyle(fontSize: 20),
          ),
        ));
  }

  Widget box() {
    return Center(
        child: Container(height: 200, width: 200, color: Colors.brown));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Stack(
          alignment: Alignment.center,
          children: [
            buildCatAnimation(),
          ],
        ));
  }
}
