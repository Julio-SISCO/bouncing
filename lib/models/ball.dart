// 
import 'dart:math';

import 'package:flutter/material.dart';

class Ball {
  Color color = _generateRandomColor();
  double x, y, radius;
  double velocityX, velocityY;

  Ball({
    required this.x,
    required this.y,
    required this.radius,
    required this.velocityX,
    required this.velocityY,
  });

  void updatePosition() {
    x += velocityX;
    y += velocityY;
  }
}

Color _generateRandomColor() {
  final Random random = Random();
  return Color.fromRGBO(
      random.nextInt(256), random.nextInt(256), random.nextInt(256), 1);
}
