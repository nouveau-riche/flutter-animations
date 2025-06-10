import 'package:flutter/material.dart';

class RotateContainer extends StatefulWidget {
  const RotateContainer({super.key});

  @override
  State<RotateContainer> createState() => _RotateContainerState();
}

class _RotateContainerState extends State<RotateContainer>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> animation;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    );

    animation = Tween<double>(begin: 0, end: 360).animate(controller)
      ..addListener(() {
        setState(() {});
        if (animation.isCompleted) {
          controller.reverse();
        }
      });

    controller.forward();
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: animation.value,
      child: Center(
        child: Container(height: 300, width: 300, color: Colors.green),
      ),
    );
  }
}
