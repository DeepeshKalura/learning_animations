import 'dart:math' show pi;

import 'package:flutter/material.dart';

class SquarePage extends StatefulWidget {
  const SquarePage({super.key});

  static const double squareSide = 100;

  @override
  State<SquarePage> createState() => _SquarePageState();
}

class _SquarePageState extends State<SquarePage>
    with SingleTickerProviderStateMixin {
  late AnimationController _rotatingController;

  @override
  void initState() {
    super.initState();
    _rotatingController = AnimationController(
        vsync: this,
        duration: const Duration(seconds: 2),
        animationBehavior: AnimationBehavior.preserve);
  }

  @override
  Widget build(BuildContext context) {
    _rotatingController.reverse();
    _rotatingController.repeat();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Square'),
      ),
      body: AnimatedBuilder(
          animation: _rotatingController,
          builder: (context, child) {
            return Transform(
              transform: Matrix4.rotationY(pi * _rotatingController.value)
                ..rotateX(pi / 2 * _rotatingController.value)
                ..rotateZ(pi / 2 * _rotatingController.value),
              alignment: Alignment.center,
              child: Center(
                child: Container(
                  height: SquarePage.squareSide,
                  width: SquarePage.squareSide,
                  color: Colors.red,
                ),
              ),
            );
          }),
    );
  }
}
