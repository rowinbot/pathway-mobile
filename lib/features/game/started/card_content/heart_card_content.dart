import 'package:flutter/material.dart';

class HeartCardContent extends StatelessWidget {
  final MaterialColor color;
  final double opacity;

  const HeartCardContent({
    super.key,
    required this.color,
    required this.opacity,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      '♥️',
      style: TextStyle(
        color: color.withOpacity(opacity),
        fontSize: 18,
      ),
    );
  }
}
