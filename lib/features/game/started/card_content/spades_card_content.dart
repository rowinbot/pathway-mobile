import 'package:flutter/material.dart';

class SpadesCardContent extends StatelessWidget {
  final MaterialColor color;
  final double opacity;

  const SpadesCardContent({
    super.key,
    required this.color,
    required this.opacity,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      '♠️',
      style: TextStyle(
        color: color.withOpacity(opacity),
        fontSize: 18,
      ),
    );
  }
}
