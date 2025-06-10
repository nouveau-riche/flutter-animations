import 'dart:math';

import 'package:flutter/material.dart';

class PlanetWidget extends StatefulWidget {
  final int id;
  final String name;
  final String image;
  final int durationOfRotation;
  final int distanceFromSun;
  final int orbitHorizontalRadius;
  final int orbitVerticalRadius;
  final double planetSize;
  final double axisTilt;

  const PlanetWidget({
    super.key,
    required this.id,
    required this.name,
    required this.durationOfRotation,
    required this.distanceFromSun,
    required this.orbitHorizontalRadius,
    required this.orbitVerticalRadius,
    required this.planetSize,
    this.axisTilt = 0,
    required this.image,
  });

  @override
  State<PlanetWidget> createState() => _PlanetWidgetState();
}

class _PlanetWidgetState extends State<PlanetWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> animation;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: widget.durationOfRotation),
    );

    animation = Tween<double>(begin: 0, end: 360).animate(controller)
      ..addListener(() {
        setState(() {});
      });

    controller.repeat();
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  Offset _getOffset(double angle) {
    return Offset(
      widget.orbitHorizontalRadius * cos(angle),
      widget.orbitVerticalRadius * sin(angle),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: widget.axisTilt,
      child: Stack(
        children: [
          Center(
            child: Container(
              height: widget.orbitVerticalRadius * 2,
              width: widget.orbitHorizontalRadius * 2,
              decoration: BoxDecoration(
                border: Border.all(width: 2, color: Colors.white54),
                borderRadius: BorderRadius.all(
                  Radius.elliptical(
                    widget.orbitHorizontalRadius * 2,
                    widget.orbitVerticalRadius * 2,
                  ),
                ),
              ),
            ),
          ),
          Transform.translate(
            offset: _getOffset(animation.value),
            child: Center(
              child: Transform.rotate(
                angle: animation.value,
                child: Image.asset(
                  widget.image,
                  height: widget.planetSize,
                  width: widget.planetSize,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
