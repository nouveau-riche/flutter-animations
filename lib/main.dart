import 'package:flutter/material.dart';

import 'package:animations_learning/solar_system/solar_system_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Solar System Animation',
      home: const SolarSystemScreen(),
    );
  }
}
