import 'package:bouncing/models/ball.dart';
import 'package:flutter/material.dart';

class BallPainter extends CustomPainter {
  final List<Ball> balls;
  final double circleCenterX, circleCenterY, circleRadius;
  final Color backgroundColor;
  final Color borderColor;
  final double borderWidth;

  BallPainter({
    required this.balls,
    required this.circleCenterX,
    required this.circleCenterY,
    required this.circleRadius,
    this.backgroundColor = Colors.transparent,
    this.borderColor = Colors.black,
    this.borderWidth = 2.0,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final backgroundPaint = Paint()
      ..color = backgroundColor
      ..style = PaintingStyle.fill;

    final borderPaint = Paint()
      ..color = borderColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = borderWidth;

    // Dessiner le cercle avec la couleur de fond
    canvas.drawCircle(
        Offset(circleCenterX, circleCenterY), circleRadius, backgroundPaint);

    // Dessiner la bordure du cercle
    canvas.drawCircle(
        Offset(circleCenterX, circleCenterY), circleRadius, borderPaint);

    // Dessiner les balles
    for (var ball in balls) {
      final ballPaint = Paint()..color = ball.color;
      canvas.drawCircle(Offset(ball.x, ball.y), ball.radius, ballPaint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
