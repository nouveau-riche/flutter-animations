import 'package:flutter/material.dart';

import 'package:animations_learning/generated/assets.dart';
import 'package:animations_learning/solar_system/widget/planet.dart';
import 'package:animations_learning/solar_system/widget/meteor_animation.dart';

class SolarSystemScreen extends StatelessWidget {
  const SolarSystemScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            Assets.assetsGalaxy,
            height: double.infinity,
            width: double.infinity,
            fit: BoxFit.fill,
          ),
          Center(child: Image.asset(Assets.assetsSun, height: 100, width: 100)),
          PlanetWidget(
            id: 1,
            name: 'Mercury',
            image: Assets.assetsMercury,
            durationOfRotation: 440,
            distanceFromSun: 60,
            orbitHorizontalRadius: 150,
            orbitVerticalRadius: 80,
            planetSize: 22,
            axisTilt: 0,
          ),
          PlanetWidget(
            id: 2,
            name: 'Venus',
            image: Assets.assetsVenus,
            durationOfRotation: 680,
            distanceFromSun: 100,
            orbitHorizontalRadius: 220,
            orbitVerticalRadius: 120,
            planetSize: 38,
          ),
          PlanetWidget(
            id: 3,
            name: 'Earth',
            image: Assets.assetsEarth,
            durationOfRotation: 860,
            distanceFromSun: 150,
            orbitHorizontalRadius: 280,
            orbitVerticalRadius: 160,
            planetSize: 34,
          ),
          PlanetWidget(
            id: 4,
            name: 'Mars',
            image: Assets.assetsMars,
            durationOfRotation: 970,
            distanceFromSun: 200,
            orbitHorizontalRadius: 330,
            orbitVerticalRadius: 190,
            planetSize: 30,
            axisTilt: 00,
          ),
          PlanetWidget(
            id: 5,
            name: 'Jupiter',
            image: Assets.assetsJupiter,
            durationOfRotation: 1070,
            distanceFromSun: 270,
            orbitHorizontalRadius: 390,
            orbitVerticalRadius: 240,
            planetSize: 44,
            axisTilt: 0,
          ),
          PlanetWidget(
            id: 6,
            name: 'Saturn',
            image: Assets.assetsSaturn,
            durationOfRotation: 1111,
            distanceFromSun: 280,
            orbitHorizontalRadius: 380,
            orbitVerticalRadius: 220,
            planetSize: 46,
            axisTilt: 20,
          ),
          MeteorWidget(),
        ],
      ),
    );
  }
}
