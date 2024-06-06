// ignore_for_file: library_private_types_in_public_api
import 'dart:math';
import 'package:audioplayers/audioplayers.dart';
import 'package:bouncing/models/ball.dart';
import 'package:bouncing/utils/painter.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Bounce',
      home: Bounce(),
    );
  }
}

class Bounce extends StatefulWidget {
  const Bounce({super.key});

  @override
  _BounceState createState() => _BounceState();
}

class _BounceState extends State<Bounce> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  final List<Ball> _balls = [];
  final double _speed = 3.0;
  late double _circleCenterX = 0, _circleCenterY = 0, _circleRadius = 0;
  bool _isPlaying = false;
  int _ballCount = 1;
  final AudioPlayer _audioCache = AudioPlayer();

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 10),
    )..addListener(_updatePosition);

    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(() {
        _circleRadius = min(MediaQuery.of(context).size.width,
                    MediaQuery.of(context).size.height) /
                2 -
            40;
        _circleCenterX = MediaQuery.of(context).size.width / 2;
        _circleCenterY = MediaQuery.of(context).size.height / 3 -
            60; 
        _addBall();
      });
    });
  }

  double _randomVelocity(double speed) {
    final random = Random();
    final angle = random.nextDouble() * 2 * pi;
    return speed * cos(angle);
  }

  double _randomVelocityY(double speed) {
    final random = Random();
    final angle = random.nextDouble() * 2 * pi;
    return speed * sin(angle);
  }

  void _updatePosition() {
    List<Ball> newBalls = [];
    setState(() {
      for (var ball in _balls) {
        ball.updatePosition();

        final dx = ball.x - _circleCenterX;
        final dy = ball.y - _circleCenterY;
        final distance = sqrt(dx * dx + dy * dy);

        if (distance + ball.radius >= _circleRadius) {
          _audioCache.play(AssetSource('note.wav'));
          final normX = dx / distance;
          final normY = dy / distance;
          final dotProduct = ball.velocityX * normX + ball.velocityY * normY;

          ball.velocityX -= 2 * dotProduct * normX;
          ball.velocityY -= 2 * dotProduct * normY;

          ball.x = _circleCenterX + (_circleRadius - ball.radius) * normX;
          ball.y = _circleCenterY + (_circleRadius - ball.radius) * normY;

          newBalls.add(Ball(
            x: _circleCenterX,
            y: _circleCenterY,
            radius: 5.0,
            velocityX: _randomVelocity(_speed),
            velocityY: _randomVelocityY(_speed),
          ));
        }
      }
      _balls.addAll(newBalls);
      _ballCount += newBalls.length;
    });
  }

  void _addBall() {
    _balls.clear();
    _ballCount = 1;
    _balls.add(Ball(
      x: _circleCenterX,
      y: _circleCenterY,
      radius: 5.0,
      velocityX: _randomVelocity(_speed),
      velocityY: _randomVelocityY(_speed),
    ));
    setState(() {});
  }

  void _togglePlayPause() {
    setState(() {
      if (_isPlaying) {
        _controller.stop();
      } else {
        _controller.repeat();
      }
      _isPlaying = !_isPlaying;
    });
  }

  void _restart() {
    _controller.stop();
    _isPlaying = false;
    _addBall();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 1, 34, 92),
        foregroundColor: Colors.white,
        title: const Text(
          'Bounce',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const SizedBox(height: 20),
          Text(
            'Balls: $_ballCount',
            style: const TextStyle(
              color: Colors.black,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 20),
          CustomPaint(
            size: const Size(800, 400),
            painter: BallPainter(
              balls: _balls,
              circleCenterX: _circleCenterX,
              circleCenterY: _circleCenterY,
              circleRadius: _circleRadius,
            ),
          ),
          const SizedBox(height: 100),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                icon: Icon(
                  _isPlaying ? Icons.pause : Icons.play_arrow,
                  color: Colors.black,
                  size: 40,
                ),
                onPressed: _togglePlayPause,
              ),
              const SizedBox(width: 50),
              IconButton(
                icon: const Icon(
                  Icons.restart_alt,
                  color: Colors.black,
                  size: 40,
                ),
                onPressed: _restart,
              ),
            ],
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
