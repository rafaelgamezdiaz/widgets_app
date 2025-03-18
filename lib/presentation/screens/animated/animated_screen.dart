import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'dart:math' show Random;

class AnimatedScreen extends StatefulWidget {
  static const String name = 'animated_screen';

  const AnimatedScreen({super.key});

  @override
  State<AnimatedScreen> createState() => _AnimatedScreenState();
}

class _AnimatedScreenState extends State<AnimatedScreen> {
  double width = 50;
  double height = 50;
  Color color = Colors.indigo;
  double borderRadius = 10;

  void changFigureProperties() {
    final Random random = Random();
    setState(() {
      width = random.nextInt(300) + 50;
      height = random.nextInt(450) + 50;
      color = Color.fromRGBO(
        random.nextInt(255),
        random.nextInt(255),
        random.nextInt(255),
        random.nextInt(10) / 10,
      );
      borderRadius = random.nextInt(40).toDouble() + 5.0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Animated Screen')),
      body: Center(
        child: AnimatedContainer(
          width: width,
          height: height,
          curve: Curves.easeInOut,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(borderRadius),
          ),
          duration: const Duration(milliseconds: 400),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: changFigureProperties,
        child: const Icon(Icons.play_arrow),
      ),
    );
  }
}
