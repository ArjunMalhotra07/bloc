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
    catController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 300));
    catAnimation = Tween(begin: 500.0, end: 0.0)
        .animate(CurvedAnimation(parent: catController, curve: Curves.easeIn));
  }

  Widget buildCatAnimation() {
    return AnimatedBuilder(
        animation: catAnimation,
        builder: (context, child) {
          return Container(
              child: child, margin: EdgeInsets.only(top: catAnimation.value));
        },
        child: const Cat());
  }

  Widget box() {
    return Center(
        child: Container(height: 200, width: 200, color: Colors.brown));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: GestureDetector(
            onTap: () {
              if (catController.isCompleted) {
                catController.reverse();
              } else {
                catController.forward();
              }
            },
            child: Stack(
              alignment: Alignment.center,
              children: [buildCatAnimation(), box()],
            )));
  }
}
