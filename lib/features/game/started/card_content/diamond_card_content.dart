import 'package:flutter/material.dart';

class DiamondCardContent extends StatelessWidget {
  final MaterialColor color;
  final double opacity;

  const DiamondCardContent({
    super.key,
    required this.color,
    required this.opacity,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      '♦️',
      style: TextStyle(
        color: color.withOpacity(opacity),
        fontSize: 18,
      ),
    );
  }
}
