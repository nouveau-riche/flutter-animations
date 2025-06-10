import 'package:flutter/material.dart';

import 'package:animations_learning/generated/assets.dart';

class MeteorWidget extends StatefulWidget {
  const MeteorWidget({super.key});

  @override
  State<MeteorWidget> createState() => _MeteorWidgetState();
}

class _MeteorWidgetState extends State<MeteorWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> animation;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 10),
    );

    animation = Tween<double>(begin: -1, end: 1).animate(
      CurvedAnimation(parent: controller, curve: Curves.bounceIn),
    )..addListener(() {
      setState(() {});
    });

    controller.repeat();
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment(animation.value, animation.value),
      child: Image.asset(Assets.assetsMeteor, height: 80, width: 80),
    );
  }
}
