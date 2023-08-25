import 'package:flutter/material.dart';

class VideoBackground extends StatelessWidget {
  const VideoBackground({super.key});

  @override
  Widget build(BuildContext context) {
    return const Positioned.fill(
        child: DecoratedBox(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: [Colors.black87, Colors.transparent],
                    stops: [0.8, 0.1],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter))));
  }
}
