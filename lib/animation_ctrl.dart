import 'package:flutter/material.dart';

class AnimationCtrl extends StatefulWidget {
  const AnimationCtrl({super.key});

  @override
  State<AnimationCtrl> createState() => _AnimationCtrlState();
}

class _AnimationCtrlState extends State<AnimationCtrl>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> animation;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 4),
    );

    animation =
        Tween<double>(begin: 0, end: 300).animate(controller)
          ..addListener(() {
            print(animation.value);
            setState(() {});
          })
          ..addStatusListener((status) {
            if (status == AnimationStatus.dismissed) {
              controller.forward();
            } else if (status == AnimationStatus.completed) {
              controller.reverse();
            }
          });
    controller.forward();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 10),
        // height: 300,
        // width: 300,
        height: animation.value,
        width: animation.value,
        child: const FlutterLogo(),
      ),
    );
  }
}
